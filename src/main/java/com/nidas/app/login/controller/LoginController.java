package com.nidas.app.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nidas.app.member.service.MemberService;
import com.nidas.app.member.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired MemberService memberDAO;
	
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
		memberDAO.memberInsert(vo);
		return "main/main";
	}
}
