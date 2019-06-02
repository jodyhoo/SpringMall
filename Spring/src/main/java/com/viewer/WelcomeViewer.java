package com.viewer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class WelcomeViewer extends AbstractController {

	protected ModelAndView handleRequestInternal( HttpServletRequest  request  , 
			                                      HttpServletResponse response ) 
			                                    		  throws Exception {
		
		
		ModelAndView              function  = new ModelAndView("/viewer/welcomeViewer");
		Map <String,List<String>> functionMap   = new HashMap<String,List<String>>();
		
		
		// /set
		List<String>              set          = new ArrayList<String>();
		set.add("/login");
		set.add("/img/icon/admin/login_icon.png");
		set.add("登录账户");
		functionMap.put( "0" , set );
		
		// /upload
		List<String>              upload          = new ArrayList<String>();
		upload.add("/addUser");
		upload.add("/img/icon/admin/addUser_icon.png");
		upload.add("创建账户");
		functionMap.put( "1" , upload );
		
		// changeUserinfo
		List<String>              userPage        = new ArrayList<String>();
		userPage.add("/userCenter.htm");
		userPage.add("/img/icon/userCenter/userCenter_icon.png");
		userPage.add("用户中心");
		functionMap.put( "2" , userPage );
		
		// changeUserinfo
		List<String>              changeUserinfo  = new ArrayList<String>();
		changeUserinfo.add("/shopBox.htm");
		changeUserinfo.add("/img/icon/shopCenter/shop_icon.png");
		changeUserinfo.add("购物中心");
		functionMap.put( "3" , changeUserinfo );
		
		// changeCode
		List<String>              changeCode      = new ArrayList<String>();
		changeCode.add("/serviceCenter.htm");
		changeCode.add("/img/icon/serviceCenter/service_icon.png");
		changeCode.add("服务中心");
		functionMap.put( "4" , changeCode );

		
		request.setAttribute( "userCenterFunctionMap" , functionMap );
		
		return       function;
		
	}
	
	
}
































