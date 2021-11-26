package com.nidas.app.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.nidas.app.login.mapper.LoginMapper;
import com.nidas.app.login.service.LoginService;
import com.nidas.app.member.vo.MemberVO;

@Repository("loginDAO")
public class LoginServiceImpl implements LoginService {
	
	@Autowired LoginMapper loginMapper;
	@Autowired BCryptPasswordEncoder encoder;
	
	@Override
	public int memberInsert(MemberVO vo) {
		vo.setPassword(encoder.encode(vo.getPassword()));
		return loginMapper.memberInsert(vo);
	}

	@Override
	public String idExistCheck(String id) {
		String resultStr = "이미 이용중인 아이디입니다";
		MemberVO vo = loginMapper.idExistCheck(id);
		if ( vo.getCount() != 0 ) {
			resultStr = "이용 가능한 아이디입니다";
		}
		return resultStr;
	}
}
