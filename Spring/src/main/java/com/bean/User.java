package com.bean;


public class User {
	
	
	private String  username ;
	private String  password ;
	private String  firstname;
	private String  lastname ;
	private String  phone    ;
	private String  email    ;
	
	
	public  String  getUsername () {
		return this.username;
	}
	public  String  getPassword () {
		return this.password;
	}
	public  String  getFirstname() {
		return this.firstname;
	}
	public  String  getLastname () {
		return this.lastname;
	}
	public  String  getPhone    () {
		return this.phone   ;
	}
	public  String  getEmail    () {
		return this.email   ;
	}

	
	public  void    setUsername (String username){
		this.username  = username;
	}
	public  void    setPassword (String password){
		this.password  = password;
	}
	public  void    setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public  void    setLastname (String lastname) {
		this.lastname  = lastname;
	}
	public  void    setPhone    (String phone   ) {
		this.phone     = phone   ;
	}
	public  void    setEmail    (String email   ) {
		this.email     = email   ;
	}
	
	
}

