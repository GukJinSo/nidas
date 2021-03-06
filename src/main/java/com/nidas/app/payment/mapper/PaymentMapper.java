package com.nidas.app.payment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.payment.vo.OrderVO;
import com.nidas.app.product.vo.ProductVO;

public interface PaymentMapper {

	List<CartVO> selectCart(String id);
	void deleteCart(String id);
	int insertCart(Map<String, Object> map);
	List<ProductVO> selectCartProdListByUser(Map<String, Object> map);
	List<ProductVO> selectCartProdListByAnonym(@Param("list")List<CartVO> list);
	void deleteCart(String id, Map<String, Object> map);
	void deleteCartAll(String id);
	void updateCart(String id, Map<String, Object> map);
	String insertOrders(Map<String, Object> map);
	void updateStock(Map<String, Object> map);
	List<OrderVO> selectOrder(Map<String, Object> map);
	OrderVO selectOrderLast();
}
