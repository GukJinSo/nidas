package com.nidas.app.payment.mapper;

import java.util.List;
import java.util.Map;

import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.product.vo.ProductVO;

public interface PaymentMapper {

	List<CartVO> selectCart(String id);
	int insertCart(Map<String, Object> map);
	List<ProductVO> selectCartProdList(List<String> cartSerial);
}
