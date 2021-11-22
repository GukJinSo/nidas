package com.nidas.app.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return null;
	}
	
	@RequestMapping("/loginSuccess.do")
	public String loginSuccess() {
		return null;
	}
	
	@RequestMapping("/loginFail.do")
	public String loginFail() {
		return null;
	}
	
	@RequestMapping("/logout.do")
	public String logout() {
		return null;
	}
}
