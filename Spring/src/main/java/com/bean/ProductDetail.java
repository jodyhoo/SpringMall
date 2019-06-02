package com.bean;

public class ProductDetail {
	

	private byte[]   productid;    
	
	private String   productuuid;   
	private String   newname    ;
	private String   oldname    ;
	private String      name    ;
	private String   code       ;
	private String   boximg     ;
	private String   boximgsmall;
	
	
	
	// adidtional .
	public  String  getProductuuid() 					 {		return this.productuuid;			}		
	public  String  getNewname    () 					 {		return this.newname;				}
	public  String  getOldname    () 					 {		return this.oldname;				}	
	
	public  void    setProductuuid( String productuuid ) {		this.productuuid = productuuid;		}	
	public  void    setNewname    ( String newname     ) {		this.newname     = newname ;		}
	public  void    setOldname    ( String oldname     ) {		this.oldname     = oldname ;		}
	
	
	
	public  byte[]  getProductid  () 					 {		return this.productid;				}	
	public  String  getName       () 					 {		return this.name;					}
	public  String  getCode       () 					 {		return this.code;					}
	public  String  getBoximg     () 					 {		return this.boximg;					}
	public  String  getBoximgsmall()					 {		return this.boximgsmall;			}
	
	
	public  void    setProductid  ( byte[]  productid  ) {		this.productid   = productid;		}	
	public  void    setName       ( String name        ) {		this.name        =    name ;		}
	public  void    setCode       ( String code        ) {		this.code        = code;			}
	public  void    setBoximg     ( String boximg      ) {		this.boximg	     = boximg;			}
	public  void    setBoximgsmall( String boximgsmall ) {		this.boximgsmall = boximgsmall;		}
	
	
}

