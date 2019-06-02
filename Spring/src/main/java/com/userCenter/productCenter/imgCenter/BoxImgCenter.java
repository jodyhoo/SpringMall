package com.userCenter.productCenter.imgCenter;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.buffer.imgbuffer.BoxImgBuffer;
import com.buffer.imgbuffer.BoxImgBuffer.LONGEREDGE;

@Controller
public class BoxImgCenter  {
	
	
	public static LONGEREDGE getLongEdge75 ( String basePath , String boximgaddr ) throws IOException {
		
		URL           urlInput = new URL(basePath+boximgaddr);
		BufferedImage urlImage = ImageIO.read(urlInput.openStream());
		
		if (( urlImage.getHeight() < 75 )&&( urlImage.getWidth() < 75 ))
			return LONGEREDGE.NONE;
			
		if ( urlImage.getHeight() > urlImage.getWidth() ) 
			return LONGEREDGE.HEIGHT;
		else 
			return LONGEREDGE.WIDTH ;
	}
	
	public static LONGEREDGE getLongEdge160( String basePath , String boximgaddr ) throws IOException {
		
		URL           urlInput = new URL(basePath+boximgaddr);
		BufferedImage urlImage = ImageIO.read(urlInput.openStream());
		
		if (( urlImage.getHeight() < 160 )&&( urlImage.getWidth() < 160 ))
			return LONGEREDGE.NONE;
			
		if ( urlImage.getHeight() > urlImage.getWidth() ) 
			return LONGEREDGE.HEIGHT;
		else 
			return LONGEREDGE.WIDTH ;
	}
	
	public static LONGEREDGE getLongEdge510( String basePath , String boximgaddr ) throws IOException {
		
		URL           urlInput = new URL(basePath+boximgaddr);
		BufferedImage urlImage = ImageIO.read(urlInput.openStream());
		
		if (( urlImage.getHeight() < 510)&&( urlImage.getWidth() < 510 ))
			return LONGEREDGE.NONE;
			
		if ( urlImage.getHeight() > urlImage.getWidth() ) 
			return LONGEREDGE.HEIGHT;
		else 
			return LONGEREDGE.WIDTH ;
	}
	
	
	public static BufferedImage resize(BufferedImage img, int newW, int newH) { 
		Image         tmp  = img.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
		
	    //BufferedImage dimg = new BufferedImage(newW, newH, BufferedImage.TYPE_USHORT_565_RGB);
	    BufferedImage dimg = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);
	    Graphics2D    g2d  = dimg.createGraphics();
	    
	    g2d.drawImage(tmp, 0, 0, null);
	    g2d.dispose();
	    
	    return dimg;
	}
	
	public static BufferedImage resizeBoxImg( BufferedImage urlimg ) {
		
		BufferedImage smallimg = null;
		
		// 3.need to be resize. 280 is the square size.
		if( (urlimg.getHeight()>280)||(urlimg.getWidth()>280) ) {
			
			System.out.println( "Resizing img... " );
			
			/**resize small block**/
			if( urlimg.getHeight() < urlimg.getWidth() ) {
				double  multi     = (double)  urlimg.getWidth ()/ 280;
				int     newHeight = (int   ) (urlimg.getHeight()/multi);
				
				System.out.println( "Width    longer : " + Double.toString(multi) );
				System.out.println( "handling width  : " + 280                    );
				System.out.println( "handling height : " + newHeight + "\n"       );
				
				        smallimg  = resize( urlimg , 280      , newHeight );
				
			} else /*if ( urlImage.getHeight() > urlImage.getWidth() )*/ {
				double  multi     = (double)  urlimg.getHeight()/ 280;
				int     newWidth  = (int   ) (urlimg.getWidth ()/multi);
				
				System.out.println( "Height   longer : " + Double.toString(multi) );
				System.out.println( "handling width  : " + newWidth               );
				System.out.println( "handling height : " + 280      + "\n"        );
				
				        smallimg  = resize( urlimg , newWidth , 280       );
			}
			
		} else {
			smallimg = urlimg;
		}
		return smallimg;
	}
	
	
	public static BufferedImage resizeBoxImg160( BufferedImage urlimg ) {
		
		BufferedImage smallimg = null;
		// 3.need to be resize. 160 is the square size.
		if( (urlimg.getHeight()>160)||(urlimg.getWidth()>160) ) {
			
			System.out.println( "Resizing img... " );
			
			/**resize small block**/
			if( urlimg.getHeight() < urlimg.getWidth() ) {
				double  multi     = (double)  urlimg.getWidth ()/ 160;
				int     newHeight = (int   ) (urlimg.getHeight()/multi);
				
				System.out.println( "Width    longer : " + Double.toString(multi) );
				System.out.println( "handling width  : " + 160                    );
				System.out.println( "handling height : " + newHeight + "\n"       );
				
				        smallimg  = resize( urlimg , 160      , newHeight );
				
			} else /*if ( urlImage.getHeight() > urlImage.getWidth() )*/ {
				double  multi     = (double)  urlimg.getHeight()/ 160;
				int     newWidth  = (int   ) (urlimg.getWidth ()/multi);
				
				System.out.println( "Height   longer : " + Double.toString(multi) );
				System.out.println( "handling width  : " + newWidth               );
				System.out.println( "handling height : " + 160      + "\n"        );
				
				        smallimg  = resize( urlimg , newWidth , 160       );
			}
			
		} else {
			smallimg = urlimg;
		}
		return smallimg;
	}
	
	
	@RequestMapping(value="/boxImgPath0/{value}",method=RequestMethod.GET)
	public void boxImgPath0(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		BoxImgBuffer BoxImg = null;
		if(session.getAttribute("boximgsmall0")!=null)
			         BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmall0");
		else
					 BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmalldefault");
		
		FileCopyUtils.copy( BoxImg.getBytes() ,  response.getOutputStream());
	}
	
	
	@RequestMapping(value="/boxImgPath1/{value}",method=RequestMethod.GET)
	public void boxImgPath1(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		BoxImgBuffer BoxImg = null;
		if(session.getAttribute("boximgsmall1")!=null)
			         BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmall1");
		else
					 BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmalldefault");
		
		FileCopyUtils.copy( BoxImg.getBytes() , response.getOutputStream());
	}
	
	
	@RequestMapping(value="/boxImgPath2/{value}",method=RequestMethod.GET)
	public void boxImgPath2(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		BoxImgBuffer BoxImg   =  null;
		if(session.getAttribute("boximgsmall2")!=null)
			         BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmall2");
		else
					 BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmalldefault");
		
		FileCopyUtils.copy( BoxImg.getBytes() , response.getOutputStream());
	}
	
	
	@RequestMapping(value="/boxImgPath3/{value}",method=RequestMethod.GET)
	public void boxImgPath3(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		BoxImgBuffer BoxImg = null;
		if(session.getAttribute("boximgsmall3")!=null)
			         BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmall3");
		else
					 BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmalldefault");
		
		FileCopyUtils.copy( BoxImg.getBytes() , response.getOutputStream());
	}
	
	
	@RequestMapping(value="/boxImgPath4/{value}",method=RequestMethod.GET)
	public void boxImgPath4(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		BoxImgBuffer BoxImg = null;
		if(session.getAttribute("boximgsmall4")!=null)
			         BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmall4");
		else
					 BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmalldefault");
		
		FileCopyUtils.copy( BoxImg.getBytes() , response.getOutputStream());
	}
	
	
	@RequestMapping(value="/boxImgPath5/{value}",method=RequestMethod.GET)
	public void boxImgPath5(  HttpServletResponse response ,
							  HttpSession         session  ,
					         @PathVariable        
					          String              value    ) throws IOException {
		
		BoxImgBuffer BoxImg = null;
		if(session.getAttribute("boximgsmall5")!=null)
			         BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmall5");
		else
					 BoxImg   = (BoxImgBuffer)session.getAttribute("boximgsmalldefault");
		
		FileCopyUtils.copy( BoxImg.getBytes() , response.getOutputStream());
	}
	
	
	@RequestMapping(value="/boxImgUpload0",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload0( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering Img0 uploader..."  + "\n" );
		
		Iterator<String> itr               = request.getFileNames();
		MultipartFile    mpf               = request.getFile(itr.next());
		
		BoxImgBuffer     boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer     boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream      is                = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage    urlImage          = ImageIO.read(is);
		BufferedImage    smallBoxImg       = resizeBoxImg(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos         = new ByteArrayOutputStream();
        
        String                smallImgType = mpf.getOriginalFilename();
        Integer               pointpost    = mpf.getOriginalFilename().lastIndexOf(".");
        String                typesuffix   = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
                                   baos.flush();
        boximgsmallbuffer.setBytes(baos.toByteArray());
                                   baos.close();
        
		boximgbuffer.setName (mpf.getName ());
		boximgbuffer.setBytes(mpf.getBytes());
		boximgbuffer.setOriginalFilename  (mpf.getOriginalFilename());
		boximgbuffer.setContentType(mpf.getContentType());
		
		boximgsmallbuffer.setName(mpf.getName());
		boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename());
		boximgsmallbuffer.setContentType(mpf.getContentType());
		
		session  .setAttribute("boximg0"     , boximgbuffer      );
		session  .setAttribute("boximgsmall0", boximgsmallbuffer );
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return "<img src='"+basePath+"/boxImgPath0/"+java.util.Calendar.getInstance().getTimeInMillis()+"'/>";
	}
	
	
	@RequestMapping(value="/boxImgUpload1",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload1( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering Img1 uploader..." + "\n" );
		
		Iterator<String> itr = request.getFileNames();
		MultipartFile    mpf = request.getFile(itr.next());
		
		BoxImgBuffer boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream   is          = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage urlImage    = ImageIO.read(is);
		BufferedImage smallBoxImg = resizeBoxImg(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos         = new ByteArrayOutputStream();
        
        String                smallImgType = mpf.getOriginalFilename();
        Integer               pointpost    = mpf.getOriginalFilename().lastIndexOf(".");
        String                typesuffix   = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
	        baos.flush();
	        boximgsmallbuffer.setBytes(baos.toByteArray());
	        baos.close();
	
			boximgbuffer.setName (mpf.getName ());
			boximgbuffer.setBytes(mpf.getBytes());
			boximgbuffer.setOriginalFilename  (mpf.getOriginalFilename());
			boximgbuffer.setContentType(mpf.getContentType());
			
			boximgsmallbuffer.setName(mpf.getName());
			boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename());
			boximgsmallbuffer.setContentType(mpf.getContentType());
		
		session  .setAttribute("boximg1"     , boximgbuffer      );
		session  .setAttribute("boximgsmall1", boximgsmallbuffer );
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return "<img src='"+basePath+"/boxImgPath1/"+java.util.Calendar.getInstance().getTimeInMillis()+"'/>";
	}
	
	
	@RequestMapping(value="/boxImgUpload2",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload2( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering Img2 uploader..." + "\n" );
		
		Iterator<String> itr = request.getFileNames();
		MultipartFile    mpf = request.getFile(itr.next());
		
		BoxImgBuffer boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream   is          = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage urlImage    = ImageIO.read(is);
		BufferedImage smallBoxImg = resizeBoxImg(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos         = new ByteArrayOutputStream();
        
        String                smallImgType = mpf.getOriginalFilename();
        Integer               pointpost    = mpf.getOriginalFilename().lastIndexOf(".");
        String                typesuffix   = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
	        			 baos.flush();
	        boximgsmallbuffer.setBytes(baos.toByteArray());
	        			 baos.close();
	
			boximgbuffer.setName (mpf.getName ());
			boximgbuffer.setBytes(mpf.getBytes());
			boximgbuffer.setOriginalFilename  (mpf.getOriginalFilename());
			boximgbuffer.setContentType(mpf.getContentType());
			
			boximgsmallbuffer.setName(mpf.getName());
			boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename());
			boximgsmallbuffer.setContentType(mpf.getContentType());
		
		session  .setAttribute("boximg2"     , boximgbuffer      );
		session  .setAttribute("boximgsmall2", boximgsmallbuffer );
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return "<img src='"+basePath+"/boxImgPath2/"+java.util.Calendar.getInstance().getTimeInMillis()+"'/>";
	}
	
	
	@RequestMapping(value="/boxImgUpload3",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload3( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering Img3 uploader..." + "\n" );
		
		Iterator<String> itr = request.getFileNames();
		MultipartFile    mpf = request.getFile(itr.next());
		
		BoxImgBuffer boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream   is          = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage urlImage    = ImageIO.read(is);
		BufferedImage smallBoxImg = resizeBoxImg(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos         = new ByteArrayOutputStream();
        
        String                smallImgType = mpf.getOriginalFilename();
        Integer               pointpost    = mpf.getOriginalFilename().lastIndexOf(".");
        String                typesuffix   = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
        				 baos.flush();
			boximgsmallbuffer.setBytes(baos.toByteArray());
					 	 baos.close();
			
			boximgbuffer.setName (mpf.getName ());
			boximgbuffer.setBytes(mpf.getBytes());
			boximgbuffer.setOriginalFilename  (mpf.getOriginalFilename());
			boximgbuffer.setContentType(mpf.getContentType());
			
			boximgsmallbuffer.setName(mpf.getName());
			boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename());
			boximgsmallbuffer.setContentType(mpf.getContentType());
		
		session  .setAttribute("boximg3"     , boximgbuffer      );
		session  .setAttribute("boximgsmall3", boximgsmallbuffer );
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return "<img src='"+basePath+"/boxImgPath3/"+java.util.Calendar.getInstance().getTimeInMillis()+"'/>";
	}
	
	
	@RequestMapping(value="/boxImgUpload4",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload4( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering Img4 uploader..." + "\n" );
		
		Iterator<String> itr = request.getFileNames();
		MultipartFile    mpf = request.getFile(itr.next());
		
		BoxImgBuffer boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream   is          = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage urlImage    = ImageIO.read(is);
		BufferedImage smallBoxImg = resizeBoxImg(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos         = new ByteArrayOutputStream();
        
        String                smallImgType = mpf.getOriginalFilename();
        Integer               pointpost    = mpf.getOriginalFilename().lastIndexOf(".");
        String                typesuffix   = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
        				 baos.flush();
			boximgsmallbuffer.setBytes(baos.toByteArray());
						 baos.close();
			
			boximgbuffer.setName (mpf.getName ());
			boximgbuffer.setBytes(mpf.getBytes());
			boximgbuffer.setOriginalFilename  (mpf.getOriginalFilename());
			boximgbuffer.setContentType(mpf.getContentType());
			
			boximgsmallbuffer.setName(mpf.getName());
			boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename());
			boximgsmallbuffer.setContentType(mpf.getContentType());
		
		session  .setAttribute("boximg4"     , boximgbuffer      );
		session  .setAttribute("boximgsmall4", boximgsmallbuffer );
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return "<img src='"+basePath+"/boxImgPath4/"+java.util.Calendar.getInstance().getTimeInMillis()+"'/>";
	}
	
	
	@RequestMapping(value="/boxImgUpload5",method=RequestMethod.POST)
	public @ResponseBody String boxImgUpload5( MultipartHttpServletRequest request  , 
			                                   HttpServletResponse         response ,
			                                   HttpSession                 session  ) throws IOException {
		
		System.out.println( "Entering Img5 uploader..." + "\n" );
		
		Iterator<String> itr = request.getFileNames();
		MultipartFile    mpf = request.getFile(itr.next());
		
		BoxImgBuffer boximgbuffer      = new BoxImgBuffer();
		BoxImgBuffer boximgsmallbuffer = new BoxImgBuffer();
		
        //URL           urlInput = new URL(basePath+"/img/test/userCenter/productCenter/280_280.jpg");
        InputStream   is          = new ByteArrayInputStream(mpf.getBytes());
		BufferedImage urlImage    = ImageIO.read(is);
		BufferedImage smallBoxImg = resizeBoxImg(urlImage);
		
		// 3.need to be resize. 280 is the square size.
        ByteArrayOutputStream baos         = new ByteArrayOutputStream();
        
        String                smallImgType = mpf.getOriginalFilename();
        Integer               pointpost    = mpf.getOriginalFilename().lastIndexOf(".");
        String                typesuffix   = (String) smallImgType.subSequence(pointpost+1, smallImgType.length());
        
        ImageIO.write( smallBoxImg , typesuffix , baos );
        
        				 baos.flush();
			boximgsmallbuffer.setBytes(baos.toByteArray());
					     baos.close();
			
			boximgbuffer.setName (mpf.getName ());
			boximgbuffer.setBytes(mpf.getBytes());
			boximgbuffer.setOriginalFilename  (mpf.getOriginalFilename());
			boximgbuffer.setContentType(mpf.getContentType());
			
			boximgsmallbuffer.setName(mpf.getName());
			boximgsmallbuffer.setOriginalFilename("small" + mpf.getOriginalFilename());
			boximgsmallbuffer.setContentType(mpf.getContentType());
		
		session  .setAttribute("boximg5"     , boximgbuffer      );
		session  .setAttribute("boximgsmall5", boximgsmallbuffer );
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return "<img src='"+basePath+"/boxImgPath5/"+java.util.Calendar.getInstance().getTimeInMillis()+"'/>";
	}
	
	
	
}


