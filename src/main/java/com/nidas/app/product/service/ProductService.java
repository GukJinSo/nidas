package com.nidas.app.product.service;

import java.util.Map;

import com.nidas.app.product.vo.ProductVO;

public interface ProductService {

	public Map<String, Object> selectProdList(ProductVO vo);
	
}
