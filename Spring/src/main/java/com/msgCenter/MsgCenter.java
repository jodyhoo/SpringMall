package com.msgCenter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MsgCenter {
	
	@RequestMapping(value={"/msgCenter"},method=RequestMethod.GET)
	public ModelAndView msgpage( ModelAndView mav ) {
		       mav.setViewName("msgCenter/msgPage");
		return mav;
	}
	
}
