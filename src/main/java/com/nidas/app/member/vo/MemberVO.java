package com.nidas.app.member.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberVO {

	private int memNo;
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String gender;
	private Date regDate;
	private String hp;
	private String address;
	private String zipcode;
	private String authority;
	private String mState;
	private int count;
}
