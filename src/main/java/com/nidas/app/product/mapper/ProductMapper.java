package com.nidas.app.product.mapper;

import java.util.List;
import java.util.Map;

import com.nidas.app.product.vo.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> selectProdList(ProductVO vo);
	public int selectProdCnt(ProductVO vo); 
	public List<ProductVO> selectBrandFilter(String pCategory); // prodList 브랜드 필터
	public ProductVO selectProdDetail(String serial); // 제품 상세정보
	public List<ProductVO> selectSameLine(String serial); // 같은 스타일코드 제품들의 메인 이미지 가져오기
	public List<ProductVO> selectProdImages(String serial); // 해당 시리얼 제품의 이미지들 가져오기
}
