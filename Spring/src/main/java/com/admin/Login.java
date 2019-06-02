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

import com.bean.Cart;
import com.bean.UserLog;
import com.cartCenter.CartCenter;
import com.dao.Dao;
import com.dao.cartDao.CartDao;


@Controller
public class Login {
	
	@Autowired
	@Qualifier("userLogValidator")
	private Validator validator;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView( "admin/login" , "command" , new UserLog());
	}
	
	@ModelAttribute("userlog")
	public UserLog createUserLogModel() {
		return new UserLog();
	}
	
	@RequestMapping( value= "login" , method=RequestMethod.POST)
	public String validator(@ModelAttribute( "userlog" )
                            @Validated      
                             UserLog          userlog ,
                             BindingResult    binder  ,
                             Model            model   ,
                             HttpSession      session ) throws IOException {
		
		// 这行解决中文乱码
		String       username   = new String(userlog.getUsername().getBytes("ISO-8859-1"),"utf-8");
		String       password   = userlog.getPassword();
		
		userlog.setUsername(username);
		
		model.addAttribute( "username" , username );
		
		if ( binder.hasErrors() ) {
			// 1.error user enter.
			return"admin/login";
		} else {
			
            Dao.init();
            
            String usernamedb = Dao.testacc(username);
            // 2.username not exist.
            if ( usernamedb.equals("") )  {
				model.addAttribute( "message" , "用户名或密码错误." );
				// 2.error password.
				return "admin/login";
            } else {
            	
				String dbpassword = Dao.queryPaswa( username );
				
				System.out.println( "System   password : " +   password ); 
				System.out.println( "Database password : " + dbpassword ); 
				
				// validator.!
				if(  ( usernamedb!="" )&&( !dbpassword.equals(password) )  ) {
					model.addAttribute( "message" , "用户名或密码错误." );
					// 3.account exist , error password.
					return "admin/login";
				}
            	
            }
            
		}
		
		model.addAttribute( "username" , username );
		model.addAttribute( "password" , password );
		model.addAttribute(  "title"   , "登录成功!" );
		
		// 4.将username 记录进session 层.
		session.setAttribute(    "username"   , username );
		session.removeAttribute( "usertemp"  );
		
				CartCenter.cartquantity(   username  , session  );
		
		// 5.login success.
		return "admin/success" ;
		
	}
	
}






