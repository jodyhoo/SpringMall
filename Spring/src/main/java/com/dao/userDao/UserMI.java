package com.dao.userDao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bean.User;

public interface UserMI {
	
	/*
	final String update     = "UPDATE        USER WHERE id       =#{id}";
	
	@Update(update)
	int update(User user);
	*/
	
	@Update("UPDATE USER SET password = #{password}   WHERE username =#{username}; ")
	public int updatePasw(User user);
	
	@Update("UPDATE USER SET PASSWORD = #{password} , FIRSTNAME = #{firstname} , LASTNAME = #{lastname} , phone = #{phone} , email = #{email}  WHERE username =#{username}; ")
	public int update(User user);
	
	@Select("SELECT * FROM user WHERE username = #{username}; ")
	public List<User> query(String username);
	
	
	
	
}
