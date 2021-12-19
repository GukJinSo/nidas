package com.nidas.app.product.service;

import java.util.List;
import java.util.Map;

import com.nidas.app.product.vo.ProductVO;

public interface ProductService {

	public Map<String, Object> selectProdList(ProductVO vo);
	public List<ProductVO> selectBrandFilter(String pCategory);
	public Map<String, Object> selectProdDetail(String serial);
	
}
