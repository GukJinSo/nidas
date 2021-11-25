package com.nidas.app.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "login/loginForm";
	}
	
	@RequestMapping("loginFail.do")
	public String loginFail() {
		return "login/loginFail";
	}
	
	@RequestMapping("registerForm.do")
	public String registerForm() {
		return "login/registerForm";
	}
	
}
