package com.nidas.app.payment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nidas.app.payment.vo.CartVO;
import com.nidas.app.product.vo.ProductVO;

public interface PaymentMapper {

	List<CartVO> selectCart(String id);
	void deleteCart(String id);
	int insertCart(Map<String, Object> map);
	List<ProductVO> selectCartProdList(@Param("cartSerial")List<String> cartSerial);
}
