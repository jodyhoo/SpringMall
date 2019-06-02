package com.dao.productDao;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.Product;
import com.bean.Product.CATEGORY;
import com.bean.User;
import com.dao.Dao;
import com.dao.imgDao.BoxImgDao;
import com.dao.uuid.UuidUtils;

public class ProductDao {
	
	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/productDao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/productDao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	// wait to imporve.
	public static List<Product> queryProductByUserTASC(String username) throws IOException {
		SqlSession session  = null;
		try {
	                      session     = sqlsessionfactory.openSession();
	        ProductMI     productmi   = session.getMapper(ProductMI.class);
	        List<Product> products    = productmi.queryProductByUserTASC(username);
	        
	        Iterator      iterproduct = products.iterator();
	        
	        System.out.println( "productDao -- queryProductByUser ... " );
	        
	        for ( int i = 0 ; iterproduct.hasNext() ; i++ ) {
	        	Product product = (Product)iterproduct.next();
	        	System.out.println( "row " + i + " :  " + product.getUsername() + " -- " + product.getProductname() + " -- " + product.getPrice() + " -- " + product.getQuantity() + " -- " + product.getCategory() + " -- " + product.getFirstboximg() );
	        }
	        System.out.println( "" );
	        
			return products;
		} finally {
			session.close();
		}
	}
	
	public static Product queryProductByID(byte[] uuid) {
		SqlSession session  = null;
		try {
	                      session   = sqlsessionfactory.openSession();
	        ProductMI     productmi = session.getMapper(ProductMI.class);
	        Product       product   = productmi.queryProductByID(uuid);
	        
			return product;
		} finally {
			session.close();
		}
	}
	
	/* product manipulation. */
	public static List<byte[]> queryAllProductID(String username) throws IOException {
		SqlSession    session   = null;
		List<byte[]>  productidlist = null;
		try {
	                      session       = sqlsessionfactory.openSession();
	        ProductMI     productmi     = session.getMapper(ProductMI.class);
	        			  productidlist = productmi.queryAllProductID(username);
	        
	        //user     = session.se
			//System.out.println( "" + student.getId() + " " + student.getFirstname() + " " + student.getLastname() + " " );
			
	        Iterator      productiter = productidlist.iterator();
	        for ( int i = 0 ; productiter.hasNext() ; i++ ) { 
	        	byte[]  productid     = (byte[]) productiter.next();
		        UUID    productiduuid =  UuidUtils.asUuid(productid);
		                      
		        System.out.println( "Number " + i + " UUID -- " + productiduuid.toString() );
	        }
	        
			return productidlist;
		} finally {
			session.close();
		}
	}
	
	public static String queryproductNameById(byte[] productid) throws IOException {
		SqlSession    session         = null;
		String        productname     = null;
		try {
					  session         =          sqlsessionfactory.openSession();
		    ProductMI productmi       =          session.getMapper(ProductMI.class);
		    		  productname     = (String) productmi.querynameByID(productid);
		} finally {
			session.close();
		}
		return productname;
	}
	
	public static String queryNewId(String username) throws IOException {
		SqlSession session  = null;
		try {
	                      session   = sqlsessionfactory.openSession();
	        ProductMI     productmi = session.getMapper(ProductMI.class);
	        String        productid = productmi.queryNewId(username);
	        
	        //user     = session.se
			//System.out.println( "" + student.getId() + " " + student.getFirstname() + " " + student.getLastname() + " " );
			
	        System.out.println( "New ID -- " + productid );
	        
			return productid;
		} finally {
			session.close();
		}
	}
	
	public static int insertAll(Product product) throws IOException {
		SqlSession session  = null;
		try {
	                      session   = sqlsessionfactory.openSession();
	        ProductMI     productmi = session.getMapper(ProductMI.class);
	        int           products  = productmi.insert(product);
	        
	        //user     = session.se
			//System.out.println( "" + student.getId() + " " + student.getFirstname() + " " + student.getLastname() + " " );
			
	        System.out.println( "rows to be inserted : " + products );
	        
	        session.commit();
	        
			return products;
		} finally {
			session.close();
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		init();
		
		// 1.query products by username.
		List<Product> products  = queryProductByUserTASC("user");
		
		//System.out.println( ""  + products.get(0).getCategory() );
		
		Product   product = new Product( UuidUtils.asBytes(UUID.randomUUID() ) , "user" , "新名字222" , "300" , "2000" ,  null , null , CATEGORY.家电.toString() );
		insertAll(product);
		
		/*
		Product  productb = new Product( UuidUtils.asBytes(UUID.randomUUID()) , "user" , "新名字222" , "300" , "2000" ,  null , null , CATEGORY.家电.toString() );
		insertAll(productb);
		*/
		
		//queryProductByUserTASC("user");
		
		//List<Product> productsb = queryProductByUserTASC("user123");
		
		//List<Product> productsc = queryAll("user12");
		
		/*
		byte[] uuidbytes  = null;
	    UUID   uuid       = UUID.randomUUID();
 	           uuidbytes  = UuidUtils.asBytes(uuid);
 	    
		Product product = new Product( uuidbytes , "user" , "新名字222" , "300" , "2000" , null , null );
		
		
		*/
		
		
		/*
		// 3.query NewID
		queryNewId("user12");
		
		List<byte[]> productid = queryAllProductID("user");
		
		Iterator     iditer    = productid.iterator();
		
		while(iditer.hasNext()) {
			byte[] id   = (byte[])iditer.next();
			String name = queryproductNameById(id);
			System.out.println( " name -- " + name );
		}
		
		// 4.query product by id.
		UUID    uuidt      = java.util.UUID.fromString("06eaddbf-41e7-4d3d-8960-5099a635f98e");
		
		byte[]  uuidbyt    = UuidUtils.asBytes(uuidt);
		
		Product productt   = queryProductByID(uuidbyt);
		
		System.out.println( " product test -- " + productt.getProductpage() );
		*/
		
		/*
		String boximg = "'/img/users/user/20180708/215855/0171028104812-2017-tokyo-motor-show-mazda-vision-coupe-2-780x439.jpg'";
		
        Integer               slashpost    =  boximg.lastIndexOf("/0");
        String                suffixPath   =  boximg.substring( 0 , slashpost+"/0".length() );
        String                prefixPath   =  boximg.substring(     slashpost+"/0".length() , boximg.length() );
        
        String                boximg200    = (suffixPath.concat("small220")).concat(prefixPath);
		
        System.out.println( "" + boximg200 );
		
		//suffix       =  prefixPath.substring( 0 , prefixPath.indexOf("small")+"small".length() );
		
		
		

        String boximga = "/img/users/user/20180709/145324/0small220World-of-Warcraft-Wallpapers-2.jpg";
        String                suffixPathtest   =  boximga.substring  (  0 , boximga.lastIndexOf("/0") );
        
        System.out.println(suffixPathtest);
		*/
		
		
	}
	
}



