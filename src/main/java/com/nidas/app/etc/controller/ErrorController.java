package com.nidas.app.etc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	@RequestMapping("errorPage.do")
	public String errorPage(){
		return "etc/errorPage";
	}
}
