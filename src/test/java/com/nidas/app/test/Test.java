package com.nidas.app.test;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

public class Test {

	@org.junit.Test
	public void test() {
		String[] colors = {"blk", "grn", "wht"};
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("colors", colors);
		System.out.println( ((String[])map.get("colors"))[1] );
		
	}

}
