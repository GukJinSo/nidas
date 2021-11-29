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
	@NotBlank @Length(min=6, max=20) private String id;
	@NotBlank @Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}") private String password;
	@NotBlank @Length(min=2, max=10)private String name;
	@NotBlank private String gender;
	@NotBlank private String hp;
	private Date birth;
	private Date regDate;
	private String address;
	private String zipcode;
	private String authority;
	private String mState;
	private int count;
	
}
