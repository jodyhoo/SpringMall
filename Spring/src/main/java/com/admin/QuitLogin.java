package com.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QuitLogin {
	
	@RequestMapping(value={"/userCenter/quitlogin","/quitlogin"},method=RequestMethod.POST)
	public void quitlogin( HttpServletResponse response  ,
			               HttpSession         session   ) throws IOException {
			   session.removeAttribute( "username"       );
			   session.setAttribute   ( "username" , ""  );
			   
			   System.out.println( "using quit login..." );
			   
		FileCopyUtils.copy( String.valueOf("").getBytes() , response.getOutputStream());
	}
	
}









