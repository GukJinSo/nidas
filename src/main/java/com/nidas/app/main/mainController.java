package com.nidas.app.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
	
	@RequestMapping("main.do")
	public String main() {
		return "main/main";
	}
	
}
