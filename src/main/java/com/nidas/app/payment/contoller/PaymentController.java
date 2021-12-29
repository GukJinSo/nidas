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
		//TODO 변수 정리, 분기 처리 필요
		// 회원 처리
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		Object authenObj = authen.getPrincipal();
		List<CartVO> cartInfo;
		List<String> cartSerial;
		List<ProductVO> prodInfo;
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			cartInfo = payDAO.selectCart(userName);
			cartSerial = new ArrayList<String>();
			for(int i = 0; i < cartInfo.size(); i++) {
				cartSerial.add( cartInfo.get(i).getSerial() );
			}
			prodInfo = payDAO.selectCartProdList(cartSerial);
			model.addAttribute("cartInfo", payDAO.selectCart(userName));
			model.addAttribute("");
		// 비회원 처리
		} else {
			HttpSession session = req.getSession();
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			if (anonymCart != null) {
				model.addAttribute("cartInfo", anonymCart);
			}
				
		}
		return "payment/cart";
	}

	@PostMapping("addCart.do") @ResponseBody
	private String addCart(HttpServletRequest req, @RequestBody CartVO cartVO ){
		Authentication authen = SecurityContextHolder.getContext().getAuthentication();
		// 회원 처리. DB insert 혹은 update
		Object authenObj = authen.getPrincipal();
		System.out.println(cartVO.getCartList().size());
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
	
}
