package com.nidas.app.payment.mapper;

import java.util.List;
import java.util.Map;

import com.nidas.app.payment.vo.CartVO;

public interface PaymentMapper {

	List<CartVO> selectCart(String id);
	int insertCart(Map<String, Object> map);
}
