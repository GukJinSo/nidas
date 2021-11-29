package com.nidas.app.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	HttpSession session;
	
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
	public String memberInsert(MemberVO vo, HttpServletRequest req){
		session = req.getSession();
		boolean isIdChecked = ((Boolean) session.getAttribute("isIdChecked")).booleanValue();
		boolean isHpChecked = ((Boolean) session.getAttribute("isHpChecked")).booleanValue();
		if ( isIdChecked == true && isHpChecked == true ) {
			loginDAO.memberInsert(vo);
			session.removeAttribute("isIdChecked");
			session.removeAttribute("isHpChecked");
			return "main/main";
		} else {
			return "etc/errorPage";
		}
	}
	
	@PostMapping("idExistCheck.do")
	@ResponseBody
	public boolean idExistCheck(String id, HttpServletRequest req) {
		session = req.getSession();
		session.setAttribute("isIdChecked", loginDAO.idExistCheck(id));
		return loginDAO.idExistCheck(id);
	}
	
	
	
}
