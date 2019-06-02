package com.bean;

public class FirstBoxImg {
	
	
	public FirstBoxImg() {}
	
	public FirstBoxImg( byte[] productid , String firstboximg , Integer value ) {
		this.productid   = productid    ;
		this.firstboximg = firstboximg  ;   
		this.value       = value        ;
	}
	
	private byte[]   productid   ;
	private String   firstboximg ;
	private String   productname ;
	private String   price       ;
	private Integer  value       ;
	
	public  void    setProductid  (byte[]  productid  ) {
		this.productid   = productid    ;
	}
	public  void    setPhotoaddr  (String firstboximg   ) {
		this.firstboximg = firstboximg;
	}
	public  void    setProductname(String  productname) {
		this.productname = productname;
	}
	public  void    setPrice      (String  price      ) {
		this.price       = price      ;
	}
	public  void    setValue      (Integer value      ) {
		this.value       = value      ;
	}
	
	
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
	
	
}


