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
	@Autowired BCryptPasswordEncoder encoder;
	
	@Override
	public int memberInsert(MemberVO vo) {
		vo.setPassword(encoder.encode(vo.getPassword()));
		return memberMapper.memberInsert(vo);
	}

}
