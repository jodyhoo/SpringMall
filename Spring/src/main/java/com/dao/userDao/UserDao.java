package com.dao.userDao;

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
import com.dao.Dao;
import com.dao.userDao.UserMI;

public class UserDao {
	
	static SqlSessionFactory sqlsessionfactory;
	
	public static void init() throws IOException {
		InputStream ins   = Dao.class.getClassLoader().getResourceAsStream("com/dao/mybatis-config.xml");
		Reader      rdr   = new InputStreamReader(ins);
		
		InputStream is    = Dao.class.getClassLoader().getResourceAsStream("com/dao/account.properties");
		Properties  props = new Properties();
					props.load(is);
		
		sqlsessionfactory = new SqlSessionFactoryBuilder().build(rdr,props);
	}
	
	public static void updatePaswa(User user) throws IOException {
		
		SqlSession session = null;
		
		try {
			// 0.login database.
			session  = sqlsessionfactory.openSession();
			UserMI     usermi = session.getMapper (UserMI.class);
			
			Integer    rows   = usermi.updatePasw(user);
				       session.commit();
			//System.out.println( "rows to be effected : " + rows );
		} finally {
			session.close();
		}
	}
	
	public static void updatea(User user) throws IOException {
		
		SqlSession session = null;
		
		try {
			// 0.login database.
			session  = sqlsessionfactory.openSession();
			UserMI     usermi = session.getMapper (UserMI.class);
			
			Integer    rows   = usermi.update(user);
				       session.commit();
			//System.out.println( "rows to be effected : " + rows );
		} finally {
			session.close();
		}
	}
	
	public static List<User> query(String username) throws IOException {
		SqlSession session  = null;
		List<User> users     = null;
		try {
			// 0.login database.
			           session = sqlsessionfactory.openSession();
			UserMI     usermi  = session.getMapper (UserMI.class);
			           users   = usermi.query(username);
			
			// 1.exam columns of user.
			if( users.size() == 1 ) {
				/*user    = users.get(0);*/
				System.out.println( users.get(0).getFirstname() + " -- " + users.get(0).getPassword() );
			}
			
		} finally {
			session.close();
		}
		return users;
	}
	
	public static void main(String[] args) throws IOException {
		
		
		init();
		
		
		List<User> user = query("user");
		
		
		/*
		User userb = new User();
		
		userb.setUsername("user");
		userb.setPassword("123");
		userb.setEmail("@");
		userb.setFirstname("aaa");
		userb.setLastname("aan");
		userb.setPhone("");
		updatea(userb);
		
		
		List<User> usernew = query("user");
		
		System.out.println( "usernew Username  : " + usernew.get(0).getUsername() ) ;
		System.out.println( "usernew Password  : " + usernew.get(0).getPassword() ) ;
		System.out.println( "usernew Firstname : " + usernew.get(0).getFirstname() ) ;
		System.out.println( "usernew Lastname  : " + usernew.get(0).getLastname() ) ;
		System.out.println( "usernew Phone     : " + usernew.get(0).getPhone() ) ;
		System.out.println( "usernew Email     : " + usernew.get(0).getEmail() ) ;
		*/
		
	}
	
}




