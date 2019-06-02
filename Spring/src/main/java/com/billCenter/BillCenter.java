package com.billCenter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BillCenter {
	
	@RequestMapping(value={"addbill"},method=RequestMethod.GET)
	public ModelAndView addbill( HttpServletRequest request ,
								 ModelAndView		mav     ) {
		
		
			   mav.setViewName("addbill");
		return mav;
		
	}
	
	@RequestMapping(value={"deletebill"},method=RequestMethod.GET)
	public ModelAndView deletebill( ModelAndView mav ) {
		
			   mav.setViewName("addbill");
		return mav;
		
	}
	
	@RequestMapping(value={"cbillstatus"},method=RequestMethod.GET)
	public ModelAndView cbillstatus( ModelAndView mav ) {
		
			   mav.setViewName("cbillstatus");
		return mav;
		
	}
	
	
}






