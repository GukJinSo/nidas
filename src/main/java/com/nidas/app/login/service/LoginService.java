package com.nidas.app.login.service;

import com.nidas.app.member.vo.MemberVO;

public interface LoginService {

	public int memberInsert(MemberVO vo);
	public boolean idExistCheck(String id);
	
}
