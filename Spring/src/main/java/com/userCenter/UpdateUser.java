package com.userCenter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

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
import com.dao.Dao;
import com.dao.userDao.UserDao;

// import com.dao.userDao.UserDao;

@Controller
public class UpdateUser {
	
	
	@Autowired
	@Qualifier("updateUserValidator")
	private Validator validator;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	
	@RequestMapping( value="/userCenter/updateUser" , method=RequestMethod.GET )
	public  ModelAndView  adduser( HttpSession session     , 
			                       Model       model       ) 
			                       throws      IOException {
		
		
		Boolean 			    nameident =  new Boolean(false);
		Enumeration<String> attrnames     =  session.getAttributeNames();
		String              username      =  new String("");
		
		while(  attrnames.hasMoreElements() ) {
			String  name              = (String)attrnames.nextElement();
			if(     name.equals("username")&&
				   (!session.getAttribute(name).equals(null))&&
				   (!session.getAttribute(name).equals("null"))&&
				   ( !session.getAttribute(name).equals("") )   ) {
				    nameident         =  true;
				username = (String)session.getAttribute("username");
			}
		}
		
		if( nameident ) {
			UserDao.init();
			List<User> user = UserDao.query(username);
				 session.setAttribute( "user"         , user.get(0)                      );
				 System.out.println(   "Username -- " + user.get(0).getUsername() );
		    return new ModelAndView(  "/userCenter/updateUser" , "command" , new User() );	 
		}else {
			return new ModelAndView(  "admin/logindefault"  );	
		}
		
		
	}
	
	
	@ModelAttribute("user")
	public User createUserLogModel() {
		return new User();
	}
	
	
	@RequestMapping(value="/userCenter/updateUser",method=RequestMethod.POST)
	public String validator( @ModelAttribute( "user" )
						     @Validated      
						      User             user    ,
						      BindingResult    binder  ,
						      Model            model   ,
						      HttpSession      session ) throws IOException {
		
		// 这行解决中文乱码
		String       username  = (String)session.getAttribute("username");
		             user.setUsername(username);
		
		String       password  = user.getPassword();
		
		String       firstname = new String(user.getFirstname().getBytes("ISO-8859-1"),"utf-8");
		 			 user.setFirstname(firstname);	 
		
		String       lastname  = new String(user.getLastname().getBytes("ISO-8859-1"),"utf-8");
		             user.setLastname(lastname);
		
		String       email     = new String(user.getEmail().getBytes("ISO-8859-1"),"utf-8");
		             user.setEmail(email);
		
 		String       phone     = new String(user.getPhone().getBytes("ISO-8859-1"),"utf-8");
                     user.setPhone(phone);
        
		UserDao.init();
		//String       usernamedb = Dao.testacc(username);
		
		
		
		// 1.error user enter.
        if ( binder.hasErrors() ) {
			
			return"/userCenter/updateUser";
			
			// 2.username exist.
		} else if ( password.length() <= 5 ) {
        	
			model.addAttribute( "message" , "密码长度太短 , 请输入6位或以上密码" );
			
			return"/userCenter/updateUser";
			
        } else {
        	
        	
    		model.addAttribute(  "title"   ,  "修改用户信息成功!" );
    		
    		UserDao.updatea(user);
    		
    		// 4.adduser success.
    		return "userCenter/success" ;
			
        }
        
        
	}
	
	
}
