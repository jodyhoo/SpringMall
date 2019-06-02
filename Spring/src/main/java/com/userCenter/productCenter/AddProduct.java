package com.userCenter.productCenter;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bean.BoxImg;
import com.bean.Product;
import com.bean.ProductDetail;
import com.bean.User;
import com.bean.Product.CATEGORY;
import com.buffer.imgbuffer.BoxImgBuffer;
import com.dao.imgDao.BoxImgDao;
import com.dao.productDao.ProductDao;
import com.dao.productDetailDao.ProductDetailDao;
import com.dao.userDao.UserDao;
import com.dao.uuid.UuidUtils;

@Controller
public class AddProduct {
	
	String         basePath = null;
	
	@Autowired
	@Qualifier("productValidator")
	private Validator validator;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {}
	
	@RequestMapping( value="/userCenter/addProductTest" , method=RequestMethod.GET )
	public ModelAndView addProductTest( HttpServletRequest   request  , 
							            HttpSession          session  ,
							            ModelAndView         mav      ) throws IOException {
		
		return new ModelAndView( "/userCenter/productCenter/addProductTest" );
		
	}
	
	@RequestMapping( value="/userCenter/addProduct" , method=RequestMethod.GET )
	public ModelAndView adduser( HttpServletRequest   request  , 
			                     HttpSession          session  ,
			                     Model                model    ) throws IOException {
		
		
		/**************** identify user ****************/ 		
		Boolean 			    nameident =  new Boolean(false);
		Enumeration<String> attrnames     =  session.getAttributeNames();
		String              username      =  new String("");
		
		
		while(  attrnames.hasMoreElements() ) {
			String  name              = (String)attrnames.nextElement();
			if(     name.equals("username")&&
				   ( !session.getAttribute(name).equals( null ))&&
				   ( !session.getAttribute(name).equals("") )   ) {
				    nameident         =  true;
				username = (String)session.getAttribute("username");
			}
		}
		if( nameident == false) 
			return new ModelAndView( "admin/logindefault" );			
		/*************************************************/ 		
		
		
		
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		
		// 1.load file from URL.
        URL                   urlInput     = new URL(basePath+"/img/default/userCenter/productCenter/280_280.jpg");
        BufferedImage         urlImage     = ImageIO.read(urlInput);
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
        ImageIO.write( urlImage, "jpg", baos );
                                        baos.flush();
                                        baos.close();
                                        
        BoxImgBuffer          boximgbuffer = new BoxImgBuffer();
							  boximgbuffer.setBytes(baos.toByteArray());
							  boximgbuffer.setName(".jpg");
			
	        session.setAttribute("boximgsmalldefault", boximgbuffer);
	        
	        		addProductConfig(model);
        
		System.out.println( "--------After setting Default BoxImg Attribute--------" + "\n" );
		
		return new ModelAndView( "/userCenter/productCenter/addProduct","command",new Product());
		
	}
	
	
	public void addProductConfig( Model       model ) {
        
		// 2.prepare  CategoryList.
        
        List<String>  categoryList = new ArrayList();
				      
				      categoryList.add(CATEGORY.三C数码 .toString());
				      categoryList.add(CATEGORY.女装   .toString());
				      categoryList.add(CATEGORY.家电   .toString());
				      categoryList.add(CATEGORY.男装   .toString());
				      categoryList.add(CATEGORY.童装   .toString());
				      
				      model.addAttribute( "categoryList" , categoryList );
				      
	}
	
	
	@ModelAttribute("product")
	public Product createUserLogModel() {
		return new Product();
	}
	
	public static int insertBoxImg(String username , Product product) {
		return 0;
	}
	
	public static void cleanimgbuffer(HttpSession session) {
		session.removeAttribute("");
	}
	
	@RequestMapping(value="/userCenter/addProduct",method=RequestMethod.POST)
	public String validator( @ModelAttribute( "product" )
						     @Validated      
						      Product          product ,
						      BindingResult    binder  ,
						      Model            model   ,
						      HttpSession      session ) throws IOException, InterruptedException {
		
							 addProductConfig(model);
		
	    // 这行解决中文乱码
	    String       productname     = new String(product.getProductname().getBytes("ISO-8859-1"),"utf-8");
		         	 product.setProductname(productname);
		         	 
		String       productcategory = new String(product.getCategory().getBytes("ISO-8859-1"),"utf-8");
		         	 product.setCategory(productcategory);
		
		boolean ValidateResult = true;
		
		//StringUtils.isEmptyOrWhitespaceOnly(arg0)
		
		// 0.error user enter.
		
	      if ( binder.hasErrors() ) {
				return "/userCenter/productCenter/addProduct";
		  } else {
			  
			  System.out.println( "Pass username Validation...." );
			  
			  model.addAttribute( "productname", productname );
			  
			  // 1.productname length exceed
			  if (  ( product.getProductname().length() >= 60 )||(   product.getProductname().length() == 0   ) ) {
					  System.out.println( "Name" + product.getProductname() );
					  System.out.println( "Name  length exceed." );
					  model.addAttribute( "nameValidator" ,  "产品名称必须大于1，少于60个字符."   );
					  ValidateResult = false;
			  }
			  
			  
			  System.out.println( "product price --" + product.getPrice() + "--" );
			  // 2.price is not integer
			  if(product.getPrice().contains(".")) {
				  
				  System.out.println( "---------------- price decimal dot more than one. ------------------" );
				  
				  String[] price = product.getPrice().split("\\.");
				  
				  System.out.println( "price.length -- " + price.length );
				  
				  // 2.1. price dot more than one.
				  if(price.length>2) {
					  System.out.println( "price" + product.getPrice   ()             );
					  System.out.println( "Price dots more than one. "                );
					  model.addAttribute( "priceValidator" ,  "产品价格小数点必须为1个或没有"   );
					  ValidateResult = false;
				  }
				  
				  if(price.length==2) {
					  if (!StringUtils.isNumeric(price[0])||!StringUtils.isNumeric(price[1])  ) {
						  System.out.println( "price" + product.getPrice   () );
						  System.out.println( "Price is not Integer " );
						  model.addAttribute( "priceValidator" ,  "产品价格必须为数字"   );
						  ValidateResult = false;
					  } else if ( price[0].length() > 10 ) {
						  System.out.println( "price" + product.getPrice   () );
						  System.out.println( "Price Integer bit must greater than 10. " );
						  model.addAttribute( "priceValidator" ,  "产品价格整数位必须小于等于10位"   );
						  ValidateResult = false;
					  }	else if ( price[1].length() > 2  ) {
						  System.out.println( "price" + product.getPrice   () );
						  System.out.println( "Price decimal bit must less than 2. " );
						  model.addAttribute( "priceValidator" ,  "产品价格小数位必须小于等于2位"   );
						  ValidateResult = false;
					  }
				  }
				  
				  
			  } else {
				  if (!StringUtils.isNumeric(product.getPrice   ())) {
					  System.out.println( "price" + product.getPrice   () );
					  System.out.println( "Price is not Integer " );
					  model.addAttribute( "priceValidator" ,  "产品价格必须为数字"   );
					  ValidateResult = false;
				  } else if (product.getPrice().length()>=10) {
					  System.out.println( "Price length exceed." );
					  model.addAttribute( "priceValidator" ,  "产品价格(包含小数)必须少于12位"   );
					  ValidateResult = false;
				  }
			  }
			  
			  
			  // 3.quantity is not integer
			  if (!StringUtils.isNumeric(product.getQuantity())  ) {
				  System.out.println( "quantity" + product.getQuantity() );
			      System.out.println( "Quantity is not Integer.");
				  model.addAttribute( "quantityValidator" ,  "产品数量必须为数字"   );
				  ValidateResult = false;
			  } else if (product.getQuantity().length()>=10) {
				  System.out.println( "Quantity length exceed." );
				  model.addAttribute( "priceValidator"    ,  "产品数量必须少于10位"   );
				  ValidateResult = false;
			  }
			  
			  
			  // 5.if category is not valid.
			  if( product.getCategory().equals("") ) {
				  model.addAttribute( "categoryValidator" ,  "请选择品类"   );
				  ValidateResult = false;
			  }
			  
			  
			  // 5.if data to be entered is invalid.
			  if (!ValidateResult) {
			       
				   return "/userCenter/productCenter/addProduct";
				   
			  } else {
			   		
			   		
					String      username    = (String)session.getAttribute("username"); 
						        product.setUsername(username);
								
					    		model.addAttribute( "username" ,  username   );
					    		model.addAttribute(  "title"   , "添加产品成功!" );
		    		
					    		
		    		BoxImgDao.init();
		    		
		    		// 将tomcat 的版本号去掉
		    		// 文件夹名称改为tomcat
		    		String        rootPath 			  = new String("c:/tomcat/webapps/Spring/WEB-INF");
		    		
		    		
		    		// query uuid and convert into byte[16]
		    		byte[]  	  uuidbytes    		  = null;
		    		UUID          uuid          	  = null;
		    		
		    		
	    			BoxImgBuffer  BoxImgBuffer        = null;
	    			BoxImgBuffer  BoxImgSmallBuffer   = null;
	    			
	    			
					String        imgPath       	  = null;		
					String        imgsmallPath  	  = null;	
					
					
					BoxImg        boximg        	  = null;
					
					
					
					
					
					/**************** store style init ****************/
					ProductDetail productDetail       = new ProductDetail();
					
		    		
		    		Map<String,String>          stylename 	  =        ( Map<String,String>       )session.getAttribute( "stylename"     );
					Map<String,BoxImgBuffer>    styleimg  	  =        ( Map<String,BoxImgBuffer> )session.getAttribute( "styleimg"      );		
					Map<String,BoxImgBuffer>    styleimgsmall =        ( Map<String,BoxImgBuffer> )session.getAttribute( "styleimgsmall" );			    		
					
					ProductDetailDao.init(); 
					
					
					
					
					
					/**************** pick first img ****************/
					/*
					Integer       first_insertimg            = 0;  
					
			        for( int n = 0 ; (n < 6)&&(imgsmallPath==null) ; n++ ) 
			        	if(session.getAttribute("boximg"+n)!=null) 
			        		first_insertimg = n;
			        
			        System.out.println( "\n" + "****************First NON-Empty BoxImg is -- " + first_insertimg + " -- ****************" + "\n" );
					 */
			        
			        
			        
					
					/******************************** BoxImg ********************************/
		    		for ( int i =  0  ;  i < 6  ;  i++  ) {
			    		
			    		/******************************** UUID Generate ********************************/
						// 1.generate new product id by random and insert into row.
						if (  i == 0  ) {
							
						           uuid             = UUID.randomUUID(); 
						    	   uuidbytes        = UuidUtils.asBytes(uuid); 
						    	   
						    System.out.println( "\n" + "********************************UUID Generating********************************" + "\n" );
						    System.out.println( "3.2.Generate new uuid -- " + uuid.toString() ); 
						    
						    
					        String productPage = (String)session.getAttribute("productPageURL"); 
					        if(    productPage==  null) 
					        	   productPage =  "";   
					        
					        System.out.println( "4.1.Generate new productPage Folder And File ..." );
					        System.out.println( "4.2.Generating productPage Folder..." );	
					        
						    File   folder      =  new    File("c:/tomcat/webapps/Spring/WEB-INF/data/productPage/"+username+"/"+uuid.toString());
						    if(!   folder.exists()) 
							       folder.mkdirs(); 
						    
						    System.out.println( "4.3.Generating productPage File..." );	
						    File   file        =  new    File("c:/tomcat/webapps/Spring/WEB-INF/data/productPage/"+username+"/"+uuid.toString()+"/"+"productPage.dat");
						    
						    
						    if(   !file.exists()) 
							       file.createNewFile(); 
						    else { file.delete(); 
							       file.createNewFile(); 
						    } 
						    
						    
						    System.out.println( "5.1.Storing productPage File..." ); 
						    FileOutputStream productPageFous = new FileOutputStream(file); 
						    
						    System.out.println( "5.1.Finish Storing productPage File..." ); 
						    
						    System.out.println( "5.2.productPage File Size -- " + productPage.getBytes().length );	
		   					
						    productPageFous.write(productPage.getBytes()); 
		   					productPageFous.close(); 
						   	
						    System.out.println( "Setting ProductID ..." ); 
						    
						    product.setProductid(uuidbytes); 
					        product.setProductpage( "/data/productPage/"+username+"/"+uuid.toString()+"/"+"productPage.dat");
					        
					        
					        // find first insert img
					        for( int n = 0 ; (n < 6)&&(imgsmallPath==null) ; n++ ) {
					        	if(session.getAttribute("boximgsmall"+n)!=null)
					        		imgsmallPath = "/img/users/" + username + "/product/" + uuid + "/" + n + ((BoxImgBuffer)session.getAttribute("boximgsmall"+n)).getOriginalFilename().replace(" ", "_");   
					        }
					        
					        
					        product.setFirstboximg(  imgsmallPath  ); 
					        
					        
					        System.out.println( "Initing ProductDao ..." ); 
					        ProductDao.init(); 
					        
					        System.out.println( "--------Category--------"         + product.getCategory() + "----------------" );
							
				    		System.out.println( "ProductDao rows to be insert -- " + ProductDao.insertAll(product) + "\n" );
				    		
				    		
						}
						
						
		    			System.out.println( "------------------------Row Insert "+i+" Begin------------------------" );
		    			
		    			if(session.getAttribute("boximg"+i)!=null) {
		    				
		    				
			    			// 1.get boximg from session.
				    		System.out.println( "----BOX IMG "+i+" is not NULL----" );
			    			System.out.println( "1.get boximg from session." );
			    			BoxImgBuffer           = (BoxImgBuffer)session.getAttribute("boximg"     +i);
				    		BoxImgSmallBuffer      = (BoxImgBuffer)session.getAttribute("boximgsmall"+i);
				    		
				    		
				    		// 3.create file.
				    		String        date     = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
				    		String        time     = new SimpleDateFormat( "HHmmss" ).format(Calendar.getInstance().getTime());
			    			
				    		// 2.record into local ---- if boximg is not empty.
				    		
				    		
				    		// 3.create current date and time folder.
							File         userfolder       = new File  (rootPath + "/img/users/" + username + "/product/" + uuid  );
							
							if (        !userfolder.exists() ) 
										 userfolder.mkdirs(); 
							
							
							// 4.create file.
							System.out.println( "3.1.Creating File..." );
							
							// 5.dependency test.
							String       NewBoxImgOriginalFileName      = BoxImgBuffer.getOriginalFilename().replace(" ", "_");   
							String       NewBoxImgSmallOriginalFileName = BoxImgSmallBuffer.getOriginalFilename().replace(" ", "_");             
							
							File         userimgfile      = new File  (rootPath + "/img/users/" + username + "/product/" + uuid + "/" + i + NewBoxImgOriginalFileName      );
								  if(    userimgfile.exists        () ) 
						            	 userimgfile.delete        ();
						                 userimgfile.createNewFile ();
									     
							File         userimgsmallfile = new File  (rootPath + "/img/users/" + username + "/product/" + uuid + "/" + i + NewBoxImgSmallOriginalFileName );
								  if(    userimgsmallfile.exists        () ) 
									     userimgsmallfile.delete        ();
						                 userimgsmallfile.createNewFile ();
							
						    
							FileOutputStream      fous = new FileOutputStream(userimgfile); 
							                      fous.write(BoxImgBuffer.getBytes()); 
							                      fous.close(); 
							
							
							FileOutputStream fsmallous = new FileOutputStream(userimgsmallfile); 
											 fsmallous.write(BoxImgSmallBuffer.getBytes()); 
											 fsmallous.close(); 
					    	
											 
											  imgPath      = new String( "/img/users/" + username + "/product/" + uuid + "/" + i + NewBoxImgOriginalFileName      ); 
											  imgsmallPath = new String( "/img/users/" + username + "/product/" + uuid + "/" + i + NewBoxImgSmallOriginalFileName ); 
							
							
				    		System.out.println( "productID byte to be insert -- " + uuidbytes.length );
				    		/** IMG Insert part. **/
				    		
				    		System.out.println( "inserting BoxImg ... " );
				    		       boximg = new BoxImg( uuidbytes , String.valueOf(i) , imgPath , imgsmallPath );
				    		
				    		System.out.println( "BoxImg rows to be inserted -- " + BoxImgDao.insertRow(boximg) + "\n" );
				    		
				    		
				    		/**** default style ****/
				    		if(  (i==0)&&(stylename==null)  ) {
				    										  productDetail.setProductid( uuidbytes ); 		
				    										  productDetail.setName( product.getProductname().split(" ")[0] ); 		
															  productDetail.setBoximg(      imgPath      ); 
														      productDetail.setBoximgsmall( imgsmallPath ); 
															  productDetail.setCode( String.valueOf(0)   );
								ProductDetailDao.insertdetail(productDetail); 			
				    		}	
				    		
				    		
			    		} else {
			    			
			    			System.out.println( "----BoxImg "+i+"is NULL..." );
			    			
							imgPath      = new String( "/img/default/userCenter/productCenter/280_280.jpg" ); 
							imgsmallPath = new String( "/img/default/userCenter/productCenter/800_800.jpg" ); 
							
						    System.out.println( "productID byte to be insert -- " + uuidbytes.length );
						  	/** IMG Insert part. **/
						  		
						  	System.out.println( "inserting BoxImg ... " );
						  		       boximg = new BoxImg( uuidbytes , String.valueOf(i) , imgPath , imgsmallPath );
						  		
						  	System.out.println( "BoxImg rows to be inserted -- " + BoxImgDao.insertRow(boximg) + "\n" );			    			
			    			
			    		}
		    			
			    		
		    			
		    			
			    		// remove pic from boximg.
			    		session.removeAttribute("boximg"     +String.valueOf(i));
			    		session.removeAttribute("boximgsmall"+String.valueOf(i));
						
			    		
			    		
						
		    		}
		    		
		    		
		    		System.out.println( "\n" + "**************** store style ****************" + "\n" );
		    		
		    		
					/**************** store style ****************/		    		
								  	   productDetail.setProductid( uuidbytes ); 			
					
					for( int s = 0 ;  (stylename!=null)&&(s < stylename.size()) ; s++ ) { 
						
						
						// 1.set name 
						String        style        		  =  stylename.get(  "style" + s );
									  productDetail.setName        (   style      ); 
						
						
						// 2.init img 
								 	  BoxImgBuffer        =  styleimg.get(      "styleimg"        + s );
									  BoxImgSmallBuffer   =  styleimgsmall.get( "styleimgsmall"   + s );
						
						
						File         stylefolder   =  new   File( rootPath + "/img/users/" + username + "/product/" + uuid + "/style" );
						
						
						if  (       !stylefolder.exists()  ) 
							         stylefolder.mkdirs();   
						else{ File[]     roots     =  stylefolder.listRoots();
							     for(int d         =  0 ; d < roots.length ; d++ )
								         roots[d].delete();
						}
						
						
						// 4.create file.
						System.out.println( "3.1.Creating File..." );
						
						
						// 5.dependency test.
						String       NewBoxImgOriginalFileName      = BoxImgBuffer.getOriginalFilename().replace(" ", "_");   
						String       NewBoxImgSmallOriginalFileName = BoxImgSmallBuffer.getOriginalFilename().replace(" ", "_");             
						
						
						System.out.println( "3.1.1.1.finish Creating File name..."      );
						
						
						File           userimgfile      = new File  (rootPath+"/img/users/"+username+"/product/"+uuid+"/style/"+s+NewBoxImgOriginalFileName      );
							  if(      userimgfile.exists()      ) 
					            	   userimgfile.delete();
					                   userimgfile.createNewFile();
						
					    
					    System.out.println( "3.1.1.  finish Creating File img..."      );
					    
					    
						File           userimgsmallfile = new File  (rootPath+"/img/users/"+username+"/product/"+uuid+"/style/"+s+NewBoxImgSmallOriginalFileName );
							  if(      userimgsmallfile.exists()      ) 
								       userimgsmallfile.delete();
					                   userimgsmallfile.createNewFile();
					    
					    
					    System.out.println( "3.1.2.  finish Creating File imgsmall..." );
					    
					    
						FileOutputStream      fous      = new FileOutputStream(userimgfile);
						                      fous.write(BoxImgBuffer.getBytes());
						                      fous.close();						                      
						System.out.println( "3.1.1.finish FileOutputStream img..." );                 
						
						
						FileOutputStream fsmallous = new FileOutputStream(userimgsmallfile);
										 fsmallous.write(BoxImgSmallBuffer.getBytes());
										 fsmallous.close();
						System.out.println( "3.1.1.finish FileOutputStream imgsmall..." );    
						
						
						System.out.println( "----BOX IMG Name "+s+" is not NULL----" );
						
										  imgPath      = new String("/img/users/"+username+"/product/"+uuid+"/style/"+s+NewBoxImgOriginalFileName ); 		
										  imgsmallPath = new String("/img/users/"+username+"/product/"+uuid+"/style/"+s+NewBoxImgSmallOriginalFileName );
					    
													 productDetail.setBoximg(      imgPath      ); 
												     productDetail.setBoximgsmall( imgsmallPath ); 
												     productDetail.setCode( String.valueOf(s)   );	
						
						ProductDetailDao.insertdetail(productDetail); 
					    
					}
		    		Thread.sleep(500);
		    		
		    		
		    		
		    		
		    		/****************^^store img part.^^****************/ 
		    		Thread.sleep(500);	
		    		
		    		
		    		
		    		
		    		/****************^^remove session part.^^****************/ 
		    		session.removeAttribute( "productPageURL"     );
		    		session.removeAttribute( "boximgsmalldefault" );
		    		
		    		session.removeAttribute( "styleimg"           );
		    		session.removeAttribute( "styleimgsmall"      );
					session.removeAttribute( "stylerow"           );
					session.removeAttribute( "stylename"          );
		    		
					
					
					
		    		System.out.println( "Pass all Valiations..." + "\n" );
		    		return "/userCenter/productCenter/success" ;
		    		
			    		
			    	
		    		
			    } 
			   	
			  	
		  }
	      
	      
	 }
	 
	
}


