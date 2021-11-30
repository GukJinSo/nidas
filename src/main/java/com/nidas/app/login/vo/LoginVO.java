package com.nidas.app.login.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class LoginVO {
	
	private int memNo;
	
	@NotBlank(groups = LoginInsertValid.class) 
	@Length(min=6, max=20, groups = LoginInsertValid.class)
	private String id;
	
	@Pattern(regexp="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$", groups = LoginInsertValid.class)
	private String password;
	
	@NotBlank(groups = LoginInsertValid.class)
	@Length(min=2, max=10)
	private String name;
	
	@NotBlank(groups = LoginInsertValid.class)
	private String gender;
	
	@NotBlank(groups = LoginInsertValid.class)
	@Length(min=11, max=11, groups = LoginInsertValid.class)
	private String hp;
	
	private Date birth;
	private Date regDate;
	private String address;
	private String zipcode;
	private String authority;
	private String mState;
	private int count;
	
}
