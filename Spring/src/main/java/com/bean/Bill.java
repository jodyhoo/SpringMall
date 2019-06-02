package com.bean;

public class Bill {
	
	public enum BILL { AFTERBUILD , CLOSE , SELLERCANCEL , BUYERCANCEL , AFTERPAY , ONROAD , AFTERRECIEVE , ARGUMENT , FINISH , FINISHCOMMENT } ;
	
    private Integer  billid     ;
	private byte[]   productid  ;
	private String   username   ;
	private String   quantity   ;
	private String   sumprice   ;
	private String   status     ;
	
	
	public  Bill() {}
	
	public  Bill( byte[]   productid   , 
			      String   username    , 
			      String   productname , 
			      String   quantity    ,
			      String   sumprice    ,
			      String   status      ) {
		
		this.productid   = productid  ;
		this.username    = username   ;
		this.quantity    = quantity   ;
		this.sumprice    = sumprice   ;
		this.status      = status     ;
	}
	
	
	public void setBillid   ( Integer billid    ) {
		this.billid      = billid   ;
	}
	public void setProductid( byte[]  productid ) {
		this.productid   = productid;
	}
	public void setUsername ( String username   ) {
		this.username    = username ;
	}
	public void setQuantity ( String quantity   ) {
		this.quantity    = quantity;
	}
	public void setSumprice ( String sumprice   ) {
		this.sumprice    = sumprice;
	}
	public void setStatus   ( String status     ) {
		this.status      = status ;
	}
	
	
	public Integer getBillid  () {
		return this.billid;
	}
	public byte[] getProductid() {
		return this.productid;
	}
	public String getUsername() {
		return this.username;
	}
	public String getQuantity() {
		return this.quantity;
	}
	public String getSumprice() {
		return this.sumprice;
	}
    public String getStatus     () {
    	return this.status;
    }
	
    
}



