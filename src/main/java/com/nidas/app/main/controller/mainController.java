package com.nidas.app.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nidas.app.product.impl.ProductServiceImpl;
import com.nidas.app.product.service.ProductService;

@Controller
public class mainController {
	
	@Autowired ProductService prodDAO;
	
	@RequestMapping("main.do")
	public String main(Model model) {
		model.addAttribute("list", prodDAO.selectProdBestSeller());
		return "main/main";
	}
	
}
