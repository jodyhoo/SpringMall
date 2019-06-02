package com.dao.billDao;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.Bill;
import com.bean.Bill.BILL;
import com.dao.Dao;
import com.dao.imgDao.BoxImgMI;
import com.dao.uuid.UuidUtils;

public class BillDao {
	
	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/billDao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/billDao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	public static int insert( Bill bill ) {
		SqlSession     session  = null;
		int            rows     = 0;
		System.out.println( "--insert--" );
		try {
	                   session   = sqlsessionfactory.openSession();
	                   rows      = session.insert( "com.dao.billDao.BillMapper.insert" , bill );
	                   System.out.println( "rows to be inserted -- " + rows );
	                   session.commit();
		} finally {
			session.close();
		}
		return rows;
	}
	
	public static List<Bill> selectname( String username ) {
		SqlSession     session  = null;
		List<Bill>     billlist = new ArrayList<Bill>();
		try {
	                   session   = sqlsessionfactory.openSession();
	                   billlist  = session.selectList( "com.dao.billDao.BillMapper.select" , username );
	                   
	                   Iterator billiter = billlist.iterator();
	                   while(billiter.hasNext()) {
	                	   Bill bill = (Bill)billiter.next();
	                	   System.out.println( "" + bill.getBillid() );
	                   }
	                   
		} finally {
			session.close();
		}
		return billlist;
	}
	
	public static Bill selectid( Integer billid ) {
		SqlSession     session   = null;
		Bill           bill      ;
		try {
	                   session   = sqlsessionfactory.openSession();
	                   bill      = session.selectOne( "com.dao.billDao.BillMapper.selectid" , billid );
	                   
	                   if( "null".equals(bill)  )  {
	                	   System.out.println( "bill is null ... " + bill );
	                   }
	                   
	                   Bill billnull = null;
	                   
	                   //bill.equals(null);
	                   
	                   //bill.equals(billnull);
	                   
		} finally {
			session.close();
		}
		return bill;
	}
	
	public static int deletename( String username ) {
		SqlSession     session = null;
		int            rows    = 0;
		try {
	                   session = sqlsessionfactory.openSession();
	                   rows    = session.delete( "com.dao.billDao.BillMapper.deletename" , username );
	                   session.commit();
		} finally {
			session.close();
		}
		return rows;
	}
	
	public static int deleteid( Integer billid ) {
		SqlSession     session = null;
		int            rows    = 0;
		try {
	                   session = sqlsessionfactory.openSession();
	                   rows    = session.delete( "com.dao.billDao.BillMapper.deleteid" , billid );
	                   session.commit();
		} finally {
			session.close();
		}
		return rows;
	}
	
	public static int updateprice( Bill bill ) {
		SqlSession     session = null;
		int            rows    = 0;
		try {
	                   session = sqlsessionfactory.openSession();
	                   rows    = session.update( "com.dao.billDao.BillMapper.updateprice" , bill );
	                   session.commit();
		} finally {
			session.close();
		}
		return rows;
	}
	
	public static int updatestatus( Bill bill ) {
		SqlSession     session = null;
		int            rows    = 0;
		try {
	                   session = sqlsessionfactory.openSession();
	                   rows    = session.update( "com.dao.billDao.BillMapper.updatestatus" , bill );
	                   session.commit();
		} finally {
			session.close();
		}
		return rows;
	}
	
	public static void main(String[] args) throws IOException {
		
		System.out.println( "" );
		
		init();
		
		// insert
		/*
		Bill    bill     = new Bill();
		String  uuid     = new String("33700253-6bbb-4459-b80c-373700b36cd9");
		UUID    uuidt    = java.util.UUID.fromString(uuid);
		byte[]  uuidbyt  = UuidUtils.asBytes(uuidt);
		
			    bill.setProductid(uuidbyt);
			    bill.setQuantity("100");
			    bill.setStatus(BILL.AFTERBUILD.toString());
			    bill.setSumprice("1000");
			    bill.setUsername("user");
		insert(bill);
		*/
		
		
		// select by id
		/*
		List<Bill> billlist = selectname("user");
		     Bill  billb    = selectid(1);
		 */
		
		
		// update price
		/*
		Bill    billp     = new Bill();
				billp.setBillid(25);
				billp.setSumprice("1300");
				
				updateprice(billp);
		 */
		
		
		/*
		Bill    bills     = new Bill();
				bills.setBillid(25);
				bills.setStatus(BILL.AFTERPAY.toString());
				
				updatestatus(bills);
		 */		
		
		
		
		//deletename("user"); 
		
		//deleteid(2); 
		
		
		
		/*
		updateprice 
		
		updatestatus
		*/
		
		
	}
	
}

