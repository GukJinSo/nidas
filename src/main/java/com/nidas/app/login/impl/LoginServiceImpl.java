package com.nidas.app.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.nidas.app.login.mapper.LoginMapper;
import com.nidas.app.login.service.LoginService;
import com.nidas.app.login.vo.LoginVO;
import com.nidas.app.member.vo.MemberVO;

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
	
}
