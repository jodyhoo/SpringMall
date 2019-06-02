package com.dao.indexDao;

import java.util.Comparator;

import com.bean.FirstBoxImg;

class firstboximgComp implements Comparator<FirstBoxImg>, Comparable<FirstBoxImg> {
	
	/*
	public FirstBoxImg( byte[] productid , String firstboximg , Integer value ) {
		this.productid   = productid    ;
		this.firstboximg = firstboximg  ;   
		this.value       = value        ;
	}*/
	
	private byte[]   productid   ;
	private String   firstboximg ;
	private String   productname ;
	private String   price       ;
	private Integer  value       ;
	
	public  byte[]  getProductid  () {
		return this.productid;
	}
	public  String  getFirstboximg  () {
		return this.firstboximg;
	}
	public  String  getProductname() {
		return this.productname;
	}
	public  String  getPrice      () {
		return this.price;
	}
	public  Integer getValue      () {
		return this.value;
	}
	
	// Overriding the compare method to sort the age 
	public int compare  (FirstBoxImg fboximg1, FirstBoxImg fboximg2) {
	    return fboximg1.getValue() - fboximg1.getValue();
	}
	
	public int compareTo(FirstBoxImg fboximg) {
		return (this.value).compareTo(fboximg.getValue());
	}
	
}

public class Comparators {
	
}
