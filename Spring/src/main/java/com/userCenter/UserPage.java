package com.userCenter;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.bean.BoxImg;
import com.bean.Product;
import com.buffer.imgbuffer.BoxImgBuffer;
import com.buffer.imgbuffer.BoxImgBuffer.LONGEREDGE;
import com.dao.imgDao.*;
import com.dao.productDao.*;
import com.dao.uuid.UuidUtils;
import com.userCenter.productCenter.ProductPage;

@Controller
public class UserPage { 
	
	@RequestMapping(value={"/userCenter/userPage"},method=RequestMethod.GET) 
	public ModelAndView userpage( ModelAndView       mav     , 
								  HttpSession        session ,
								  HttpServletRequest request ) throws SQLException, IOException { 
		
		System.out.println( "Entering userPage..." );
		
		//String        username                 = (String)session.getAttribute("username");
		
		Boolean 			    nameident =  new Boolean(false);
		Enumeration<String> attrnames     =  session.getAttributeNames();
		String              username      =  new String("");
		
		
		while(  attrnames.hasMoreElements() ) {
			String  name              = (String)attrnames.nextElement();
			if(     name.equals("username")&&
				   (!session.getAttribute(name).equals(null))&&
				   (!session.getAttribute(name).equals("null"))&&
				   ( !session.getAttribute(name).equals("") )   ) {
				    nameident         =  true;
				username = (String)session.getAttribute("username");
			}
		}
		if( nameident == false) 
			return new ModelAndView( "admin/logindefault" );				
		
		
		
		
		/*  ---------------- resize img to 200 px ---------------- */
		// 2.query boximg from DB.
		BoxImgDao.init(); 
		String    basePath  =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		
		
		/*********************************0.take filename List from DB.*********************************/
		List<BoxImg>  userPageFirstboximgList         = (List<BoxImg>)BoxImgDao.queryFirstBoxImgByUsername(username);
		Iterator      firstboximgList                 =  userPageFirstboximgList.iterator();
		
		List<String>  userPageFirstboximgsmall220List =  new ArrayList();
		
		while(firstboximgList.hasNext()) {
			
			BoxImg BoxImg = (BoxImg)firstboximgList.next();
			String boximg =  BoxImg.getBoximg();
			
			System.out.println( " firstboximg  " + BoxImg.getBoximg() );
			
			String                rootPath       = new String("c:/tomcat/webapps/Spring/WEB-INF");
			String                boximg220      = null;
			
			
			// 2.2.restore boximg220 part.
			if(  (boximg!=null)&&(new File(rootPath+boximg).exists())  ) {
			
				
		        /*********************************1.change filename.*********************************/
		        Integer               slashpost    =  boximg.lastIndexOf("/0");
		        String                suffixPath   =  boximg.substring  (  0 , slashpost+"/0".length() );
		        String                prefixPath   =  boximg.substring  (      slashpost+"/0".length() , boximg.length() );
		        
		                              boximg220    = (suffixPath.concat("small220")).concat(prefixPath);
		        
		        System.out.println( "userPage maniputlating  ..."             );
		        System.out.println( "BoxImgsmall220          -- " + boximg220 );
				
		        
		        
		        /*********************************2.establish file part.**********************************/
		        // 2.convert into local Path and record to file.
		        Integer                pointpost           =  boximg.lastIndexOf(".");
		        String                 typesuffix          = (String) boximg.subSequence( pointpost+1 , boximg.length() );
		        
				
		        // 3.create boximg220 file.
		        String                 folderPath          =  boximg.substring  (  0 , boximg.lastIndexOf("/0") );
		        File                   userimgsmallFolder  =  new File  (rootPath+folderPath);
		        				if(   !userimgsmallFolder.exists() )
		        					   userimgsmallFolder.mkdirs();
		        
		        File         		   userimgsmall220file =  new File  (rootPath+boximg220 );
					            if(    userimgsmall220file.exists        () ) 
					            	   userimgsmall220file.delete();
					                   userimgsmall220file.createNewFile ();
				
				
				/*********************************3.record new small img into file part.*********************************/
				// 4.1.prepare to be output.
		        ByteArrayOutputStream  baos                =  new ByteArrayOutputStream();
						        
				// 4.2.convert boximg Path into BoxImgBuffer.
				BoxImgBuffer           boximgbuffer        =  new BoxImgBuffer();
				
				// 5.convert URL into BufferedImage.
				
				URL                    urlInput            =  new URL(basePath+boximg);
				BufferedImage          urlImage            =  ImageIO.read(urlInput.openStream());
				BufferedImage          newImage            =  ProductPage.resizeBoxImg220  (urlImage);
				
		        // 6.convert BufferedImage into outputstream.
		        ImageIO.write( newImage , typesuffix , baos );
		        
		 		FileOutputStream     fsmallous = new FileOutputStream(userimgsmall220file);
									 fsmallous.write(baos.toByteArray()); 
									 fsmallous.close(); 
				
				/*********************************4.record path into database and session List.**********************************/
				// 6.record path into database.
				BoxImgDao.updateBoxImgSmall220ByID( boximg220 , BoxImg.getProductid() , 0 );
				
			}
			
			// 7.record into session List.
			userPageFirstboximgsmall220List.add(boximg220);
			
		}
		
		
		// 1.product information part...		
		List<String>     userPageproductidList           =  new ArrayList();
		List<String>     userPageProductnameList         =  new ArrayList();
		List<String>     userPageProductpriceList        =  new ArrayList();
		
		// 2.get List from DB DAO part.
		ProductDao.init();
		List<Product>    userPageProductList             =  ProductDao.queryProductByUserTASC(username);
		
		UUID             productiduuid                =  null;
		Iterator         productListiter              =  userPageProductList.iterator();
		
		while(productListiter.hasNext()) {
			
			// 1.iterate product table result.
			Product   product      = (Product)productListiter.next();
			
			// 1.identify longer edge.
			//BoxImgBuffer  boximgbuffer      = new BoxImgBuffer();
			
			System.out.println( "BoxImgBuffer converting img..." );
			String        longeredge        = null;
			
		    productiduuid      =  UuidUtils.asUuid(product.getProductid());
		    
		    userPageproductidList       .add(  productiduuid.toString() );
		    userPageProductnameList     .add(  product.getProductname() );
		    userPageProductpriceList    .add(  product.getPrice      () );
		    
		}
		
		    session.setAttribute( "userPageFirstboximgsmall220List" , userPageFirstboximgsmall220List    );
            session.setAttribute( "userPageProductnameList"         , userPageProductnameList         ); 		
            session.setAttribute( "userPageProductpriceList"        , userPageProductpriceList        ); 	
            session.setAttribute( "userPageproductidList"           , userPageproductidList           ); 
               
            System.out.println( "userPage Storing session finish..." + "\n" );
            
            
               mav.setViewName("/userCenter/userPage");
		return mav;
		
	}
	
	
	
	public static void main(String[] args) throws IOException {
		
		// 1.Load  username from session
		String        username                     = "user";
		
		// 2.query boximg   from DB
		BoxImgDao.init(); 
		List<String>  userPageFirstboximgsmallList = (List<String>)BoxImgDao.queryFirstBoxImgsmallByUsername(username);
		
		// 3.query product from DB by username.
		ProductDao.init();
		List<Product> userPageProductList          =  ProductDao.queryProductByUserTASC(username);
		
		List<String>  userPageproductidList        =  new ArrayList();
		List<String>  userPageProductnameList      =  new ArrayList();
		List<String>  userPageProductpriceList     =  new ArrayList();
		
		UUID          productiduuid                =  null;
		
		Iterator      productListiter              =  userPageProductList.iterator();
		
		System.out.println( " Inner Test... " );
				
		for( int i = 0 ; productListiter.hasNext() ; i++ ) {
			
			Product   product             = (Product)productListiter.next();
			
					  productiduuid       =  UuidUtils.asUuid(product.getProductid());
					  userPageproductidList   .add(  productiduuid.toString() );
			  
					  userPageProductnameList .add(  product.getProductname() );
					  userPageProductpriceList.add(  product.getPrice      () );
					  
					  System.out.println( " row : " + i + " -- " + productiduuid.toString() + " -- " 
												                 + product.getProductname() + " -- "  
												                 + product.getPrice      ()  );
					  
		}
		
	}
	
}












