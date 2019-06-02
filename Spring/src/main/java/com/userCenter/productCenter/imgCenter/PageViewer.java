package com.userCenter.productCenter.imgCenter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class PageViewer extends AbstractController{

	@Override
	protected ModelAndView handleRequestInternal( HttpServletRequest  request  , 
			                                      HttpServletResponse response )
			throws Exception {
		ModelAndView function  = new ModelAndView("userCenter/productCenter/pageViewer");
		
		return       function;
	}
	
}


