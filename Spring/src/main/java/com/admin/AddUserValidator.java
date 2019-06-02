package com.admin;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.bean.User;

public class AddUserValidator implements Validator {
	
	public boolean supports( Class<?> clazz ) {
		return User.class.isAssignableFrom(clazz);
	}
	
	public void    validate( Object   obj   , 
			                 Errors   err   ) {
		ValidationUtils.rejectIfEmptyOrWhitespace( err , "username" , null , "�������û���" );
		//ValidationUtils.rejectIfEmptyOrWhitespace( err , "password" , null , "���벻��Ϊ��"  );
	}
	
}
