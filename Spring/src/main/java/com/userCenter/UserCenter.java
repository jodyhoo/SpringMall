package com.userCenter;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserCenter /*extends AbstractController*/ {

	@RequestMapping(value={"/userCenter"},method=RequestMethod.GET)
	protected ModelAndView userCenter( HttpServletRequest  request   , 
                                       HttpServletResponse response  , 
                                       HttpSession         session   ) 
                                    		  	   throws  Exception { 
		
		
        response.setCharacterEncoding("UTF-8");
        //设置浏览器以UTF-8编码进行接收,解决中文乱码问题
        response.setContentType("text/html;charset=UTF-8");
        
        
		
        
		/**************** identify user ****************/ 
		String   username  =  (String)session.getAttribute("username");
		if(      username !=   null  );
		/*************************************************/ 
		
		
		
		
		/**************** cookie part ****************/ 
		Cookie[]    cookies =  request.getCookies();
		
		
		
		
		Boolean  setcookie  =  false; 
		Boolean  setsource  =  false; 
		for( int i = 0 ; i < cookies.length ; i++ ) { 
			
			 /**************** usertemp identify part ****************/ 
			 if (   cookies[i].getName().equals("usertemp")   ) { 
				 setcookie  =  true; 
				 session.setAttribute( "usertemp"                 , cookies[i].getValue() ); 
				 System.out.println  ( "Reading Local Cookie -- " + cookies[i].getName()   + " -- " + cookies[i].getValue() );
			 }
			 
			 /**************** source   identify part ****************/ 
			 if (   cookies[i].getName().equals("source")   ) 
				 setsource  =  true; 
			 
			 if (   cookies[i].getName().equals("source")   ) ; 
			 
		} 
		
		
		
		
		// add cookie
		if( setcookie == false ) {
			Cookie 		       usertemp  =  new Cookie( "usertemp" , "user"+System.currentTimeMillis() );
							// store cookie in local computer for 15 days
							   usertemp.setMaxAge(60*60*24*15);
			response.addCookie(usertemp);
			System.out.println( "Adding New Cookie -- " + usertemp.getName() + " -- " + usertemp.getValue() );
		}
		
		
		
		
		
		if( setsource == false ) {}
		
		
		
		
		
 	    /**************** Device part ****************/ 
  		String  header = request.getHeader( "User-Agent" ); 
		System.out.println( "header -- " + header + "\n\n" );
		
		if(     header.indexOf("Mobile") != -1 ) {
			System.out.println( "\n\n" + "****************Mobile  Device****************" + "\n\n" );
		} else {
			System.out.println( "\n\n" + "****************Desktop Device****************" + "\n\n" );
		} 	   		   
		/*************************************************/ 
		
		
		
		
		
		/*************************************************/ 
		
		
		
		
		
		/**************** IP Address part ****************/ 
        // Returns the instance of InetAddress containing
        // local host name and address
        InetAddress localhost = InetAddress.getLocalHost();
        
        System.out.println( "System IP Address : " + (localhost.getHostAddress()).trim() );
        
		PrintWriter out       = response.getWriter();
		
        // Find public IP address
		/*
        String systemipaddress = "";
        try
        {
            URL             url_name  =  new  URL("http://jodyhoo.iicp.net:15953/device");
            BufferedReader  sc        =  new  BufferedReader(new InputStreamReader(url_name.openStream()));
            
            // reads system IPAddress
            systemipaddress = sc.readLine().trim();
        }
        catch (Exception e)
        {
            systemipaddress = "Cannot Execute Properly";
        }
        System.out.println( "Public IP Address : " + systemipaddress +"\n");		
 	   		   out.write(   "Public IP Address : " + systemipaddress +"\n");	        
         */
		/*************************************************/ 
        
        
 	   	
        
        /******** clean add product session part ********/ 
    		session.removeAttribute( "styleimg"           );
    		session.removeAttribute( "styleimgsmall"      );
			session.removeAttribute( "stylerow"           );
			session.removeAttribute( "stylename"          );
			
		for( int i = 0 ; i < 6 ;i++ ) {
    		session.removeAttribute("boximg"     +String.valueOf(i));
    		session.removeAttribute("boximgsmall"+String.valueOf(i));
		}
		/*************************************************/ 
		
		
		
		
		/******** set userCenter MVC ********/
		ModelAndView              function      = new ModelAndView("/userCenter/userCenter");
		Map <String,List<String>> functionMap   = new HashMap<String,List<String>>();
		
		/*
		// /set
		List<String>              set          = new ArrayList<String>();
		set.add("/set.htm");
		set.add("/img/icon/userCenter/set_icon.png");
		set.add("更改设置");
		functionMap.put( "0" , set );
		 */
		
		
		// /upload
		List<String>              upload          = new ArrayList<String>();
		upload.add("/upload");
		upload.add("/img/icon/userCenter/upload_icon.png");
		upload.add("上传图片");
		functionMap.put( "0" , upload );
		
		
		// changeUserinfo
		List<String>              userPage        = new ArrayList<String>();
		userPage.add("/userCenter/userPage");
		userPage.add("/img/icon/userCenter/userPage_icon.png");
		userPage.add("我的产品");
		functionMap.put( "1" , userPage );
		
		// changeUserinfo
		List<String>              changeUserinfo  = new ArrayList<String>();
		changeUserinfo.add("/userCenter/updateUser");
		changeUserinfo.add("/img/icon/userCenter/changeUserinfo_icon.png");
		changeUserinfo.add("更改用户资料");
		functionMap.put( "2" , changeUserinfo );
		
		/*
		// changeCode
		List<String>              changeCode      = new ArrayList<String>();
		changeCode.add("/changeCode.htm");
		changeCode.add("/img/icon/admin/changeCode_icon.png");
		changeCode.add("更改密码");
		functionMap.put( "3" , changeCode );
		*/
		
		// addUser
		List<String>              addUser  = new ArrayList<String>();
		addUser.add("/addUser");
		addUser.add("/img/icon/admin/addUser_icon.png");
		addUser.add("创建账户");
		functionMap.put( "4" , addUser );
		
		
		// login
		List<String>              login    = new ArrayList<String>();
		login.add("/login");
		login.add("/img/icon/admin/login_icon.png");
		login.add("登录账户");
		functionMap.put( "5" , login );
		
		
		// productCenter part.
		// addProduct
		List<String>              addProduct    = new ArrayList<String>();
		addProduct.add("/userCenter/addProduct");
		addProduct.add("/img/icon/userCenter/productCenter/addProduct_icon.png");
		addProduct.add("添加产品");
		functionMap.put( "6" , addProduct );
		
		
		/*
		// removeProduct
		List<String>              removeProduct = new ArrayList<String>();
		removeProduct.add("/userCenter/removeProduct");
		removeProduct.add("/img/icon/userCenter/productCenter/removeProduct_icon.png");
		removeProduct.add("删除产品");
		functionMap.put( "8" , removeProduct );
		
		
		// changeProductInfo
		List<String>              changeProductInfo = new ArrayList<String>();
		changeProductInfo.add("/userCenter/changeProductInfo");
		changeProductInfo.add("/img/icon/userCenter/productCenter/changeProductInfo_icon.png");
		changeProductInfo.add("更改产品信息");
		functionMap.put( "9" , changeProductInfo );
		*/
		
		// dataCenter
		List<String>              data = new ArrayList<String>();
		data.add("/data");
		data.add("/img/icon/dataCenter/data_icon.png");
		data.add("数据中心");
		functionMap.put( "7" , data );
		
		// changeUserinfo
		List<String>              cart  = new ArrayList<String>();
		cart.add("/cart");
		cart.add("/img/icon/shopCenter/shop_icon.png");
		cart.add("购物车");
		functionMap.put( "8" , cart );
		
		request.setAttribute( "userCenterFunctionMap" , functionMap );
		
		/*************************************************/ 
		
		
		
		
		
		return       function;
		
		
		
		
		
	}
	
	
}


