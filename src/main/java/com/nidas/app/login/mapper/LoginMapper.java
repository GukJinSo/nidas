package com.nidas.app.login.mapper;

import com.nidas.app.member.vo.MemberVO;

public interface LoginMapper {
	
	public int memberInsert(MemberVO vo);
	public MemberVO idExistCheck(String id);
	
}
