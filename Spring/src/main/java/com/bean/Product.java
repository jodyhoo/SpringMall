package com.bean;

public class Product {
	
	public Product() {}
	
	public Product( byte[] productid , String username , String productname , String price , String quantity , String firstboximg , String productpage , String category ) {
		this.productid   = productid  ;
		this.username    = username   ;
		this.productname = productname;
		this.price       = price      ;
		this.quantity    = quantity   ;
		this.category    = category   ;
		this.firstboximg = firstboximg;
		this.productpage = productpage;
	}
	
	private byte[]   productid  ;
	private String   username   ;
	private String   productname;
	private String   price      ;
	private String   quantity   ;
	
	public  enum     CATEGORY   { Ĭ�� , ��C����  , ��װ , Ůװ , ͯװ , �ҵ�  };
	private String   category   ;
	
	private String   firstboximg;
	private String   productpage;
	
	
	public  byte[]  getProductid  () {
		return this.productid;
	}
	public  String  getUsername   () {
		return this.username ;
	}
	public  String  getProductname() {
		return this.productname;
	}
	public  String  getPrice      () {
		return this.price;
	}
	public  String  getQuantity   () {
		return this.quantity;
	}
	public  String  getCategory  () {
		return this.category;
	}
	public  String  getFirstboximg  () {
		return this.firstboximg;
	}
	public  String  getProductpage() {
		return this.productpage;
	}
	
	
	public  void    setProductid  (byte[]  productid  ) {
		this.productid   = productid    ;
	}
	public  void    setUsername   (String  username   ) {
		this.username    = username;
	}
	public  void    setProductname(String  productname) {
		this.productname = productname;
	}
	public  void    setPrice      (String  price      ) {
		this.price       = price      ;
	}
	public  void    setQuantity   (String  quantity   ) {
		this.quantity    = quantity  ;
	}
	public  void    setCategory  (String category   ) {
		this.category    = category;
	}
	public  void    setFirstboximg  (String firstboximg   ) {
		this.firstboximg   = firstboximg;
	}
	public  void    setProductpage(String productpage ) {
		this.productpage = productpage;
	}
	
	
}



