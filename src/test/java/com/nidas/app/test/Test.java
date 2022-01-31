package com.nidas.app.test;

import static org.junit.Assert.*;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
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
		List<CartVO> list = new ArrayList<>();
		CartVO cvo = new CartVO();
		cvo.setId("testuser");
		cvo.setShoeSize("s240");
		cvo.setQuantity(5);
		list.add(cvo);
		
		Method[] strArr = list.get(0).getClass().getDeclaredMethods();
		for(int i = 0; i < strArr.length; i++) {
			System.out.println(strArr[i].getName());
		}
	}

}
