package com.dao.productDao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.bean.Product;
import com.bean.User;

public interface ProductMI {
	
	final String getAll     = "SELECT * FROM STUDENT";
	final String getbyfname = "SELECT * FROM STUDENT WHERE firstname=#{firstname}";
	final String update     = "UPDATE        STUDENT WHERE id       =#{id}";
	final String deletebyid = "DELETE   FROM STUDENT WHERE id       =#{id}";
	final String insert     = "INSERT INTO   STUDENT(  firstname  ,   lastname  )"+
	                          "VALUES               (#{firstname} ,  #{lastname} )";
	
	@Select(getAll)
	@Results(value = {
		@Result(property = "id"        , column = "ID"        ),
		@Result(property = "firstname" , column = "FIRSTNAME" ),
		@Result(property = "lastname"  , column = "LASTNAME"  )
	})
	List<User> getAll();
	
	
	@Select ("SELECT *           FROM product WHERE username=#{username} ORDER BY ctime ASC;")
	public List<Product>  queryProductByUserTASC  (String username);
	
	@Select ("SELECT productid   FROM PRODUCT WHERE username=#{username} ORDER by ctime DESC;")
	public List<byte[]>   queryAllProductID       (String username);
	
	@Select ("SELECT *           FROM product WHERE productid = #{productid};")
	public Product        queryProductByID        (@Param("productid") byte[] productid);
	
	@Select ("SELECT productname FROM product WHERE productid = #{productid};")
	public String         querynameByID           (@Param("productid")byte[] productid);
	
	
	@Select ("SELECT BIN_TO_UUID(productid) as productid FROM `product` WHERE USERNAME=#{username} ORDER BY ctime DESC LIMIT 1;")
	public String         queryNewId(String username);
	
	@Insert ("INSERT INTO PRODUCT(productid,username,productname,price,quantity,firstboximg,productpage,category) VALUES(#{productid},#{username},#{productname},#{price},#{quantity},#{firstboximg},#{productpage},#{category});")
	public int            insert(Product product);
	
	
}
















