package com.nidas.app.login.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.nidas.app.login.mapper.LoginMapper;
import com.nidas.app.login.service.LoginService;
import com.nidas.app.login.vo.LoginVO;

@Repository("loginDAO")
public class LoginServiceImpl implements LoginService {
	
	@Autowired LoginMapper loginMapper;
	@Autowired BCryptPasswordEncoder encoder;
	
	@Override
	public int memberInsert(LoginVO vo) {
		vo.setPassword(encoder.encode(vo.getPassword()));
		return loginMapper.memberInsert(vo);
	}

	@Override
	public boolean idExistCheck(String id) {
		LoginVO vo = loginMapper.idExistCheck(id);
		return ( vo.getCount() == 0 ) ? true : false;
	}


	@Override
	public void LoginAfterMemberInsert(LoginVO vo) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
        		vo.getId(),
        		vo.getPassword(),
                List.of(new SimpleGrantedAuthority("ROLE_USER")));
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(token);
	}
	
}
