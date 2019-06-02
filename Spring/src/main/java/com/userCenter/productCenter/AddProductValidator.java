package com.userCenter.productCenter;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.bean.Product;
import com.bean.User;

public class AddProductValidator implements Validator {
	
	public boolean supports( Class<?> clazz ) {
		return Product.class.isAssignableFrom(clazz);
	}
	
	public void    validate( Object   obj   , 
			                 Errors   err   ) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace( err , "productname" , null , "�������Ʒ����" );
		ValidationUtils.rejectIfEmptyOrWhitespace( err , "price"       , null , "�������Ʒ�۸�" );
		ValidationUtils.rejectIfEmptyOrWhitespace( err , "quantity"    , null , "�������Ʒ����" );
		
	}
	
}



