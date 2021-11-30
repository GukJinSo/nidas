package com.nidas.app.login.mapper;

import com.nidas.app.login.vo.LoginVO;

public interface LoginMapper {
	
	public int memberInsert(LoginVO vo);
	public LoginVO idExistCheck(String id);
	
}
