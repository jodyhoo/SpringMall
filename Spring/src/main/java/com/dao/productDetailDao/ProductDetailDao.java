package com.dao.productDetailDao;


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

import com.bean.Cart;
import com.bean.ProductDetail;
import com.dao.Dao;
import com.dao.uuid.UuidUtils;


public class ProductDetailDao {
	
	
	static SqlSessionFactory sqlsessionfactory;
	
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/productDetailDao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/productDetailDao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	
	public static int insertdetail( ProductDetail productDetail ) {
		
		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----insert---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession();
	                                rows            = session.insert( "com.dao.productDetailDao.ProductDetailMapper.insertdetail" , productDetail );
	                                System.out.println( "rows to be inserted -- " + rows );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return                      rows;
	}
	
	
	public static List<ProductDetail> selectid( ProductDetail productDetail ) {
		SqlSession                  session             = null;
		List<ProductDetail>         productDetailList   = null;
		System.out.println(   " ----selectseller---- "   );
		
		try {
	                                session             = sqlsessionfactory.openSession();
	                                productDetailList   = session.selectList( "com.dao.productDetailDao.ProductDetailMapper.selectid" , productDetail );  
	                                
	                        		Iterator   productDetailiter = productDetailList.iterator();
	                        		while(productDetailiter.hasNext()) {
	                        			ProductDetail productDetailrow = (ProductDetail)productDetailiter.next();
	                        			System.out.println( "Style -- " +                  UuidUtils.asUuid(productDetailrow.getProductid())  );
	                        			System.out.println( "Style -- " +                  productDetailrow.getName()  );
	                        			System.out.println( "\n"        );	
	                        		}
		}
		finally                 {   session.close();   }
		return   					productDetailList;
	}
	
	
	public static int        deletename( ProductDetail productDetail ) {
		
		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----delete---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession(); 
	                                rows            = session.delete( "com.dao.productDetailDao.ProductDetailMapper.deletename" , productDetail );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return rows;
	}
	
	
	public static int        deleteid( ProductDetail productDetail ) {

		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----delete---- "   );
		
		try {
	                                session         = sqlsessionfactory.openSession(); 
	                                rows            = session.delete( "com.dao.productDetailDao.ProductDetailMapper.deleteid" , productDetail );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return rows;
	}
	
	
	public static int        updatename( ProductDetail productDetail ) {
		
		SqlSession                  session         = null;
		int                         rows            = 0;
		System.out.println(   " ----update---- "   );
		try {
	                                session         = sqlsessionfactory.openSession(); 
	                                rows            = session.delete( "com.dao.productDetailDao.ProductDetailMapper.updatename" , productDetail );
	                                session.commit();
		}
		finally                 {   session.close();   }
		return rows;
	}
	
	
	public static void main(String[] args) throws IOException {
		
		System.out.println( "" );
		
		init();
		
		ProductDetail productDetail = new ProductDetail();
		
		UUID    uuidt      = java.util.UUID.fromString("449f4782-03b4-4dbe-9faf-079b9ac3c484");
		byte[]  uuidbyt    = UuidUtils.asBytes(uuidt);
		
							 productDetail.setProductid(uuidbyt);
							 productDetail.setName("this new style");
							 productDetail.setBoximg("/img");
							 productDetail.setBoximgsmall("/imgsmall");
							 productDetail.setCode("0");
							 
					 /*
						 productDetail.setOldstyle("new style sample");
						 productDetail.setNewstyle("newnew new style");
				 	  */
					 
					 
					     
						 insertdetail(productDetail);
					/*	
						 updatestyle(productDetail);
						 
						 selectid(productDetail);
						 
					 */
					 
					 //deletename(productDetail);
					 
	}
	
	
}



