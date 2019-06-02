package com.upload;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Upload {
	
	@RequestMapping(value="/upload",method=RequestMethod.GET)
	public ModelAndView upload() {
		return new ModelAndView( "/upload/upload" );
	}
	
	@RequestMapping(value="/uploadfile",method=RequestMethod.POST)
	public String       uploadfile(@RequestParam(     "file"    )
	                                MultipartFile      files[],
	                                Model              model  ,
	                                HttpSession        session,
	                                HttpServletRequest request) throws IOException {
		
		List<String> list     = new ArrayList<String>();
		
		/* 将tomcat 的版本号去掉
		 * 文件夹名称改为tomcat       */
		String       rootPath = new String("c:/tomcat/webapps/Spring/WEB-INF/img/users");
		//File         file     = new File  (rootPath);
		
		String       username = (String)session.getAttribute("username");
		
		String       date     = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
		
		String       time   = new SimpleDateFormat( "HHmmss" ).format(Calendar.getInstance().getTime());
		
		
		
		
		/*
		String       datatime2 = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		
		String       seconetime = new SimpleDateFormat("HHmmss").format(Calendar.getInstance().getTime());
		*/
		
		
		// 最后修改时间!
		//userfile.lastModified();
		
		
		
		Map<String,List<String>> filemap = new HashMap<String,List<String>>();
		List<String>             tempimg = new ArrayList<String>();
		
		for ( int i = 0 ; i < files.length ; i++ ) {
			
			// file establishment.
			File         userfolder = new File  (rootPath+"/"+username+"/"+date+"/"+time);
			
			if ( !userfolder.exists() ) {
				userfolder.mkdirs();
			}
			
			
			File         userfile = new File  (rootPath+"/"+username+"/"+date+"/"+time+"/"+files[i].getOriginalFilename());
			userfile.createNewFile();
			
			files[i].transferTo(userfile);
			
			
			/*  getContentType      : application/octet-stream
				getName             : file
				getOriginalFilename : Consumer.java
				getSize             : 569
			 */
			
			
			List<String> infolist = new ArrayList<String>();
			
			
			infolist.add(files[i].getContentType());
			infolist.add(files[i].getName());
			infolist.add(String.valueOf(files[i].getSize()));
			
			filemap.put (files[i].getOriginalFilename() , infolist );
			
			
			/* judge type of uplod file.
			 * getContentType      : image/jpeg             */
			System.out.println( "files[i].getContentType ().subSequence(0, 5) -- " + files[i].getContentType().subSequence(0, 5) );
			System.out.println( "userfile.getAbsolutePath()                   -- " + userfile.getAbsolutePath() );
			
			// add path into list.
			if( files[i].getContentType().subSequence(0, 5).equals("image") ) {
				// 1.get path.
				String imgpath     =  userfile.getAbsolutePath();
				System.out.println( "imgpath : " + imgpath );
				
				// 2.get root folder sub string.
				int    sort        =  imgpath.indexOf("\\Spring\\WEB-INF\\");
				System.out.println( "sort : " + sort );
				
				// 3.get suffix file path.
				String suffixpath  =  imgpath.substring(sort+"\\Spring\\WEB-INF\\".length(), imgpath.length());
				System.out.println( "suffixpath : " + suffixpath );
				
				// 4.replace local \ into server / .
				String imgsuffixpath   =  suffixpath.replace( "\\" , "/" );
				
				// 5.complete output imgpath.
				tempimg.add( request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+imgsuffixpath );
				
			}
			
			//list.add(arg0)
			files[i].getContentType() ;
			files[i].getName();
			files[i].getOriginalFilename();
			files[i].getSize();
			
			System.out.println( "getContentType      : " + files[i].getContentType     () );
			System.out.println( "getName             : " + files[i].getName            () );
			System.out.println( "getOriginalFilename : " + files[i].getOriginalFilename() );
			System.out.println( "getSize             : " + files[i].getSize            () );
			
		}
		
		// store info into session.
		session.setAttribute( "fileinfo" , filemap );
		session.setAttribute( "tempimg"  , tempimg );
		
		
		
        Calendar         cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        System.out.println( sdf.format(cal.getTime()) );
		
        //String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
        
		return "/upload/preViewer";
		
	}
	
	
	// 读取文件创建时间!
	public static void getCreateTime() {
		
		//HttpServletRequest request = localRequest.get();
		
		
		//FacesContext facesContext = FacesContext.getCurrentInstance();

		//HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(true);

		//session.setAttribute("att", att);
		
		String       rootPath = new String("c:/tomcat/webapps/Spring/WEB-INF/img/users");
		File         file     = new File  (rootPath);
		
		
		
		if ( !file.exists() ) {
			System.out.println( "create file." );
			file.mkdirs();
			
		} else {
			System.out.println( "not create file." );
		}
		
		String       createdtime = null;
		
		try {
			Process     p  = Runtime.getRuntime().exec( "cmd /C dir" + rootPath + "/tc" );
			
			InputStream is = p.getInputStream();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(is));             
			
            String line;  
            while((line = br.readLine()) != null){  
                if(line.endsWith("")){  
                	createdtime = line.substring(0,17);  
                    break;  
                }                             
            }  
			
			
		} catch ( IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("create time : " + createdtime );
		
		// cr
		
		
		//String       username = (String)session.getAttribute("username");
		//File         userfile = new File  (rootPath+"/"+username);
		
	}
	
	
	public static void main(String[] args) {
		
        Calendar         cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        System.out.println( sdf.format(cal.getTime()) );
		
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
        
        String timeStamp2 = new SimpleDateFormat("YYYYMMdd_HHmmss").format(Calendar.getInstance().getTime());
        
		System.out.println( "" + timeStamp  );
		
		System.out.println( "" + timeStamp2 );
		
		getCreateTime();
		
	}
	
}




