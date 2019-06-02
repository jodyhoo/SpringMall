package com.userCenter.productCenter;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.buffer.imgbuffer.BoxImgBuffer;
import com.userCenter.productCenter.imgCenter.BoxImgCenter;

import sun.misc.BASE64Encoder;

@Controller
public class StyleCenter {
	
	
	@RequestMapping( value={ "/storeStyle" , "/userCenter/storeStyle" } , method=RequestMethod.POST )
	public @ResponseBody String   storestyle(HttpServletRequest		     request  ,
						  	 HttpSession                 session  ) 
		   throws UnsupportedEncodingException          		  {
		
		System.out.println( "\n" + "--------styleCenter--------" + "\n" );
		
	   
		Map<String,String>   stylemap        =   new    HashMap<String,String>();
		String               stylename[]     =   		request.getParameterValues("stylename");
		if(                  stylename.length==0) 
			                 stylename[0]    =  (String)request.getParameter("stylename");
		
		String               stylerow ; 
		
		
		if  ( stylename.length%4==0 ) stylerow = String.valueOf(stylename.length/4  );
		else 						  stylerow = String.valueOf(stylename.length/4+1);
		
		for( int i = 0 ; i < stylename.length ; i++ ) 
			stylemap.put( "style"+i ,  URLDecoder.decode( stylename[i] ,"utf-8" ) );
		
							
							 session.removeAttribute( "stylename" );
							 session.setAttribute( 	  "stylename"  , stylemap );
							 
							 session.removeAttribute( "stylerow"  );
							 session.setAttribute( 	  "stylerow"   , stylerow );
							 
							 
							 
		/**************** test infor****************/	
		
			System.out.println( "stylename.length   --------- " + stylename.length );
			System.out.println( "stylerow           --        " + stylerow  );
			
			for( int i = 0 ; i < stylename.length ; i++ ) 
				System.out.println( "stylename " + i  + " " + URLDecoder.decode( stylename[i] ,"utf-8" ) );
		 
		/****************           ****************/		
		
		
		return "";
			
	}	
	
	
	
	@RequestMapping(value={"/styleimgUpload","/userCenter/styleimgUpload"},method=RequestMethod.POST )
	public void styleimg( MultipartHttpServletRequest request  ,
						  HttpServletResponse 		  response ,
						  HttpSession           	  session  , 
						  ModelAndView          	   mav     ) throws IOException {
		
		
		System.out.println( "\n" + "--------Entering styleimgUploader--------" );
		
		// 1.get information
		MultipartFile                  mpf   =  request.getFile("img");
		String                    stylecode  =  request.getParameter("stylecode");
		
		
		
		System.out.println( "stylecode -- " + stylecode );
		
		
		
		// 2.get session infor
		
	    Map<String,BoxImgBuffer>        styleimgmap 	 =  (  Map<String,BoxImgBuffer>  )session.getAttribute("styleimg");
	    Map<String,BoxImgBuffer>        styleimgsmallmap =  (  Map<String,BoxImgBuffer>  )session.getAttribute("styleimgsmall");
	    
	    
		if( 	 styleimgmap      == null ) 
				 styleimgmap      =  new  HashMap<String,BoxImgBuffer>(); 
		
		if(      styleimgsmallmap == null )
			     styleimgsmallmap =  new  HashMap<String,BoxImgBuffer>();
		
		
		
		//System.out.println( "stylesum 			 : " + stylesum     );
		System.out.println( "curstyle 			 : " + stylecode    );
		
		System.out.println( "getBytes 			 : " + mpf.getBytes().length     );
		System.out.println( "getOriginalFilename : " + mpf.getOriginalFilename() );
		
		
		
		String		  basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		
		//URL         imgurl = new URL( basePath   +  session.getAttribute( "boxImg5" )  );
		
		
		BoxImgBuffer  boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer  boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream   is                = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage urlImage          = ImageIO.read(is);
		BufferedImage smallBoxImg       = BoxImgCenter.resizeBoxImg160(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos      = new ByteArrayOutputStream();
        
        String        smallImgType      = mpf.getOriginalFilename();
        Integer       pointpost         = mpf.getOriginalFilename().lastIndexOf(".");
        String        typesuffix        = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
        				    baos.flush();
        				    boximgsmallbuffer.setBytes(baos.toByteArray());
			
        	BASE64Encoder encoder = new BASE64Encoder();			    
        	String		  base64  =  encoder.encode(baos.toByteArray());
			
			System.out.println( "" + mpf.getContentType() );
			
						 FileCopyUtils.copy( String.valueOf("<img src='data:"+mpf.getContentType()+";base64,"+base64+"'/>").getBytes() , response.getOutputStream() );
						 
						 baos.close();
						 
						 
						 boximgbuffer.setName 			 (  mpf.getName 		   () );
						 boximgbuffer.setBytes			 (  mpf.getBytes		   () );
						 boximgbuffer.setOriginalFilename(  mpf.getOriginalFilename() );
						 boximgbuffer.setContentType	 (  mpf.getContentType	   () );
						
						 boximgsmallbuffer.setName            (  		 mpf.getName            () );
						 boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename() );
						 boximgsmallbuffer.setContentType     ( 		 mpf.getContentType	    () );
			
			
			styleimgmap.remove     ( "styleimg"      + stylecode );
			styleimgmap.put        ( "styleimg"      + stylecode , boximgbuffer );
			
			
			styleimgsmallmap.remove( "styleimgsmall" + stylecode );
			styleimgsmallmap.put   ( "styleimgsmall" + stylecode , boximgsmallbuffer);
			
			
			session.setAttribute   ( "styleimg"      , styleimgmap);
			session.setAttribute   ( "styleimgsmall" , styleimgsmallmap );
			
			
			
			
			
	}	
	
	
}

