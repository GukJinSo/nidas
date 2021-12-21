package com.nidas.app.payment.service;

import java.util.List;

import com.nidas.app.payment.vo.CartVO;

public interface PaymentService {

	List<CartVO> selectCart(String id);
	void insertCart(String id, List<CartVO> inputCart);
}
