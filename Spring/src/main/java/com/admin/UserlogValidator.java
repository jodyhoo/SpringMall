package com.admin;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.bean.UserLog;

public class UserlogValidator implements Validator {
	
	public boolean supports( Class<?> clazz ) {
		return UserLog.class.isAssignableFrom(clazz);
	}

	public void    validate( Object   obj   , 
			                 Errors   err   ) {
		ValidationUtils.rejectIfEmptyOrWhitespace( err , "username" , null , "用户名不能为空" );
		ValidationUtils.rejectIfEmptyOrWhitespace( err , "password" , null , "密码不能为空" );
	}
	
}







