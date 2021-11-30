package com.nidas.app.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.nidas.app.login.service.LoginService;
import com.nidas.app.login.vo.LoginInsertValid;
import com.nidas.app.login.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired LoginService loginDAO;
	HttpSession session;
	
	@GetMapping("loginForm.do")
	public String loginForm() {
		return "login/loginForm";
	}
	
	@GetMapping("loginFail.do")
	public String loginFail() {
		return "login/loginFail";
	}
	
	@GetMapping("registerForm.do")
	public String registerForm() {
		return "login/registerForm";
	}
	
	@PostMapping("memberInsert.do")
	public String memberInsert(@Validated(LoginInsertValid.class) LoginVO vo, BindingResult bResult, HttpServletRequest req){
		String returnPage = "main/main";
		// 정규식 검증
		if (bResult.hasErrors()) {
			bResult.getAllErrors().forEach(c->{
				System.out.println(c.toString());
			});
			returnPage = "etc/errorPage";
		}
		// 세션 검증
		session = req.getSession();
		try { // 잘못된 접근으로 세션에 boolean 값이 없는 경우 nullpointer가 반드시 발생 == 인증 실패와 같으므로 에러 페이지 return
			boolean isIdChecked = ((Boolean) session.getAttribute("isIdChecked")).booleanValue();
			boolean isHpChecked = ((Boolean) session.getAttribute("isHpChecked")).booleanValue();
			if ( isIdChecked == true && isHpChecked == true ) {
				loginDAO.memberInsert(vo);
			}
		} catch (NullPointerException ne){
			ne.printStackTrace();
			returnPage = "etc/errorPage";
		} finally { // finally절에 return을 기재하는 경우, catch절에 return 값이 있더라도 return이 최종적으로 실행된다는 경고 문구
			session.removeAttribute("isIdChecked");
			session.removeAttribute("isHpChecked");
			return returnPage;
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
