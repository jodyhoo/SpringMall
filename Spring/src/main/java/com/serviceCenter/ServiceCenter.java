package com.serviceCenter;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class ServiceCenter extends AbstractController {
	
	@Override
	protected ModelAndView handleRequestInternal( HttpServletRequest  request  , 
			                                      HttpServletResponse response ) 
			                                    		  throws Exception {
		ModelAndView              function  = new ModelAndView("/serviceCenter/serviceCenter");
		Map <String,List<String>> functionMap   = new HashMap<String,List<String>>();
		
		
		/* addUser
		 * */
		
		
		/* 				<a href="<%=basePath%>/serviceCenter.htm">
					<img src="<%=basePath%>/img/icon/serviceCenter/service_icon.png"   width="100"/><br />
					�û�����
				</a>
				</td>
				
				<td width="50"></td>
				
				<td align="center">
				<a href="<%=basePath%>/contact.htm">
					<img src="<%=basePath%>/img/icon/serviceCenter/contact_icon.png"   width="100"/><br />
					��ϵ�ͷ�
				</a>
				</td>
				
				
				<td width="50"></td>
				
				<td align="center">
				<a href="<%=basePath%>/contact.htm">
					<img src="<%=basePath%>/img/icon/serviceCenter/contact_icon.png"   width="100"/><br />
					����˵��
		 * */
		
		
		// /set
		List<String>              set          = new ArrayList<String>();
		set.add("/serviceCenter.htm");
		set.add("/img/icon/serviceCenter/service_icon.png");
		set.add("�û�����");
		functionMap.put( "0" , set );
		
		// /upload
		List<String>              upload          = new ArrayList<String>();
		upload.add("/contact.htm");
		upload.add("/img/icon/serviceCenter/contact_icon.png");
		upload.add("��ϵ�ͷ�");
		functionMap.put( "1" , upload );
		
		// changeUserinfo
		List<String>              userPage        = new ArrayList<String>();
		userPage.add("/contact.htm");
		userPage.add("/img/icon/serviceCenter/contact_icon.png");
		userPage.add("����˵��");
		functionMap.put( "2" , userPage );
		
		
		/*
		// changeUserinfo
		List<String>              changeUserinfo  = new ArrayList<String>();
		changeUserinfo.add("/changeUserinfo.htm");
		changeUserinfo.add("/img/icon/userCenter/changeUserinfo_icon.png");
		changeUserinfo.add("�����û�����");
		functionMap.put( "3" , changeUserinfo );
		
		// changeCode
		List<String>              changeCode      = new ArrayList<String>();
		changeCode.add("/changeCode.htm");
		changeCode.add("/img/icon/admin/changeCode_icon.png");
		changeCode.add("��������");
		functionMap.put( "4" , changeCode );
		
		// addUser
		List<String>              addUser  = new ArrayList<String>();
		addUser.add("/addUser");
		addUser.add("/img/icon/admin/addUser_icon.png");
		addUser.add("�����˻�");
		functionMap.put( "5" , addUser );
		
		// login
		List<String>              login    = new ArrayList<String>();
		login.add("/login");
		login.add("/img/icon/admin/login_icon.png");
		login.add("��¼�˻�");
		functionMap.put( "6" , login );
		
		
		
		// productCenter part.
		// addProduct
		List<String>              addProduct    = new ArrayList<String>();
		addProduct.add("/userCenter/addProduct");
		addProduct.add("/img/icon/userCenter/productCenter/addProduct_icon.png");
		addProduct.add("��Ӳ�Ʒ");
		functionMap.put( "7" , addProduct );
		
		
		// removeProduct
		List<String>              removeProduct = new ArrayList<String>();
		removeProduct.add("/userCenter/removeProduct");
		removeProduct.add("/img/icon/userCenter/productCenter/removeProduct_icon.png");
		removeProduct.add("��Ӳ�Ʒ");
		functionMap.put( "8" , removeProduct );
		
		// changeProductInfo
		List<String>              changeProductInfo = new ArrayList<String>();
		changeProductInfo.add("/userCenter/changeProductInfo");
		changeProductInfo.add("/img/icon/userCenter/productCenter/changeProductInfo_icon.png");
		changeProductInfo.add("���Ĳ�Ʒ��Ϣ");
		functionMap.put( "9" , changeProductInfo );
		*/
		
		
		
		request.setAttribute( "serviceCenterFunctionMap" , functionMap );
		
		return       function;
		
	}
}

