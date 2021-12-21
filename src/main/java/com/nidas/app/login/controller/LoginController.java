package com.nidas.app.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nidas.app.login.service.LoginService;
import com.nidas.app.login.vo.LoginInsertValid;
import com.nidas.app.login.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired LoginService loginDAO;
	HttpSession session;
	
	@GetMapping("loginForm.do")
	public String loginForm(@RequestParam(required = false) String errMsg, Model model) {
		if ( errMsg != null ) model.addAttribute(errMsg);
		return "login/loginForm";
	}
	
	@GetMapping("loginFail.do")
	public String loginFail(RedirectAttributes redirect) {
		redirect.addFlashAttribute("errMsg", "로그인에 실패하였습니다");
		return "redirect:/loginForm.do";
	}
	
	@GetMapping("registerForm.do")
	public String registerForm() {
		return "login/registerForm";
	}
	
	@PostMapping("memberInsert.do") @SuppressWarnings("finally")
	public String memberInsert(@Validated(LoginInsertValid.class) LoginVO vo, BindingResult bResult, HttpServletRequest req){
		String returnPage = "redirect:/main.do";
		// 정규식 검증
		if (bResult.hasErrors()) {
			bResult.getAllErrors().forEach(c->{
				System.out.println(c.toString());
			});
			returnPage = "redirect:/errorPage.do";
		}
		// 세션 검증
		session = req.getSession();
		try { // 잘못된 접근으로 세션에 boolean 값이 없는 경우 nullpointer가 반드시 발생 == 값 인증 실패와 같으므로 에러 페이지 return
			boolean isIdChecked = ((Boolean) session.getAttribute("isIdChecked")).booleanValue();
			boolean isHpChecked = ((Boolean) session.getAttribute("isHpChecked")).booleanValue();
			if ( isIdChecked == true && isHpChecked == true ) {
				loginDAO.memberInsert(vo); // 회원 가입
				loginDAO.LoginAfterMemberInsert(vo); // 로그인 처리
			}
		} catch (NullPointerException ne){
			returnPage = "redirect:/errorPage.do";
		} finally { // finally절에 return을 기재하는 경우, catch절에 return 값이 있더라도 return이 최종적으로 실행된다는 경고 문구. @SuppressWarnings("finally")로 제거
			session.removeAttribute("isIdChecked");
			session.removeAttribute("isHpChecked");
			return returnPage;
		}

	}
	
	@PostMapping("idExistCheck.do") @ResponseBody
	public boolean idExistCheck(String id, HttpServletRequest req) {
		session = req.getSession();
		session.setAttribute("isIdChecked", loginDAO.idExistCheck(id));
		return loginDAO.idExistCheck(id);
	}
	
}
