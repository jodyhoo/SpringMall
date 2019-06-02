package com.cartCenter;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bean.Cart;
import com.dao.cartDao.CartDao;
import com.dao.uuid.UuidUtils;

@Controller
public class CartUpdate {
	
	@RequestMapping(value={"/cartCenter/cartUpdate"},method=RequestMethod.POST)
	public void cartmodify( MultipartHttpServletRequest  request  ,
									 HttpServletResponse response ) throws IOException {
		
		String newcount  = (String)request.getParameter("newcount" );
		String productid = (String)request.getParameter("productid");
		String buyer     = (String)request.getParameter("buyer"    );
		
		Cart   cart      =  new  Cart();
		
		UUID   uuidt     = java.util.UUID.fromString(productid);
		byte[] uuidbyt   =           UuidUtils.asBytes(uuidt);
			   
			   cart.setBuyer(buyer);
			   cart.setQuantity(newcount); 
			   cart.setProductid(uuidbyt);
			   
		CartDao.updatecartc(cart);
	}
	
}

