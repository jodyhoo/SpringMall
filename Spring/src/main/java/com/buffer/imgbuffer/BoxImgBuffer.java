package com.buffer.imgbuffer;

public class BoxImgBuffer {
	
	public enum LONGEREDGE { HEIGHT , WIDTH , NONE  };
	
    private byte[]     bytes;
    private String     name;
    private String     originalFilename;
    private String     contentType;
    private LONGEREDGE longeredge;
    
    
    public  void       setBytes( byte[] bytes ) {
    	this.bytes = bytes;
    }
    public  void       setName ( String name  ) {
    	this.name = name;
    }
    public  void       setOriginalFilename( String originalFilename ) {
    	this.originalFilename = originalFilename;
    }
    public  void       setContentType ( String     contentType ) {
    	this.contentType = contentType;
    }
    public  void       setLongeredge ( LONGEREDGE longeredge ) {
    	this.longeredge = longeredge;
    }
    
    
    public  byte[]     getBytes           () {
    	return this.bytes;
    }
    public  String     getName            () {
    	return this.name;
    }
    public  String     getOriginalFilename() {
    	return  this.originalFilename;
    }
    public  String     getContentType     () {
    	return  this.contentType;
    }
    public  LONGEREDGE getLongeredge      () {
    	return  this.longeredge;
    }
    
}




