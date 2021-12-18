package com.nidas.app.product.vo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductVO {

	private String serial;
	private String brand;
	private String pCategory;
	private String styleCode;
	private String pnameKor;
	private String pnameEng;
	private String color;
	private Date relDate;
	private String price;
	private String disRate;
	private String pstate;
	private String img;
	
	// 쿼리 관련
	private String orderBy;
	private String disPrice;
	private String bnameKor;
	private String bnameEng;
	private String search;
	private int page;
	private int pagePer;
	private int pageStart;
	private int pageEnd;
	private int count;
	private int[] priceRange;
	private String[] colors;
	private String[] brands;
	private String[] sizes;
	private String filePath;
	private String fileName;
	
	
	
	StockVO stockVO;

	private int s220;
	private int s225;
	private int s230;
	private int s235;
	private int s240;
	private int s245;
	private int s250;
	private int s255;
	private int s260;
	private int s265;
	private int s270;
	private int s275;
	private int s280;
	private int s285;
	private int s290;
	
	
	
}
