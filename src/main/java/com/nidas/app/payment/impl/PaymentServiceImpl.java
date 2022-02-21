package com.nidas.app.payment.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nidas.app.etc.util.CartCombiner;
import com.nidas.app.member.mapper.MemberMapper;
import com.nidas.app.payment.mapper.PaymentMapper;
import com.nidas.app.payment.service.PaymentService;
import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.payment.vo.OrderVO;
import com.nidas.app.product.vo.ProductVO;

@Repository("payDAO")
public class PaymentServiceImpl implements PaymentService{

	@Autowired PaymentMapper mapper;
	@Autowired MemberMapper memMapper;
	
	
	@Override
	public List<CartVO> selectCart(String id) {
		return mapper.selectCart(id);
	}

	@Override
	public void insertCart(String id, List<CartVO> inputCart) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> OriginalCart = mapper.selectCart(id);
		map.put("id", id);
		map.put("list", CartCombiner.combine(OriginalCart, inputCart));
		mapper.deleteCart(id);
		mapper.insertCart(map);
		
	}

	@Override
	public List<ProductVO> selectCartProdList(Map<String, Object> cartSerial) {
		if (cartSerial.get("id") != "") {
			return mapper.selectCartProdListByUser(cartSerial);
		} else {
			return mapper.selectCartProdListByAnonym( (List<CartVO>)cartSerial.get("list") );
		}
		
	}
	
	@Override
	public void updateCart(String userName, CartVO cartVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", userName);
		map.put("vo", cartVO);
		mapper.updateCart(userName, map);
	}

	@Override
	public void deleteCart(String userName, CartVO cartVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", userName);
		map.put("vo", cartVO);
		mapper.deleteCart(userName, map);
	}

	@Override
	@Transactional
	public OrderVO insertOrder(Map<String, Object> map) {
		List<CartVO> clist;
		List<ProductVO> list;
		
		if(map.get("id").equals("")) { // 비회원이면
			clist = (List<CartVO>) map.get("list");
			list = mapper.selectCartProdListByAnonym(clist);
		} else { // 회원이면
			list = mapper.selectCartProdListByUser(map);
			map.put("memNo", memMapper.selectMemNo((String)map.get("id")));
		}
		// 위의꺼 체크 필요
		for(ProductVO vo : list) {
			vo.setShoeSize("s"+vo.getShoeSize());
		}
		
		map.remove("list");
		map.put("list", list);
		mapper.insertOrders(map);
		mapper.updateStock(map);
		
		if(!map.get("id").equals("")) { // 회원이면
			mapper.deleteCartAll((String)map.get("id"));
		}
		return mapper.selectOrder(map).get(0);
		
	}

	@Override
	public List<OrderVO> selectOrder(Map<String, Object> map) {
		return mapper.selectOrder(map);
	}
	
}
