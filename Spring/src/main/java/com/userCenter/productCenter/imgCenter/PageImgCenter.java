package com.userCenter.productCenter.imgCenter;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.buffer.imgbuffer.BoxImgBuffer;
import com.buffer.imgbuffer.ImgBuffer;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;




@Controller
public class PageImgCenter {
	
	
	@RequestMapping(value={"/userCenter/pageUploader"},method=RequestMethod.POST) 
	public void uploader( MultipartHttpServletRequest request ,
			                              Model                       model   ,
			                              HttpSession                 session ) throws IOException { 
		
		String productPage = request.getParameter( "tempProductPage"                    );
		       				 session.setAttribute(     "productPageURL"   , productPage );
	} 
	
	
}








/*
class PageImgCenterOld {
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public void imgcenter(  ) {
		
	}
	
	@RequestMapping( value = { "/pageImgPath/{value}", "/product/index.htm" } , method=RequestMethod.GET )
	public void boxImgPath0(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		// 3.store file into session.
		//BoxImgBuffer        BoxImg       = (BoxImgBuffer)session.getAttribute("boximgsmall0");
		
		OutputStream        os           =  response.getOutputStream();
		
		PrintWriter         pwriter      =  response.getWriter();
		
		
		
		pwriter.write( "<h3>Hello</h3><br /><h2>Hello H2</h2>" );
		
		
		//FileCopyUtils.copy( BoxImg.bytes ,  response.getOutputStream());
		
	}
	
	
	
	   
     //Base64字符串转 二进制流
     
     //@param base64String Base64
     //@return base64String
     //@throws IOException 异常
    
    public static byte[] getStringImage(String base64String) throws IOException {
        BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        return base64String != null ? decoder.decodeBuffer(base64String) : null;
    }
	
	
	
    //二进制流转Base64字符串
    
    //@param data 二进制流
    //@return data
    //@throws IOException 异常
    
    public static String getImageString(byte[] data) throws IOException {
        BASE64Encoder encoder = new BASE64Encoder();
        return data != null ? encoder.encode(data) : "";
    }
    
	
	@RequestMapping(value="/pageImgUpload",method=RequestMethod.POST)
	public @ResponseBody String     uploadfile(@RequestParam(     "file"    )
	                                MultipartFile      files[],
	                                Model              model  ,
	                                HttpSession        session,
	                                HttpServletRequest request) throws IOException {
		
		System.out.println( "Entering pageImgUpload uploader..." );
		
		System.out.println( "size of names -- " + files.length );
		
		String           pagebody    = new String();
		
		
		for ( int i = 0 ; i < files.length ; i++ ) {
			
			
			System.out.println( "number " + i + " file -- " + "imgbuffer.contentType -- " + files[i].getContentType() );
			
			pagebody = pagebody.concat( "<img src='data:"+files[i].getContentType()+";base64," );
			//content of img.
			
			pagebody = pagebody.concat(  getImageString(files[i].getBytes()));
			
			pagebody = pagebody.concat("'/><br />");
			
		}
		
		return pagebody;
		
	}
	
	
	@RequestMapping(value="/pageImgUpload0",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload0( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering pageImgUpload uploader..." );
		
		//request.getf
		
		Iterator<String> names       = request.getFileNames();
		
		Map<String,MultipartFile> map = request.getFileMap();
		
		Set<String>               nameset = map.keySet();
		
		System.out.println( "size of names -- " + nameset.size() );
		
		List<ImgBuffer>  imglist     = new ArrayList<ImgBuffer>();  
		
		String           pagebody    = new String();
		
		                
		
		for ( int i = 0 ; names.hasNext() ; i++ ) {
			
			MultipartFile    mpf         = request.getFile(names.next());
			
			
			//ImgBuffer        imgbuffer   = new ImgBuffer();
			//imgbuffer.name                  =  			mpf.getName();
			//imgbuffer.bytes                 =  			mpf.getBytes();
			//imgbuffer.originalFilename      =  			mpf.getOriginalFilename();
			//imgbuffer.contentType           =  			mpf.getContentType();
			
			
			System.out.println( "number " + i + " file -- " + "imgbuffer.contentType -- " + mpf.getContentType() );
			
			
			//imglist.add(imgbuffer);
			
			
			//char[] chars = new char[imgbuffer.bytes.length];
			//
			//for( int i = 0 ; i < chars.length ; i++ ) {
			//	chars[i] = (char)imgbuffer.bytes[i];
			//}
			
			
			
			//System.out.println( "" + imgbuffer.bytes.toString() );
			
			pagebody = pagebody.concat( "<img src='data:"+mpf.getContentType()+";base64," );
			//content of img.
			pagebody = pagebody.concat(  getImageString(mpf.getBytes()));
			
			pagebody = pagebody.concat("'/><br />");
			
		}
		
		//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		
		return pagebody;
		
	}
	
}
*/



