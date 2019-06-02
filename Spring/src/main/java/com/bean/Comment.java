package com.bean;

public class Comment {
	/*
	id         INTEGER  (20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username   CHARACTER(20) NOT NULL DEFAULT ''                ,
    productid    Integer(20) NOT NULL DEFAULT ''                ,
    `comment`  CHARACTER(20) NOT NULL DEFAULT ''                ,
	`user  `   CHARACTER(20) NOT NULL DEFAULT '*'               ,
    `level`    INTEGER  (20) NOT NULL DEFAULT  0                ,
    ctime      DATETIME     */
    
	private Integer productid;
	private String  comment  ;
	private Integer level    ;
	
	public  Integer getProductid() {
		return this.productid;
	}
	public  String  getComment  () {
		return this.comment ;
	}
	public  Integer getLevel    () {
		return this.level;
	}
	
	public  void    setProductid(Integer productid  ) {
		this.productid   = productid;
	}
	public  void    setComment  (String  comment   ) {
		this.comment     = comment ;
	}
	public  void    setLevel    (Integer level     ) {
		this.level       = level;
	}
	
}
