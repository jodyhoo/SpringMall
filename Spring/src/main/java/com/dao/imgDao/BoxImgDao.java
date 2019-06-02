package com.dao.imgDao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.BoxImg;
import com.bean.Product;
import com.dao.Dao;
import com.dao.productDao.ProductMI;
import com.dao.uuid.UuidUtils;

public class BoxImgDao {
	
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
	
	public static String queryFirstBoximgsmallByID(String productid)  {
		SqlSession   session     = null;
		String       boxImgsmall = null;
		try {
				     session     = sqlsessionfactory.openSession();
			BoxImgMI boximgmi    = session.getMapper(BoxImgMI.class);
			         boxImgsmall = boximgmi.queryFirstBoxImgsmallByID(productid);
			
			/********************************test part********************************/         
			//System.out.println( "BoxImgDao -- queryFirstBoximgsmallByID ... " );
			//System.out.println( "" + boxImgsmall);
			/************************************************************************/
			
		} finally {
			session.close();
		}
		return boxImgsmall;
	}
	
	public static List<String> queryAllBoximgsmallByID(String productid) {
		SqlSession   session         = null;
		List<String> boxImgsmallList = null;
		try {
				     session         = sqlsessionfactory.openSession();
			BoxImgMI boximgmi        = session.getMapper(BoxImgMI.class);
			         boxImgsmallList = boximgmi.queryAllBoxImgsmallByID(productid);
			
			/********************************test part********************************/         
			//System.out.println( "BoxImgDao -- queryAllBoximgsmallByID ... " );
			
			Iterator boximgsmalliter = boxImgsmallList.iterator();
			
			//while(boximgsmalliter.hasNext())
				//System.out.println( "" + boximgsmalliter.next() );
			///System.out.println( "" );
			/************************************************************************/
			
		} finally {
			session.close();
		}
		
		return boxImgsmallList;
	}
	
	public static List<BoxImg> queryAllBoximgByID(String productid) {
		SqlSession         session    = null;
		List<BoxImg>       boxImgList = null;
		try {
				           session    = sqlsessionfactory.openSession();
			BoxImgMI       boximgmi   = session.getMapper(BoxImgMI.class);
			               boxImgList = boximgmi.queryBoxImgByID(productid);
			
			/********************************test part********************************/         
			//System.out.println( "BoxImgDao -- queryAllBoximgsmallByID ... " );
			
			Iterator       boximgiter = boxImgList.iterator();
			while(boximgiter.hasNext()) {
				BoxImg boximg = (BoxImg)boximgiter.next();
				//System.out.println( boximg.getCode() + " -- " + boximg.getBoximg() + " -- " + boximg.getBoximgsmall() );
			}
			
			//System.out.println( "" );
			/************************************************************************/
			
		} finally {
			session.close();
		}
		return boxImgList;
	}
	
	
	public static List<BoxImg> queryBoxImgByUsername(String username) {
		SqlSession         session    = null;
		List<BoxImg>       boxImgList = null;
		try {
				           session    = sqlsessionfactory.openSession();
			BoxImgMI       boximgmi   = session.getMapper(BoxImgMI.class);
			               boxImgList = boximgmi.queryBoxImgByUsername(username);
			
			/********************************test part********************************/         
			//System.out.println( "BoxImgDao -- queryBoxImgByUsername ... " );
			
			Iterator       boximgiter = boxImgList.iterator();
			for( int i = 0 ; boximgiter.hasNext() ; i++ ) {
				BoxImg boximg = (BoxImg)boximgiter.next();
				//System.out.println( boximg.getCode() + " -- " + boximg.getBoximg() + " -- " + boximg.getBoximgsmall() );
			}
			
			//System.out.println( "" );
			/************************************************************************/
			
		} finally {
			session.close();
		}
		return boxImgList;
	}
	
	
	public static int updateBoxImgSmall220ByID ( String boximgsmall220 , byte[] productid ,int code ) {
		SqlSession         session              = null;
		int                row                  = 0;
		try {
				           session              = sqlsessionfactory.openSession();
			BoxImgMI       boximgmi             = session.getMapper(BoxImgMI.class);
						   row                  = boximgmi.updateBoxImgSmall220ByID(boximgsmall220 , productid, code);
			
			/********************************test part********************************/         
			//System.out.println( "BoxImgDao -- queryBoxImgByUsername ... " );
			//System.out.println( "update BoxImgSmall220 , rows to be updated -- " + row + "\n" );
			/************************************************************************/
			
		} finally {
			session.close();
		}
		return row;
	}
	
	
	
	
	
	public static List<BoxImg> queryFirstBoxImgByUsername(String username) {
		SqlSession         session              = null;
		List<BoxImg>       firstBoxImgsmallList = null;
		try {
				           session              = sqlsessionfactory.openSession();
			BoxImgMI       boximgmi             = session.getMapper(BoxImgMI.class);
		         	       firstBoxImgsmallList = boximgmi.queryFirstBoxImgByUsername(username);
			
			/********************************test part********************************/         
			System.out.println( "BoxImgDao -- queryBoxImgByUsername ... " );
			
			Iterator       boximgiter =  firstBoxImgsmallList.iterator();
			for( int i = 0 ; boximgiter .hasNext() ; i++ ) {
				BoxImg     boximg     = (BoxImg)boximgiter.next();
				System.out.println( " Number : " + i + " -- " +boximg.getBoximg() );
			}
			
			System.out.println( "" );
			/************************************************************************/
			
		} finally {
			session.close();
		}
		return firstBoxImgsmallList;
	}
	
	
	
	
	
	
	
	public static List<String> queryFirstBoxImgsmallByUsername(String username) {
		SqlSession         session              = null;
		List<String>       firstBoxImgsmallList = null;
		try {
				           session              = sqlsessionfactory.openSession();
			BoxImgMI       boximgmi             = session.getMapper(BoxImgMI.class);
		         	       firstBoxImgsmallList = boximgmi.queryFirstBoxImgsmallByUsername(username);
			
			/********************************test part********************************/         
			System.out.println( "BoxImgDao -- queryBoxImgByUsername ... " );
			
			Iterator       boximgiter =  firstBoxImgsmallList.iterator();
			for( int i = 0 ; boximgiter .hasNext() ; i++ ) {
				String     boximg     = (String)boximgiter.next();
				System.out.println( " Number : " + i + " -- " +boximg );
			}
			
			System.out.println( "" );
			/************************************************************************/
			
		} finally {
			session.close();
		}
		return firstBoxImgsmallList;
	}
	
	/*
	public static List<String> queryAllFirstBoxImgByUsername(String username) {
		SqlSession         session              = null;
		List<String>       firstBoxImgsmallList = null;
		try {
				           session              = sqlsessionfactory.openSession();
			BoxImgMI       boximgmi             = session.getMapper(BoxImgMI.class);
		         	       firstBoxImgsmallList = boximgmi.queryFirstBoxImgsmallByUsername(username);
			
			     
			System.out.println( "BoxImgDao -- queryBoxImgByUsername ... " );
			
			Iterator       boximgiter =  firstBoxImgsmallList.iterator();
			for( int i = 0 ; boximgiter .hasNext() ; i++ ) {
				String     boximg     = (String)boximgiter.next();
				System.out.println( " Number : " + i + " -- " +boximg );
			}
			
			System.out.println( "" );
			
		} finally {
			session.close();
		}
		return firstBoxImgsmallList;
	}
	*/
	
	public static void main(String[] args) throws IOException, SQLException {
		
		init();
		
		/*
		String id   = new String("f0d05f80-69b1-4e7e-90d1-cf53e3ae1296");
		System.out.println( id.length() );
		
		//byte[] uuid = id.getBytes();
		//System.out.println( uuid.length );
		
		UUID   uuid      = java.util.UUID.fromString(id);
		byte[] uuidbytes = UuidUtils.asBytes(uuid);
		System.out.println( uuidbytes.length );
		
		BoxImg  boximgbean = new BoxImg( uuidbytes , "1" , null , null );
		System.out.println( "rows to be inserted : " + insertRow(boximgbean) );
		*/
		
		
		//init();
		//List<String> boximglist = (List<String>)queryBoxImg("user",1);
		
		
		
		
		
		/*
		List<String>  userPageFirstboximgsmallList = (List<String>)BoxImgDao.queryAllFirstBoxImgByUsername("user");
		
		Iterator listiter = userPageFirstboximgsmallList.iterator();
		for ( int i = 0 ; listiter.hasNext() ; i++ ) {
			  String boximg = (String)listiter.next();
			  System.out.println( "boximg "+i+" -- " + boximg);
		}
		*/
		
		
		// 1.
		//List<String> boximglist  = (List<String>)queryAllBoximgsmallByID  ("7042a34b-c4da-497b-9e2d-37690dd10be1");
		/*
		// 2.
		     String  boximgsmall =               queryFirstBoximgsmallByID("7042a34b-c4da-497b-9e2d-37690dd10be1");
		
		// 3.
		
		                                         queryAllBoximgByID       ("7042a34b-c4da-497b-9e2d-37690dd10be1");
		
		                                         
		                                         queryBoxImgByUsername    ("user");
		                                         
		                                         
		                                         queryFirstBoxImgsmallByUsername("user");
		                                       */  
		                                         
		/*
		Iterator     boximgiter = boximglist.iterator();
		while(boximgiter.hasNext())
			System.out.println( boximgiter.next() );
		*/
		
		
		
		
		/*
		List<String>  userPageFirstboximgList  = (List<String>)BoxImgDao.queryFirstBoxImgsmallByUsername("user");
		Iterator      firstboximgList               =  userPageFirstboximgList.iterator();
		
		for(  int i = 0 ; firstboximgList.hasNext() ; i++ ) {
			String boximg = (String)firstboximgList.next();
			
			System.out.println( " firstboximg  " + boximg );
		}
		*/
		
		
		
		
		List<BoxImg>  userPageboximgList       = (List<BoxImg>)queryFirstBoxImgByUsername("user");
		Iterator      boximgList               =  userPageboximgList.iterator();
		
		for(  int i = 0 ; boximgList.hasNext() ; i++ ) {
			BoxImg BoxImg = (BoxImg)boximgList.next();
			String boximg =  BoxImg.getBoximg();
			
			System.out.println( " boximg "+BoxImg.getCode()+" -- " + BoxImg.getBoximg() );
			
	        Integer               pointpost    =  boximg.lastIndexOf(".");
	        Integer               slashpost    =  boximg.lastIndexOf("/0");
	        String                suffixPath   =  boximg.substring  ( 0 , slashpost+"/0".length() );
	        String                prefixPath   =  boximg.substring  (     slashpost+"/0".length() , boximg.length() );
	        
	        String                boximg220    = (suffixPath.concat("small220")).concat(prefixPath);
	        
	        System.out.println( "userPage maniputlating  ..."  );
	        System.out.println( "BoxImgsmall220          -- " + boximg220 );
			
	        String                typesuffix   = (String) boximg.subSequence( pointpost+1 , boximg.length() );
	        String                rootPath     =  new String("c:/tomcat/webapps/Spring/WEB-INF");
			
	        // 4. 
	        //ImageIO.write( newImage , typesuffix , baos );
	        
	        // 5. create boximg220.
	        File         		 userimgsmall220file   = new File  (rootPath+boximg220);
				            if( !userimgsmall220file.exists        () )
				            	 userimgsmall220file.createNewFile ();
				            
	        /*
	 		FileOutputStream     fsmallous = new FileOutputStream(userimgsmall220file);
								 fsmallous.write(baos.toByteArray()); 
								 fsmallous.close(); 
			 */
								 
		}
		
		
		
		
		/*
		UUID   uuid      = java.util.UUID.fromString("0c0d7ea7-57ae-4020-ac9c-09736eb405a8");
		byte[] uuidbytes = UuidUtils.asBytes(uuid);
		
		updateBoxImgSmall220ByID("boximgsmall220 NEW" , uuidbytes,0);
		*/
		
		
		
		
	}
	
}




