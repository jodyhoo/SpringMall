
package com.bean;

public class Cart {
	
	private byte[]   productid  ;
	private String   buyer      ;
	private String   seller     ;
	private String   quantity   ;
	
	public  Cart() {}
	
	public  Cart( String buyer       , 
			      String seller      ) {
		this.buyer     = buyer       ;
		this.buyer     = seller      ;
	}
	
	public  Cart( byte[] productid   , 
			      String buyer       , 
			      String seller      , 
			      String quantity    ) {
		this.productid   = productid  ;
		this.buyer       = buyer      ;
		this.buyer       = seller     ;
		this.quantity    = quantity   ;
	}
	
	public void setProductid( byte[] productid ) {
		this.productid   = productid;
	}
	public void setBuyer    ( String buyer     ) {
		this.buyer       = buyer    ;
	}
	public void setSeller   ( String seller    ) {
		this.seller      = seller   ;
	}
	public void setQuantity ( String quantity  ) {
		this.quantity    = quantity ;
	}
	
	
	public byte[] getProductid() {
		return this.productid;
	}
	public String getBuyer    () {
		return this.buyer;
	}
	public String getSeller   () {
		return this.seller;
	}
	public String getQuantity () {
		return this.quantity;
	}
	
	
}


