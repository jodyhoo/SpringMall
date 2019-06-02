package com.admin;

import java.io.IOException;

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
import org.springframework.web.servlet.ModelAndView;

import com.bean.User;
import com.bean.UserLog;
import com.dao.Dao;
/*
username   CHARACTER(20) NOT NULL PRIMARY KEY      ,
	password   CHARACTER(20) NOT NULL DEFAULT '123456' ,
 firstname  CHARACTER(20)     NULL DEFAULT ''       ,
 phone      INTEGER  (11)     NULL DEFAULT ''       ,
 email
 */
@Controller
public class AddUser {
	
	
	@Autowired
	@Qualifier("addUserValidator")
	private Validator validator;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(value="addUser",method=RequestMethod.GET )
	public ModelAndView adduser() {
		return new ModelAndView( "/admin/addUser" , "command" , new User() );
	}
	
	@ModelAttribute("user")
	public User createUserLogModel() {
		return new User();
	}
	
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String validator( @ModelAttribute( "user" )
						     @Validated      
						      User             user    ,
						      BindingResult    binder  ,
						      Model            model   ,
						      HttpSession      session ) throws IOException {
		
		// 这行解决中文乱码
		String       username   = new String(user.getUsername().getBytes("ISO-8859-1"),"utf-8");
					 user.setUsername(username);
					 
		String       password   = user.getPassword();
		
		String       firstname   = new String(user.getFirstname().getBytes("ISO-8859-1"),"utf-8");
		 			 user.setFirstname(firstname);	 
		
		String       lastname   = new String(user.getLastname().getBytes("ISO-8859-1"),"utf-8");
		             user.setLastname(lastname);
	
		String       email   = new String(user.getEmail().getBytes("ISO-8859-1"),"utf-8");
		             user.setEmail(email);
		
		
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
        } else if ( password.length() <= 5 ) {
        	
			model.addAttribute( "message" , "密码长度太短 , 请输入6位或以上密码" );
			return "admin/addUser";
        } else {
        	
    		model.addAttribute( "username" ,  username   );
    		model.addAttribute( "password" ,  password   );
    		model.addAttribute(  "title"   ,  " 添加用户成功!" );
    		
    		Dao.inserta(user);
    		
    		session.setAttribute( "username" , "" );
    		
    		// 4.adduser success.
    		return "admin/success" ;
			
        	//else if ( password.length() <= 8 ) {
        }
		
		
	}
	
	
}








