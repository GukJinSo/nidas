package com.nidas.app.login.service;

import com.nidas.app.login.vo.LoginVO;

public interface LoginService {

	public int memberInsert(LoginVO vo);
	public boolean idExistCheck(String id);
	
}
