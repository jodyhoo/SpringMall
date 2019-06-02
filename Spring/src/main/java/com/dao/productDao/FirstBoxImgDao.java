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

import com.bean.FirstBoxImg;
import com.dao.Dao;
import com.dao.uuid.UuidUtils;

public class FirstBoxImgDao {

	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/productDao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/productDao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	public static List<FirstBoxImg> queryRecommand7ProductsByID(byte[] productid) throws IOException {
		SqlSession session  = null;
		try {
	                              session          = sqlsessionfactory.openSession();
	             FirstBoxImgMI    firstboximgmi    = session.getMapper(FirstBoxImgMI.class);
	        List<FirstBoxImg>     firstboximgList  = firstboximgmi.queryRecommand7ProductsByID(productid);
	        
	        //System.out.println( "firstboximgList length -- " + firstboximgList.size() );
	        
	        Iterator              iterboximgList   = firstboximgList.iterator();
	        
	        //System.out.println( "productDao -- queryProductByUser ... " );
	        
	        for ( int i = 0 ; iterboximgList.hasNext() ; i++ ) {
	        	FirstBoxImg firstboximg = (FirstBoxImg)iterboximgList.next();
	        	//System.out.println( "row " + i + " :  " + UUID.nameUUIDFromBytes(firstboximg.getProductid()) + " -- " + firstboximg.getFirstboximg() + " -- " + firstboximg.getPrice() + " -- " + firstboximg.getProductname() );
	        }
	        
	        //System.out.println( "" );
	        
			return firstboximgList;
		} finally {
			session.close();
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		init();
		
		UUID    uuidt      = java.util.UUID.fromString("e207bfb2-0fc5-44f0-a443-f4a26c617d4d");
		queryRecommand7ProductsByID(  UuidUtils.asBytes(uuidt)  );
		
	}
	
}































