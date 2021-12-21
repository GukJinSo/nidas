package com.nidas.app.payment.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nidas.app.payment.vo.CartVO;

@Controller
public class PaymentController {

	Authentication authen = SecurityContextHolder.getContext().getAuthentication();
	Object authenObj = authen.getPrincipal();

	
	@GetMapping("cart.do")
	private String cart(){
		return "payment/cart";
	}

	@GetMapping("addCart.do") @ResponseBody
	private String addCart(HttpServletRequest req, @RequestParam(value="cartList") List<CartVO> cartList ){
		
		// 회원 처리. DB insert 혹은 update
		if (authenObj instanceof User) {
			String userName = ((User)authenObj).getUsername();
			
		// 비회원 처리. 세션에 insert 혹은 update
		} else {
			HttpSession session = req.getSession();
			
			String nullCheck = (String)session.getAttribute("anonymCart");
			if (nullCheck == null) { // 세션값이 없으면

				session.setAttribute("", "");
			} else { // 있으면 가져와서 꺼낸 뒤에 중복값 있으면 추가, 없으면 삭제
				
				List<CartVO> cart = (List<CartVO>)session.getAttribute("anonymCart");
				List<CartVO> newCart = new ArrayList<CartVO>();
				
				boolean isDuplicated = false;
				CartVO addVO;
				int addStock = 0;
				for (int i = 0; i < cart.size(); i++){
					for (int j = i+1; j < cart.size(); j++) {
						if ( cart.get(i).getSerial() == cart.get(j).getSerial() ) {
							if (addStock < cart.get(i).getQuantity()) { //
								addStock += cart.get(i).getQuantity();
							}
							addStock += cart.get(j).getQuantity();
							isDuplicated = true;
						}
						
					}
					if(!isDuplicated) {
						addVO = new CartVO();
					}
						
					if (isDuplicated) {
						addVO = new CartVO();
						addVO.setId(null);
						addVO.setSerial(cart.get(i).getSerial());
						addVO.setShoeSize(cart.get(i).getShoeSize());
						addVO.setQuantity(addStock);
						newCart.add(addVO);
					}
					addStock = 0;
					isDuplicated = false;
				}					
				/*
				HashMap<String, CartVO> cart = (HashMap<String, CartVO>)session.getAttribute("anynymCart");
				HashMap<String, CartVO> newCart = new HashMap<String, CartVO>();
				
				
				newCart.put("", CartVO)
				
				*/
				session.setAttribute("anynymCart", NewCart);
				
			}
		}
		return null;
	}
	
		
	}
	
}
