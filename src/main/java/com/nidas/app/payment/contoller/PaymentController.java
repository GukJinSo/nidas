package com.nidas.app.payment.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PaymentController {

	@GetMapping("member/addCart.do")
	private String addCart(HttpServletRequest req){
		return "payment/payment";
	}
	
}
