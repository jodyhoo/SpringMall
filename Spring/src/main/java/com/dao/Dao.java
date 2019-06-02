package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.User;

public class Dao {
	
	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	// wait to imporve.
	public static String queryPasw(String username) throws IOException {
		SqlSession session  = null;
		User       user     = null; 
		try {
	        session  = sqlsessionfactory.openSession();
	        //user     = session.se
			//System.out.println( "" + student.getId() + " " + student.getFirstname() + " " + student.getLastname() + " " );
			System.out.println( username + " -- " + user.getPassword() );
		} finally {
			session.close();
		}
		return user.getPassword();
	}
	
	public static String testacc(String username) throws IOException {
		SqlSession session  = null;
		try {
			// 0.login database.
			session  = sqlsessionfactory.openSession();
			UserMI studentmi = session.getMapper (UserMI.class);
			List<User> users = studentmi.queryPaswa(username);
			
			// 1.exam columns of user.
			if( users.size() == 1 ) {
				
				//User       user     = user = users.get(0);
				System.out.println( username + " exist. " );
				
				return username;
			}
			else if ( users.isEmpty() ){
				System.out.println( "no such username : " + username );
				return "";
			}
			
		} finally {
			session.close();
		}
		return "error";
	}
	
	
	
	public static String queryPaswa(String username) throws IOException {
		SqlSession session  = null;
		try {
			// 0.login database.
			session  = sqlsessionfactory.openSession();
			UserMI     usermi = session.getMapper (UserMI.class);
			List<User> users  = usermi.queryPaswa(username);
			
			// 1.exam columns of user.
			if( users.size() == 1 ) {
				User       user    = users.get(0);
				System.out.println( username + " -- " + user.getPassword() );
				return user.getPassword();
			}
			else if ( users.isEmpty() ){
				//System.out.println( "no such username : " + username );
				return "";
			}
			
		} finally {
			session.close();
		}
		return "error";
	}
	
	
	public static void inserta(User user) throws IOException {
		SqlSession session = null;
		try {
			// 0.login database.
			session  = sqlsessionfactory.openSession();
			UserMI     usermi = session.getMapper (UserMI.class);
			
			Integer    rows   = usermi.insert(user);
				 session.commit();
			System.out.println( "rows to be effected : " + rows );
		} finally {
			session.close();
		}
	}
	
	
	public static void main(String[] args) throws IOException {
		
		init();
		
		
		System.out.println( "user    testacc : " + testacc("user") );
		System.out.println( "user123 testacc : " + testacc("user123") );
		
		System.out.println( "user    queryPaswa : " + queryPaswa("user") );
		System.out.println( "user123 queryPaswa : " + queryPaswa("user123") );
		
		
		System.out.println( "test user   : " + testacc("user") );
		System.out.println( "test user22 : " + testacc("user22") );
		
		// add test.
		/*
		User user = new User();
		user.setUsername("usera");
		user.setPassword("123");
		inserta(user);
		*/
	}
	
	
	
}





























