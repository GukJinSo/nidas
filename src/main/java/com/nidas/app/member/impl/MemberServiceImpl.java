package com.nidas.app.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.nidas.app.member.mapper.MemberMapper;
import com.nidas.app.member.service.MemberService;
import com.nidas.app.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper memberMapper;

	@Override
	public int selectMemNo(String id) {
		return selectMemNo(id);
	}

	
}
