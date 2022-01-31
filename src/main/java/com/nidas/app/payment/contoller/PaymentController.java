package com.nidas.app.payment.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nidas.app.etc.util.CartCombiner;
import com.nidas.app.payment.service.PaymentService;
import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.product.vo.ProductVO;

@Controller
public class PaymentController {

	@Autowired PaymentService payDAO;
	
	@GetMapping("cart.do")
	private String cart(HttpServletRequest req, Model model){
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		Object authenObj = authen.getPrincipal();
		Map<String, Object> map = new HashMap<>();
		List<CartVO> cartInfo;
		List<ProductVO> prodInfo = null;
		// 회원 처리
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			cartInfo = payDAO.selectCart(userName);
			map.put("id", userName);
		// 비회원 처리
		} else {
			HttpSession session = req.getSession();
			cartInfo = (List<CartVO>)session.getAttribute("anonymCart");
			map.put("id", "");
		}
		// 공통 처리
		if (cartInfo != null) {
			map.put("list", cartInfo);
			prodInfo = payDAO.selectCartProdList(map);
			model.addAttribute("prodInfo", prodInfo);
		}

		return "payment/cart";
	}

	@PostMapping("addCart.do") @ResponseBody
	private String addCart(HttpServletRequest req, @RequestBody CartVO cartVO ){
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		// 회원 처리. DB insert 혹은 update
		Object authenObj = authen.getPrincipal();
		int size = 0;
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			payDAO.insertCart(userName, cartVO.getCartList());
		// 비회원 처리. 세션에 insert 혹은 update
		} else {
			HttpSession session = req.getSession();
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			if (CollectionUtils.isEmpty(anonymCart)) { // 세션값이 없으면
				session.setAttribute("anonymCart", cartVO.getCartList());
			} else { // 있으면 기존 값에 추가 추가
				session.setAttribute("anonymCart", CartCombiner.combine(anonymCart, cartVO.getCartList()));
			}
			size = ((List<CartVO> )session.getAttribute("anonymCart")).size();
		}
		return ""+size+"";
	}
	
	@PostMapping("cartStockUpdate.do") @ResponseBody
	private String cartStockUpdate(HttpServletRequest req, CartVO cartVO) {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		Object authenObj = authen.getPrincipal();
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			payDAO.updateCart(userName, cartVO);
		} else {
			HttpSession session = req.getSession();
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			for(CartVO vo : anonymCart) {
				if (vo.getSerial().equals(cartVO.getSerial()) && vo.getShoeSize().equals("s"+cartVO.getShoeSize()) ) {
					vo.setQuantity(cartVO.getQuantity());
					break;
				}	
			}
			session.setAttribute("anonymCart", anonymCart);
		}
		return null;
	}
	
	@PostMapping("cartStockDelete.do") @ResponseBody
	private String cartStockDelete(HttpServletRequest req, CartVO cartVO) {
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		Object authenObj = authen.getPrincipal();
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			payDAO.deleteCart(userName, cartVO);
		} else {
			HttpSession session = req.getSession();
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			for(CartVO vo : anonymCart) {
				if (vo.getSerial().equals(cartVO.getSerial()) && vo.getShoeSize().equals("s"+cartVO.getShoeSize()) ) {
					anonymCart.remove(vo);
					break;
				}
			}
			session.setAttribute("anonymCart", anonymCart);
		}
		return null;
	}
	
	@PostMapping("insertOrder.do") @ResponseBody
	private int insertOrder(HttpServletRequest req) {
		String address = req.getParameter("address");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String needs = req.getParameter("needs");
		HttpSession session = req.getSession();
		
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		Object authenObj = authen.getPrincipal();
		Map<String, Object> map = new HashMap<>();
		// 회원 처리
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			map.put("id", userName);
		// 비회원 처리
		} else {
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			map.put("id", "");
			map.put("list", anonymCart);
			session.removeAttribute(name);
		}
		map.put("tel", tel);
		map.put("needs", needs);
		map.put("address", address);
		map.put("name", name);
		payDAO.insertOrder(map);
		session.removeAttribute("anonymCart");
		
		return 0;
	}
	
}
