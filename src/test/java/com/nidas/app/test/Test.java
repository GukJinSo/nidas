package com.nidas.app.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.ObjectUtils;

import com.nidas.app.etc.util.CartCombiner;
import com.nidas.app.payment.vo.CartVO;

import edu.emory.mathcs.backport.java.util.Arrays;

public class Test {

	@org.junit.Test
	public void test() {
		
		List<CartVO> origin = new ArrayList<>();
		List<CartVO> input = new ArrayList<>();
		
		CartVO vo = new CartVO();
		vo.setId("testuser");
		vo.setSerial("315122-111");
		vo.setShoeSize("s245");
		vo.setQuantity(5);
		
		CartVO vo2 = new CartVO();
		vo.setId("testuser");
		vo.setSerial("315122-111");
		vo.setShoeSize("s245");
		vo.setQuantity(5);
		
		origin.add(vo);
		input.add(vo2);
		List<CartVO> newList = CartCombiner.combine(origin, input);
		System.out.println(newList.size());
	}

}
