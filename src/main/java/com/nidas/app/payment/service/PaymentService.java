package com.nidas.app.payment.service;

import java.util.List;

import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.product.vo.ProductVO;

public interface PaymentService {

	List<CartVO> selectCart(String id);
	List<ProductVO> selectCartProdList(List<String> cartSerial);
	void insertCart(String id, List<CartVO> inputCart);
}
