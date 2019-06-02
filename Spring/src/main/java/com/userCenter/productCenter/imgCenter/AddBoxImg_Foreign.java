package com.userCenter.productCenter.imgCenter;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import com.buffer.imgbuffer.BoxImgBuffer;
import com.dao.productDao.ProductDao;

public class AddBoxImg_Foreign {
	/*
	public static void insertBoxImg(String username , HttpSession session) {
		
		
		//1.prepare data.
		
		BoxImgBuffer  BoxImg0           = (BoxImgBuffer)session.getAttribute("boximg0");
		BoxImgBuffer  BoxImgSmall0      = (BoxImgBuffer)session.getAttribute("boximgsmall0");
		//BoxImgBuffer                     boximg0  =  BoxImgs.get("boximg0");
		
		byte[]        boximg0bytes      = BoxImg0.bytes;
		byte[]        boximgsmall0bytes = BoxImgSmall0.bytes;
		
		// 3.create file.
		
		// 将tomcat 的版本号去掉
		// 文件夹名称改为tomcat       
		String       rootPath = new String("c:/tomcat/webapps/Spring/WEB-INF/img/users");
		//File         file     = new File  (rootPath);
		
		String       date     = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
		String       time     = new SimpleDateFormat( "HHmmss" ).format(Calendar.getInstance().getTime());
		
		
		// 2.record into local
		
		// 3.create current date and time folder.
		File         userfolder = new File  (rootPath+"/"+username+"/"+date+"/"+time);
		
		if ( !userfolder.exists() ) {
			userfolder.mkdirs();
		}
		
		
		// 4.create file.
		File         userimgfile      = new File  (rootPath+"/"+username+"/"+date+"/"+time+"/"+ BoxImg0.originalFilename      );
		             userimgfile.createNewFile();
		File         userimgsmallfile = new File  (rootPath+"/"+username+"/"+date+"/"+time+"/"+ BoxImgSmall0.originalFilename );
		             userimgsmallfile.createNewFile();
		             
		             
	    // ultimate store path.
		String       imgsufficPath      = new String("/img/users/"+username+"/"+date+"/"+time+"/"+ BoxImg0.originalFilename); 
		String       imgsmallsufficPath = new String("/img/users/"+username+"/"+date+"/"+time+"/"+ BoxImgSmall0.originalFilename); 
		
		@SuppressWarnings("resource")
		FileOutputStream fous      = new FileOutputStream(userimgfile);
		                 fous.write(boximg0bytes);
		                 fous.close();
		                 
		FileOutputStream fsmallous = new FileOutputStream(userimgsmallfile);
						 fsmallous.write(boximgsmall0bytes);             
						 fsmallous.close();
						 
		System.out.println( "getAbsolutePath  : " + userimgfile.getAbsolutePath() );
		System.out.println( "getCanonicalPath : " + userimgfile.getCanonicalPath() );
		
		product.setPhotoaddr(imgsmallsufficPath);
		
		ProductDao.init();
		ProductDao.insertAll(product);
		
		
		
	}
	*/
}
