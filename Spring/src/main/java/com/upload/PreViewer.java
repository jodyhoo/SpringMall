package com.upload;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.Dao;

@Controller
public class PreViewer {
	
	@RequestMapping(value="previewer",method=RequestMethod.GET)
	public ModelAndView preViewer() {
		return new ModelAndView("/upload/preViewer");
	}
	
	/*
	@RequestMapping()
	public ModelAndView insertViewer(HttpSession session) throws IOException {
		
		Dao.init();
		
		List<String> tempimg    = (List<String>)session.getAttribute("tempimg"); 
		
		String       username   = new String(((String)session.getAttribute("username")).getBytes("ISO-8859-1"),"utf-8");
		
		
		
		
		Iterator     itera   =  tempimg.iterator();
		while(itera.hasNext()) {
		 	String imgPath = (String)itera.next();
		 	
		}
		
		return new ModelAndView("");
	}
	*/
}
