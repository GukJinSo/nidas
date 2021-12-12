package com.nidas.app.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nidas.app.product.service.ProductService;
import com.nidas.app.product.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired ProductService prodDAO;
	
	@GetMapping("productList.do")
	// 페이징 번호(디폴트값 또는 쿼리스트링), 배열 컬러, 브랜드, 사이즈, 가격
	private String productList(ProductVO vo, Model model){
		model.addAttribute("map", prodDAO.selectProdList(vo));
		model.addAttribute("pCategory", vo.getPCategory());
		return "product/productList";		
	}
}
