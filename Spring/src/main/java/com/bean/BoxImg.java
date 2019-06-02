package com.bean;

import com.buffer.imgbuffer.BoxImgBuffer;

public class BoxImg {
	
	public BoxImg() {}
	
	public BoxImg( byte[] productid ,
			       String code      ,
			       String boximg    ,
			       String boximgsq  ) {
		this.productid   = productid;
		this.code        = code     ;
		this.boximg      = boximg   ;
		this.boximgsmall = boximgsq ;
	}
	
	
	private byte[]  productid  ;
	private String  code       ;
	private String  boximg     ;
	private Float   value      ;
	private String  boximgsmall;
	
	
	public  byte[]  getProductid() {
		return this.productid;
	}
	public  String  getCode     () {
		return this.code;
	}
	public  String  getBoximg   () {
		return this.boximg;
	}
	public  String  getBoximgsmall () {
		return this.boximgsmall;
	}
	
	
	public  void    setProductid  (byte[]  productid) {
		this.productid    = productid;
	}
	public  void    setCode       (String  code     ) {
		this.code         = code     ;
	}
	public  void    setBoximg     (String  boximg   ) {
		this.boximg       = boximg   ;
	}
	public  void    setBoximgsmall(String  boximgsmall) {
		this.boximgsmall  = boximgsmall ;
	}
	
}
