package com.nidas.app.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nidas.app.etc.util.CartCombiner;
import com.nidas.app.payment.mapper.PaymentMapper;
import com.nidas.app.payment.service.PaymentService;
import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.product.vo.ProductVO;

@Repository("payDAO")
public class PaymentServiceImpl implements PaymentService{

	@Autowired PaymentMapper mapper;
	
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

}
