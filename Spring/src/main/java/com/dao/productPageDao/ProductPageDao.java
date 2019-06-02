package com.dao.productPageDao;


import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Properties;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.BoxImg;
import com.dao.Dao;
import com.dao.imgDao.BoxImgMI;
import com.dao.uuid.UuidUtils;


public class ProductPageDao {
	
	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/imgDao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/imgDao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	public static int insertRow(BoxImg boximg) throws IOException {
		SqlSession session  = null;
		try {
	                      session   = sqlsessionfactory.openSession();
	        BoxImgMI      productmi = session.getMapper(BoxImgMI.class);
	        int           row       = productmi.insert(boximg);
	        
	        //System.out.println( "rows to be inserted : " + row );
	        
	        session.commit();
	        
			return row;
		} finally {
			session.close();
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		String id   = new String("bfdc4f66-6fce-11e8-97b1-00ff679e6eff");
									
		//System.out.println( id.length() );
		
		UUID   uuid      = java.util.UUID.fromString(id);
		
		byte[] uuidbytes = UuidUtils.asBytes(uuid);
		
		//System.out.println( uuidbytes.length );
		
		init();
		
		BoxImg  boximgbean = new BoxImg( uuidbytes , "1" , "imgPath" , "imgsmallPath" );
		
		//System.out.println( "rows to be inserted : " + insertRow(boximgbean) );
		
	}
	
}






