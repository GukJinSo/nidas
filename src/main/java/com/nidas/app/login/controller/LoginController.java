package com.nidas.app.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nidas.app.login.service.LoginService;
import com.nidas.app.member.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired LoginService loginDAO;
	
	
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
	
	@PostMapping("memberInsert.do")
	public String memberInsert(MemberVO vo){
		loginDAO.memberInsert(vo);
		return "main/main";
	}
	
	@PostMapping("idExistCheck.do") @ResponseBody
	public String idExistCheck(String id) {
		return loginDAO.idExistCheck(id);
	}
}
