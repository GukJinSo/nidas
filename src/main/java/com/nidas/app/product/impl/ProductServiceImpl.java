package com.nidas.app.product.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nidas.app.etc.util.Paging;
import com.nidas.app.product.mapper.ProductMapper;
import com.nidas.app.product.service.ProductService;
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
	public List<ProductVO> selectBrandFilter(String pCategory) {
		return mapper.selectBrandFilter(pCategory);
	}

	@Override
	public Map<String, Object> selectProdDetail(String serial) {
		Map<String, Object> map = new HashMap<String,Object>();
		ProductVO pvo = mapper.selectProdDetail(serial);
		// 앞단에서 foreach 시 순서 보장을 위해 linkedHashMap 사용
		LinkedHashMap<String, String> stockMap = new LinkedHashMap<String,String>();
		
		stockMap.put("220", Integer.toString(pvo.getS220()));
		stockMap.put("225", Integer.toString(pvo.getS225()));
		stockMap.put("230", Integer.toString(pvo.getS230()));
		stockMap.put("235", Integer.toString(pvo.getS235()));
		stockMap.put("240", Integer.toString(pvo.getS240()));
		stockMap.put("245", Integer.toString(pvo.getS245()));
		stockMap.put("250", Integer.toString(pvo.getS250()));
		stockMap.put("255", Integer.toString(pvo.getS255()));
		stockMap.put("260", Integer.toString(pvo.getS260()));
		stockMap.put("265", Integer.toString(pvo.getS265()));
		stockMap.put("270", Integer.toString(pvo.getS270()));
		stockMap.put("275", Integer.toString(pvo.getS275()));
		stockMap.put("280", Integer.toString(pvo.getS280()));
		stockMap.put("285", Integer.toString(pvo.getS285()));
		stockMap.put("290", Integer.toString(pvo.getS290()));
		
		map.put("details", pvo);
		map.put("stocks", stockMap);
		map.put("styleCodes", mapper.selectSameLine(serial));
		return map;
	}
	
}
