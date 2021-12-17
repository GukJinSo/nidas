package com.nidas.app.product.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nidas.app.product.service.ProductService;
import com.nidas.app.product.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService prodDAO;
	
	@GetMapping("productList.do")
	// 페이징 번호(디폴트값 또는 쿼리스트링), 배열 컬러, 브랜드, 사이즈, 가격
	private String productList(ProductVO vo, Model model){
		model.addAttribute("search", vo.getSearch());
		model.addAttribute("pCategory", vo.getPCategory());
		model.addAttribute("brandFilters", prodDAO.selectBrandFilter(vo.getPCategory()));
		return "product/productList";		
	}
	
	@GetMapping("productListAjax.do") @ResponseBody
	private Map<String, Object> productListAjax(ProductVO vo) {
		return prodDAO.selectProdList(vo);
	}
	
	@GetMapping("productDetail.do")
	private String productDetail(ProductVO vo, Model model) {
		model.addAttribute("prod", prodDAO.selectProdDetail(vo.getSerial()));
		return "product/productDetail";
	}
	
}
