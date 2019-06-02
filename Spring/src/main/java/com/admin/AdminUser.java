package com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class AdminUser /*extends MultiActionController*/ {
	
    public ModelAndView home( HttpServletRequest  request  ,
    						  HttpServletResponse response ) 
    								  throws Exception {
        ModelAndView model = new ModelAndView("home");
        model.addObject( "message" , "Home" );
        return model;
    }
    
    
}






