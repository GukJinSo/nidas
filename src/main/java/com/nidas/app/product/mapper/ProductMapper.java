package com.nidas.app.product.mapper;

import java.util.List;
import java.util.Map;

import com.nidas.app.product.vo.FilterVO;
import com.nidas.app.product.vo.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> selectProdList(ProductVO vo);
	public int selectProdCnt(ProductVO vo);
	public List<FilterVO> selectBrandFilter(String pCategory);
	public ProductVO selectProdDetail(String serial);
	public List<ProductVO> selectSameLine(String serial);
}
