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
		vo.setShoeSize("s270");
		vo.setQuantity(5);
		
		CartVO vo2 = new CartVO();
		vo2.setId("testuser");
		vo2.setSerial("315122-666");
		vo2.setShoeSize("s245");
		vo2.setQuantity(5);
		
		CartVO vo3 = new CartVO();
		vo3.setId("testuser");
		vo3.setSerial("315122-111");
		vo3.setShoeSize("s245");
		vo3.setQuantity(5);
		
		CartVO vo4 = new CartVO();
		vo4.setId("testuser");
		vo4.setSerial("315122-111");
		vo4.setShoeSize("s245");
		vo4.setQuantity(5);
		
		CartVO vo5 = new CartVO();
		vo5.setId("testuser");
		vo5.setSerial("315122-666");
		vo5.setShoeSize("s270");
		vo5.setQuantity(5);
		
		
		CartVO vo6 = new CartVO();
		vo6.setId("testuser");
		vo6.setSerial("315122-111");
		vo6.setShoeSize("s245");
		vo6.setQuantity(5);
		
		CartVO vo7 = new CartVO();
		vo7.setId("testuser");
		vo7.setSerial("315122-111");
		vo7.setShoeSize("s245");
		vo7.setQuantity(5);
		
		CartVO vo8 = new CartVO();
		vo8.setId("testuser");
		vo8.setSerial("315122-111");
		vo8.setShoeSize("s245");
		vo8.setQuantity(5);
		CartVO vo9 = new CartVO();
		vo9.setId("testuser");
		vo9.setSerial("315122-111");
		vo9.setShoeSize("s245");
		vo9.setQuantity(5);
		
		
		
		origin.add(vo);
		origin.add(vo2);
		origin.add(vo3);
		origin.add(vo4);
		origin.add(vo5);
		origin.add(vo8);
		input.add(vo6);
		input.add(vo7);
		input.add(vo8);
		input.add(vo9);
		List<CartVO> newList = CartCombiner.combine(origin, input);
		System.out.println(newList.size());
		System.out.println(newList.get(0).getShoeSize()+":"+newList.get(0).getSerial()+":"+newList.get(0).getQuantity());
		System.out.println(newList.get(1).getShoeSize()+":"+newList.get(1).getSerial()+":"+newList.get(1).getQuantity());
		System.out.println(newList.get(2).getShoeSize()+":"+newList.get(2).getSerial()+":"+newList.get(2).getQuantity());
		System.out.println(newList.get(3).getShoeSize()+":"+newList.get(3).getSerial()+":"+newList.get(3).getQuantity());
	}

}
