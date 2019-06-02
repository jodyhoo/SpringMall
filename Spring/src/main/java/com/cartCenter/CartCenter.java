package com.cartCenter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Cart;
import com.bean.Product;
import com.buffer.imgbuffer.BoxImgBuffer.LONGEREDGE;
import com.dao.cartDao.CartDao;
import com.dao.productDao.ProductDao;
import com.dao.uuid.UuidUtils;
import com.userCenter.productCenter.ProductPage;

@Controller
public class CartCenter {
	
	@RequestMapping(value={"/cart"},method=RequestMethod.GET)
	public ModelAndView cartPage( HttpSession 		  session  ,
								  HttpServletResponse response ,
								  HttpServletRequest  request  ,
								  ModelAndView        mav      ) 
						throws    IOException                  {
		
		System.out.println( "------------------------ cartCenter ------------------------ " );
		
		
		// 1.get username 
		String   buyer   =  (String)session.getAttribute( "username" ); 
		System.out.println( "username---------------- " + buyer    ); 
		
		
		Boolean  hasname = false;
		
		//   String usertemp =  null; 
		if(  (buyer==null)||(buyer.length()==0)  ) { 
			
			System.out.println( "******************************** getcookie ********************************" );
			Cookie[] cookies   = request.getCookies(); 
			
			int i = 0;
			if(!cookies[i].getName().equals("usertemp")) 
				i++;
			else session.setAttribute( "usertemp" , cookies[i].getValue() );	
			
			buyer = cookies[i].getValue();
			
			Boolean  setcookie = false;
			
			/*
			for( int i = 0 ; i < cookies.length ; i++ ) {
				if(cookies[i].getName().equals("usertemp")) {
					setcookie = true;
					buyer = cookies[i].getValue();
					//System.out.println( "temp user have been set." );
					//System.out.println( "temp user is -- " + buyer );
				}
				//else
					//System.out.println( "temp user have not  set." );
			}
			*/
			
			/*
			if(setcookie==true) {
				session.setAttribute( "usertemp" , buyer );
				System.out.println( "cookie usertemp--------- " + buyer );
			}
			else
				System.out.println( "temp user have not set." );
			*/
			
		}
		
		
		// 1.set seller map. 
		Map<String,List<Map<String,String>>>  sellerMap   =  new HashMap<String,List<Map<String,String>>>();
		
		
															 CartDao.init();
		// 2.get product information 
		List<String>                          sellerlist  =  CartDao.selectseller(buyer);
		Iterator                              selleriter  =          sellerlist.iterator();
		
		
		ProductDao.init();
		
		
		while( selleriter.hasNext() ) { 
			
			// 1.query seller name. 
			String       seller         = (String)selleriter.next();
			
			
			// 2.select items. 
			Cart         cart           =  new Cart();
						 cart.setBuyer (  buyer );
						 cart.setSeller( seller );
			List<Cart>   selleritemlist =  CartDao.selectselleritems(cart);
			Iterator     selleritemiter =          selleritemlist.iterator();
			
			
			List<Map<String,String>> sellerList = new ArrayList<Map<String,String>>();
			
			
			// 4.items iterator.
			while(selleritemiter.hasNext()) {
				
				// 3.set sellerMap
				Map<String,String> itemMap =  new HashMap<String,String>();
				
				Cart          selleritem     = (Cart)selleritemiter.next();
				
				byte[]        productid      = (byte[])selleritem.getProductid();
				UUID          productuuid    =  UuidUtils.asUuid(productid);
				
				
				Product       product        =  ProductDao.queryProductByID(productid);
				
				
				String        firstboximg    =  product.getFirstboximg();
				String        imgLongerEdge  =  null;
				
				
				String        productname    =  product.getProductname();
				String        productprice   =  product.getPrice();
				
				
				// identify boximg longer edge. 
				String        rootPath       =  new String("c:/tomcat/webapps/Spring/WEB-INF");
				String	      basePath 		 =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
				
				
				// 2.2.restore boximg part.
				if((firstboximg!=null)&&(new File(rootPath+firstboximg).exists()) ) {
					System.out.println( "firstboximg has been recorded to List. " );
					//firstboximg  = firstboximg;
					
					// 1.identify longer edge.
					if( ProductPage.getLongEdge(basePath, firstboximg).equals(LONGEREDGE.HEIGHT) )
						imgLongerEdge = "HEIGHT";
					else 
						imgLongerEdge = "WIDTH" ;
				} else {
					
					System.out.println( "firstboximg file not exists... " );
					// set default img Path.
					firstboximg   = "/img/default/userCenter/productCenter/280_280.jpg";
					imgLongerEdge = "HEIGHT";
				}
				
				
				productprice = product.getPrice()   ;
				
				System.out.println( "productprice -- " + productprice );
				
				
				seller       = product.getUsername();
				
				
				System.out.println( "" + productprice );
				
				
				itemMap.put( "productid"     , productuuid.toString()   );
				itemMap.put( "firstboximg"   , firstboximg              );
			    itemMap.put( "imgLongerEdge" , imgLongerEdge            );
				itemMap.put( "productname"   , productname              );
				itemMap.put( "productprice"  , productprice             );
				itemMap.put( "quantity"      , selleritem.getQuantity() );
				
				sellerList.add(itemMap);
				
			}
			sellerMap.put(seller, sellerList);
		}
			session.setAttribute( "sellerMap" , sellerMap );
		
		        mav.setViewName("/cartCenter/cart");
		return  mav;
		
	}
	
	
	public static String cartquantity( String 	    username  ,
									   HttpSession  session  ) 
	       throws                      IOException          {
					       					CartDao.init();
	    String  quantity  =  String.valueOf(CartDao.selectitem(username));
	    		session.setAttribute( "cartquantity" , quantity );
	    return  quantity;
	}
	
	
	@RequestMapping( value={"/addcart"} , method=RequestMethod.POST )
	public @ResponseBody String addcart( HttpServletRequest  request  ,
										 HttpServletResponse response ,
										 HttpSession         session  ,
							             ModelAndView        mav      ) 
						 throws          IOException                  , 
						                 ServletException             {
		
		// 0.get productid
		String     productid  =  request.getParameter("productid");
		
		System.out.println( "------------------------ addcart           ------------------------ " );
		System.out.println( "productid -- " + productid + "\n" );
		
		
		// 1.get basic infor
		System.out.println( "1.get basic infor" );
		byte[]      uuidbyt   =  UuidUtils.asBytes(  UUID.fromString(productid)  );
		String      username  = (String)session.getAttribute("username");
		
		if(username.equals("")){
			//Cookie cookie  = new Cookie( "usertemp" );
		}
			
		
		//Cookie[] cookies = request.getCookies();
		
		
		
		
		
		
		
		
		
		// ********************************  tempcart ********************************
		
		if( username==null||username=="null"||username.length()==0 ) {
			
			
			System.out.println( "******************************** addcookie ********************************" );
			String cookiename = "user"+System.currentTimeMillis();
			Cookie tempuser   = new Cookie( "usertemp" , cookiename );
				   
				   response.addCookie(tempuser);
			System.out.println( "cookie usertemp--------- " + cookiename );	 
			
			
			username = cookiename;
			
			
			/*
			Map<String,List<Map<String,String>>>  sellerMapTemp  =  null;
												  sellerMapTemp  = (Map<String,List<Map<String,String>>>)session.getAttribute( "sellerMapTemp");
			
			if( sellerMapTemp == null )			  sellerMapTemp  =  new HashMap<String,List<Map<String,String>>>();
			
			
			// 3.set sellerMap
			Map<String,String> itemMap   =  new HashMap<String,String>();
			
			Product       product        =  ProductDao.queryProductByID(uuidbyt);
			
			String        firstboximg    =  product.getFirstboximg();
			String        imgLongerEdge  =  null;
			
			String        productname    =  product.getProductname();
			String        productprice   =  product.getPrice();
			
			
			
			// identify boximg longer edge. 
			String        rootPath       =  new String("c:/tomcat/webapps/Spring/WEB-INF");
			String	      basePath 		 =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
			
			
			
			// 2.2.restore boximg part.
			if((firstboximg!=null)&&(new File(rootPath+firstboximg).exists()) ) {
				System.out.println( "firstboximg has been recorded to List. " );
				//firstboximg  = firstboximg;
				
				// 1.identify longer edge.
				if( ProductPage.getLongEdge(basePath, firstboximg).equals(LONGEREDGE.HEIGHT) )
					imgLongerEdge = "HEIGHT";
				else 
					imgLongerEdge = "WIDTH" ;
			} else {
				
				System.out.println( "firstboximg file not exists... " );
				// set default img Path.
				firstboximg   = "/img/default/userCenter/productCenter/280_280.jpg";
				imgLongerEdge = "HEIGHT";
			}
			
			
			
			itemMap.put( "productid"     , productid   );
			
			itemMap.put( "firstboximg"   , firstboximg              );
		    itemMap.put( "imgLongerEdge" , imgLongerEdge            );
			itemMap.put( "productname"   , productname              );
			itemMap.put( "productprice"  , productprice             );
			//itemMap.put( "quantity"      , selleritem.getQuantity() );
			
			
			//sellerList.add(itemMap);
			
			
			session.setAttribute( "sellerMapTemp"  ,  sellerMapTemp );
			*/
			
			
			
		}
		
		// ********************************  tempcart ********************************		
		
		
		
		
		
		
		
		
		
		
		
		System.out.println( "username -- " + username );
		
		
		// 2.get record of cart.
		System.out.println( "2.get record of cart." );
		Cart         cart      =  new  Cart();
				     cart.setProductid( uuidbyt  );
				     cart.setBuyer    ( username );
				     cart.setSeller   ( ProductDao.queryProductByID(uuidbyt).getUsername() );
				     
				     
				     
				    			 CartDao.init();
		List<Cart>   cartlist  = CartDao.selectid(cart);
		
		
		
		System.out.println( "" + cartlist.size() );
		
		
		
		// 3.
		if( cartlist.size() == 0     ) {
		    System.out.println( "3.1.product size -- 0" ); 
					   cart.setQuantity(   "1"  ); 
			CartDao.insertcart( cart ); 
		} 
		else { 
			System.out.println( "3.2.product size -- 1" ); 
			Cart       carta       =  cartlist.get(0); 
			
			Integer quantityint    =  new Integer( carta.getQuantity() ); 
			
			if(quantityint<9999){ 
				System.out.println( "cart quantity in the range of 9999." ); 
				String     quantity    = Integer.toString(  quantityint+1 ); 
					       cart.setQuantity(quantity); 
			} else 
				System.out.println( "cart quantity out of range of 9999." ); 
			
			CartDao.updatecartc(cart); 
		} 
		
		String cartquantity = CartCenter.cartquantity( username  , session );
		
		System.out.println( "adding to cart..." );
		
		return cartquantity; 
		
	}
	
	

	
	
	@RequestMapping(value={"/updateprice"},method=RequestMethod.GET)
	public void updateprice( ModelAndView mav ) throws IOException {
		;
	}
	
	@RequestMapping(value={"/submitcart"} ,method=RequestMethod.GET)
	public void submitcart( ModelAndView mav ) throws IOException {
		;
	}
	
	@RequestMapping(value={"/deletecart"} ,method=RequestMethod.GET)
	public void deletecart( ModelAndView mav ) throws IOException {
		;
	}
	
	@RequestMapping( value={"/cleancart"} , method=RequestMethod.POST )
	public @ResponseBody String cleancart( HttpSession session ) {
		session.setAttribute( "cartquantity" , "0" );
		return "0";	
	}
	
	public static void main(String[] args) {
		
		List<String>                         cartPageImgLongerEdgeList  =  new ArrayList();
		
		List<String>                         cartPagesellerList         =  new ArrayList();
		
		Map<String,Map<String,List<String>>> cartsellerMap              =  new HashMap<String,Map<String,List<String>>>();
		
		Map<String,List<String>>             sellerMap                  =  new HashMap<String,List<String>>();
		
		sellerMap.put( "uuss" , cartPagesellerList );
		
		
		
		
		
		cartsellerMap.put("uuss", sellerMap);
		
		cartsellerMap.get("uuss");
		
		// cartsellerMap.put("seller", value)
		
		
		
		
	}
	
}

