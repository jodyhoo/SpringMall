package com.userCenter.productCenter;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Product;
import com.bean.User;
import com.dao.Dao;

@Controller
public class RemoveProduct {
	
	/*
	@Autowired
	@Qualifier("adduservalidator")
	private Validator validator;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	*/
	
	@RequestMapping(value="/userCenter/removeProduct",method=RequestMethod.GET )
	public ModelAndView adduser() {
		return new ModelAndView( "/userCenter/productCenter/removeProduct" , "command" , new User() );
	}
	
	@ModelAttribute("product")
	public Product createUserLogModel() {
		return new Product();
	}
	
	/*
	@RequestMapping(value="/userCenter/addProduct",method=RequestMethod.POST)
	public String validator( @ModelAttribute( "product" )
						     @Validated      
						      Product          product ,
						      BindingResult    binder  ,
						      Model            model   ,
						      HttpSession      session ) throws IOException {
		
		// 这行解决中文乱码
		String       username   = new String(product.getUsername().getBytes("ISO-8859-1"),"utf-8");
		product.setUsername(username);
					 
		String       password   = user.getPassword();
		
		String       firstname   = new String(user.getUsername().getBytes("ISO-8859-1"),"utf-8");
		 			 user.setUsername(firstname);			 
		
		String       lastname   = new String(user.getUsername().getBytes("ISO-8859-1"),"utf-8");
		 			 user.setUsername(lastname);	 
	
		String       email   = new String(user.getUsername().getBytes("ISO-8859-1"),"utf-8");
		 			 user.setUsername(email);
		
		
		Dao.init();
		String       usernamedb = Dao.testacc(username);
		
		// 1.error user enter.
        if ( binder.hasErrors() ) {
			
			return"/admin/addUser";
			
			// 2.username exist.
		} else if ( !usernamedb.equals("") )  {
			model.addAttribute( "message" , "用户名已存在" );
			return "admin/addUser";
			
			// 3.密码为空 
        } else if ( password.length() == 0 ){
        	
			model.addAttribute( "message" , "密码不能为空" );
			return "admin/addUser";
			
			// 4.密码太短
        } else if ( password.length() <= 6 ) {
        	
			model.addAttribute( "message" , "密码长度太短" );
			return "admin/addUser";
        } else {
        	
    		model.addAttribute( "username" ,  username   );
    		model.addAttribute( "password" ,  password   );
    		model.addAttribute(  "title"   , "添加用户成功!" );
    		
    		Dao.inserta(user);
    		
    		session.setAttribute( "username" , "" );
    		
    		// 4.adduser success.
    		return "admin/success" ;
			
        	//else if ( password.length() <= 8 ) {
        }
		
		
	}
	*/
	
	
}




