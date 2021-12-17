package com.nidas.app.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nidas.app.etc.Paging;
import com.nidas.app.product.mapper.ProductMapper;
import com.nidas.app.product.service.ProductService;
import com.nidas.app.product.vo.FilterVO;
import com.nidas.app.product.vo.ProductVO;

@Repository("prodDAO")
public class ProductServiceImpl implements ProductService {

	@Autowired ProductMapper mapper;
	
	@Override
	public Map<String, Object> selectProdList(ProductVO vo) {
		
		// 기본값
		if (vo.getPage() == 0) vo.setPage(1);
		if (vo.getPagePer() == 0 ) vo.setPagePer(20);
		Map<String, Object> map = new HashMap<String,Object>();
		// 페이징
		Paging paging = new Paging();
		paging.setPageNo(vo.getPage());
		paging.setPageSize(vo.getPagePer());
		paging.setTotalCount( mapper.selectProdCnt(vo) );
		map.put("paging", paging);
		// 쿼리
		vo.setPageStart( (vo.getPage()-1) * vo.getPagePer() + 1 );
		vo.setPageEnd( vo.getPage() * vo.getPagePer() );
		map.put("prodList", mapper.selectProdList(vo));

		return map;
	}

	@Override
	public List<FilterVO> selectBrandFilter(String pCategory) {
		return mapper.selectBrandFilter(pCategory);
	}

	@Override
	public Map<String, Object> selectProdDetail(String serial) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("details", mapper.selectProdDetail(serial));
		map.put("styleCodes", mapper.selectSameLine(serial));
		return map;
	}
	
}
