package com.dao.carttempDao;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.Cart;
import com.bean.Product;
import com.dao.Dao;
import com.dao.productDao.ProductDao;
import com.dao.uuid.UuidUtils;

public class CartDao {
	
	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/carttempDao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/carttempDao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	public static int        insertcart( Cart cart ) {
		
		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----insert---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession();
	                                rows            = session.insert( "com.dao.carttempDao.CartMapper.insertcart" , cart );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return                      rows;
	}
	
	public static List<Cart> selectname( String username ) {
		SqlSession                  session         = null;
		List<Cart>                  cartlist        = null;
		System.out.println(   " ----insert---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession();
	                                cartlist        = session.selectList( "com.dao.carttempDao.CartMapper.selectname" , username );
	                                
	                        		Iterator   cartiter = cartlist.iterator();
	                        		while(cartiter.hasNext()) {
	                        			Cart cart = (Cart)cartiter.next();
	                        			System.out.println( "" + cart.getQuantity()  );
	                        			System.out.println( "" + cart.getBuyer()  );
	                        			System.out.println( "" + UuidUtils.asUuid(cart.getProductid()) );
	         }
		}
		finally                 {   session.close();   }
		return   					cartlist;
	}
	
	public static List<Cart> selectid( Cart cart ) {
		
		SqlSession                  session         =  null;
		List<Cart>                  cartlist        =  null;
		System.out.println(   " ----insert---- "   );
		
		try {
	                                session         =  sqlsessionfactory.openSession();
	                                cartlist        =  session.selectList( "com.dao.carttempDao.CartMapper.selectid" , cart );
	                                
	                                if( cartlist.size() != 0 ) {
	                                	Cart carta = cartlist.get(0);
	                        			System.out.println( "Username  -- " + carta.getBuyer()  );
	                        			System.out.println( "Productid -- " + UuidUtils.asUuid(carta.getProductid()) );
	                        			System.out.println( "Quantity  -- " + carta.getQuantity()  + "\n" );
	                                }
	                                
			}
		finally                 {   session.close();   }
		return   					cartlist;
	}
	
	public static int        selectitem( String username ) {
		SqlSession                  session         =  null;
		int                         count           =  0;
		System.out.println(   " ----insert---- "   );
		
		try {
	                                session         =  sqlsessionfactory.openSession();
	                                count           =  session.selectOne( "com.dao.carttempDao.CartMapper.selectitem" , username );
	                                
			}
		finally                 {   session.close();   }
		return   					count;
	}
	
	
	public static int        deletecart( Cart   cart     ) {
		
		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----delete---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession(); 
	                                rows            = session.delete( "com.dao.carttempDao.CartMapper.deletecart" , cart );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return rows;
	}
	
	
	public static int        deleteuser( String username ) {

		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----delete username---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession(); 
	                                rows            = session.delete( "com.dao.carttempDao.CartMapper.deleteuser" , username );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return rows;
	}
	
	
	public static int        updatecartc( Cart   cart ) {
		
		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----update---- "   );
		try {
	                                session         = sqlsessionfactory.openSession(); 
	                                rows            = session.delete( "com.dao.carttempDao.CartMapper.updatecartc" , cart );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return rows;
	}
	
	
	/* test area */
	public static void       selectitem() {
		 
		 System.out.println( "" + selectitem("user") );
	}
	
	
	public static void main(String[] args) throws IOException {
		
		System.out.println( "" );
		
		init();
		
		//deleteuser("user00");
		
		
		
		/* insert */
		
		String  uuid     = new String("33700253-6bbb-4459-b80c-373700b36cd9");
		UUID    uuidt    = java.util.UUID.fromString(uuid);
		byte[]  uuidbyt  = UuidUtils.asBytes(uuidt);
		
		Cart    cart     = new Cart();
				cart.setProductid(uuidbyt);
				cart.setQuantity("65535");
				cart.setBuyer("user00");
				
		System.out.println( "" + insertcart(cart) );
		
		
		
		
		// query
		
		List<Cart> cartlist    = selectname("user");
		System.out.println( "" + cartlist.size() );
		Iterator   cartiter    = cartlist.iterator();
		while(cartiter.hasNext()) {
			Cart carta = (Cart)cartiter.next();
			System.out.println( "" + carta.getQuantity()  );
			System.out.println( "" + carta.getBuyer()  );
			System.out.println( "" + UuidUtils.asUuid(carta.getProductid()).toString() );
		}
		
		
		
		
		
		
		
		
		// delete 
		/*
		String  uuid     = new String("33700253-6bbb-4459-b80c-373700b36cd9");
		UUID    uuidt    = java.util.UUID.fromString(uuid);
		byte[]  uuidbyt  = UuidUtils.asBytes(uuidt);
		
		Cart    cart = new Cart();
		
			  //cart.setProductid(productid);
			 
			   cart.setUsername("user");
			   cart.setProductid(uuidbyt);
			 
		System.out.println( "deletecart -- " + deletecart(cart) );
		 */
		
		
		
		// update 
		/*
		String  uuid     = new String("33700253-6bbb-4459-b80c-373700b36cd9");
		UUID    uuidt    = java.util.UUID.fromString(uuid);
		byte[]  uuidbyt  = UuidUtils.asBytes(uuidt);
		
		
		Cart    cart     = new Cart();
				cart.setQuantity("111");
				cart.setProductid(uuidbyt);
				cart.setUsername("user");
		
		System.out.println( "" + updatecart(cart) );
		 */
		
		
		//selectname("user");
		
		
		
		// select cart by id.
		
		/*
		byte[]  uuidbytq  = UuidUtils.asBytes(  UUID.fromString("33700253-6bbb-4459-b80c-373700b36cd9")  );
		
		Cart    cartq     = new Cart();
				cartq.setProductid(uuidbytq);
				cartq.setUsername("user");
				
		System.out.println( "" + selectid(cartq) );
		 */
		
		
		
		
		
		
		/*
		cart.setFirstboximg("/img");
		cart.setProductname("鞋子 女鞋 新款");

		cart.setUsername("user");
		 */
		
		
		
	}
	
	
}


