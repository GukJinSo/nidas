package com.nidas.app.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nidas.app.payment.vo.CartVO;

import edu.emory.mathcs.backport.java.util.Arrays;

public class Test {

	@org.junit.Test
	public void test() {
		
		CartVO vo1 = new CartVO();
		vo1.setSerial("315122-111");
		vo1.setShoeSize("245");
		vo1.setQuantity(4);
		CartVO vo2 = new CartVO();
		vo2.setSerial("VAN352-111");
		vo2.setShoeSize("245");
		vo2.setQuantity(5);
		CartVO vo3 = new CartVO();
		vo3.setSerial("VAN690-111");
		vo3.setShoeSize("270");
		vo3.setQuantity(5);
		CartVO vo4 = new CartVO();
		vo4.setSerial("315122-111");
		vo4.setShoeSize("245");
		vo4.setQuantity(6);
		CartVO vo5 = new CartVO();
		vo5.setSerial("6922315111");
		vo5.setQuantity(5);
		vo5.setShoeSize("245");
		CartVO vo6 = new CartVO();
		vo6.setSerial("UO852111");
		vo6.setQuantity(5);
		vo6.setShoeSize("245");
		CartVO vo7 = new CartVO();
		vo7.setSerial("315122-111");
		vo7.setQuantity(3);
		vo7.setShoeSize("245");
		
		
		
		List<CartVO> cart = List.of(vo1, vo2, vo3, vo4, vo5, vo6, vo7);
		List<CartVO> newCart = new ArrayList<CartVO>();


		cart.set(1, new CartVO());
		
		
		
		for(CartVO vo : cart) {
			System.out.println(vo);
			
			
			
		}
		
	}

}
