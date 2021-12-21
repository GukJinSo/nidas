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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nidas.app.etc.util.CartCombiner;
import com.nidas.app.payment.service.PaymentService;
import com.nidas.app.payment.vo.CartVO;

@Controller
public class PaymentController {


	Authentication authen = SecurityContextHolder.getContext().getAuthentication();
	@Autowired PaymentService payDAO;
	
	@GetMapping("cart.do")
	private String cart(HttpServletRequest req, Model model){
		// 회원 처리
		Object authenObj = authen.getPrincipal();
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			model.addAttribute(payDAO.selectCart(userName));
		// 비회원 처리
		} else {
			HttpSession session = req.getSession();
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			model.addAttribute(anonymCart);
		}
		return "payment/cart";
	}

	@GetMapping("addCart.do") @ResponseBody
	private String addCart(HttpServletRequest req, @RequestParam(value="cartList") List<CartVO> inputCart ){
		
		// 회원 처리. DB insert 혹은 update
		Object authenObj = authen.getPrincipal();
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			payDAO.insertCart(userName, inputCart);
		// 비회원 처리. 세션에 insert 혹은 update
		} else {
			HttpSession session = req.getSession();
			List<CartVO> anonymCart = (List<CartVO>)session.getAttribute("anonymCart");
			if (CollectionUtils.isEmpty(anonymCart)) { // 세션값이 없으면
				session.setAttribute("anonymCart", inputCart);
			} else { // 있으면 기존 값에 추가 추가
				session.setAttribute("anonymCart", CartCombiner.combine(anonymCart, inputCart));
			}
		}
		return "??";
	}
	
}
