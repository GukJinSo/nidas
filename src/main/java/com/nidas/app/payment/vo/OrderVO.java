package com.nidas.app.payment.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderVO {
	private String orderNo;
	private String memNo;
	private int subNo;
	private Date odate;
	private String payment;
	private int totalPrice;
	private String name;
	private String address;
	private String tel;
	private String needs;
	
	private String serial;
	private String shoeSize;
	private int stocks;
	private String bnameKor;
	private String pnameKor;
	private String color;
	private float disrate;
	private int disPrice;
	private String filePath;
	
}
