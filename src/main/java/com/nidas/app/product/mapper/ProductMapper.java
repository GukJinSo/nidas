package com.nidas.app.product.mapper;

import java.util.List;

import com.nidas.app.product.vo.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> selectProdList(ProductVO vo);
	public int selectProdCnt(ProductVO vo);
	
}
