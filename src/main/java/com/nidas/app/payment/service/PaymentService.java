package com.nidas.app.payment.service;

import java.util.List;
import java.util.Map;

import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.payment.vo.OrderVO;
import com.nidas.app.product.vo.ProductVO;

public interface PaymentService {

	List<CartVO> selectCart(String id);
	void insertCart(String id, List<CartVO> inputCart);
	List<ProductVO> selectCartProdList(Map<String, Object> map);
	void updateCart(String userName, CartVO cartVO);
	void deleteCart(String userName, CartVO cartVO);
	OrderVO insertOrder(Map<String, Object> map);
	List<OrderVO> selectOrder(Map<String, Object> map);
	OrderVO selectOrderLast();
}
