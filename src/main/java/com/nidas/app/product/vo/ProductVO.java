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
	private int price;
	private int disPrice;
	private float disRate;
	private String pstate;
	
	//ParameterVO
	private String orderBy;
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
	
	//brandVO
	private String bnameKor;
	private String bnameEng;
	
	//prodImageVO
	private String filePath;
	private String fileName;
	
	//stockVO
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
	
	//cartVO
	private int quantity;
	private String shoeSize;
	
	public void shoeSizeSet(String shoeSize, int quantity){
		if(shoeSize.equals("s220")) {
			setS220(getS220()-quantity);
		} else if(shoeSize.equals("s225")) {
			setS220(getS225()-quantity);			
		} else if(shoeSize.equals("s230")) {
			setS220(getS230()-quantity);
		} else if(shoeSize.equals("s235")) {
			setS220(getS235()-quantity);
		} else if(shoeSize.equals("s240")) {
			setS220(getS240()-quantity);
		} else if(shoeSize.equals("s245")) {
			setS220(getS245()-quantity);
		} else if(shoeSize.equals("s250")) {
			setS220(getS250()-quantity);
		} else if(shoeSize.equals("s255")) {
			setS220(getS255()-quantity);
		} else if(shoeSize.equals("s260")) {
			setS220(getS260()-quantity);
		} else if(shoeSize.equals("s265")) {
			setS220(getS265()-quantity);
		} else if(shoeSize.equals("s270")) {
			setS220(getS270()-quantity);
		} else if(shoeSize.equals("s275")) {
			setS220(getS275()-quantity);
		} else if(shoeSize.equals("s280")) {
			setS220(getS280()-quantity);
		} else if(shoeSize.equals("s285")) {
			setS220(getS285()-quantity);
		} else if(shoeSize.equals("s290")) {
			setS220(getS290()-quantity);
		}
	}
	
}
