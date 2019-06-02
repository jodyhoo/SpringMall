package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.bean.User;

public interface UserMI  {
	
	final String getAll     = "SELECT * FROM STUDENT";
	final String getbyfname = "SELECT * FROM STUDENT WHERE firstname=#{firstname}";
	final String update     = "UPDATE        STUDENT WHERE id       =#{id}";
	final String deletebyid = "DELETE   FROM STUDENT WHERE id       =#{id}";
	final String insert     = "INSERT INTO   STUDENT(  firstname  ,   lastname  )"+
	                          "VALUES               (#{firstname} ,  #{lastname} )";
	
	@Select(getAll)
	@Results(value = {
		@Result(property = "id"        , column = "ID"        ),
		@Result(property = "firstname" , column = "FIRSTNAME" ),
		@Result(property = "lastname"  , column = "LASTNAME"  )
	})
	List<User> getAll();
	
	@Select ("select * from User where username=#{username}")
	public List<User> queryPaswa(String username);
	
	
	@Insert ("INSERT INTO User(username,password,firstname,lastname,phone,email) VALUES(#{username},#{password},#{firstname},#{lastname},#{phone},#{email});")
	public int insert(User user);
	
	
	@Select ("select * from Student where id=#{id}")
	public List<User> querybyid(int id);
}















