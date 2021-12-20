package com.nidas.app.login.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	// 인증 권한이 필요한 페이지에 접근하게 되면, 로그인 화면을 띄우기 전에 필요한 정보들을 세션에 저장하게 된다
	// spring security에서 제공하는 사용자의 요청을 저장하고 꺼낼 수 있는 RequestCache interface.
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		resultRedirectStrategy(request, response, authentication);

	}
	
	// 리다이렉트 부분
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    	
    	String defaultUrl = "/main.do";
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        if(savedRequest!=null) { // 다른 로그인 필요 서비스에서 호출된 경우 savedRequest가 null이 아님
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
        } else { // 로그인 페이지에 직접 들어온 경우 null이므로 메인 페이지로 돌려보낼 것이다
			redirectStratgy.sendRedirect(request, response, defaultUrl);
        }    	

    }

}
