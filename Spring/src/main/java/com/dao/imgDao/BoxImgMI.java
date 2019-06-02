package com.dao.imgDao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bean.BoxImg;

public interface BoxImgMI {
	
	@Select ("select  code , boximg , boximgsmall  from boximg where PRODUCTID=#{productid}")
	public    List<BoxImg>       queryImg(String username);
	
	@Insert ("INSERT  INTO           boximg( productid ,code,boximg,boximgsmall) VALUES(#{productid},#{code},#{boximg},#{boximgsmall});")
	public    int                insert(BoxImg boximg);
	
	@Select ("SELECT  boximgsmall           FROM boximg WHERE productid =  UUID_TO_BIN(#{productid}) AND CODE = 0;")
	public    String             queryFirstBoxImgsmallByID       ( @Param("productid") String productid );
	
	@Select ("SELECT  boximgsmall           FROM boximg WHERE productid =  UUID_TO_BIN(#{productid});")
	public    List<String>       queryAllBoxImgsmallByID         ( @Param("productid") String productid );
	
	@Select ("SELECT  *                     FROM boximg WHERE productid =  UUID_TO_BIN(#{productid});")
	public    List<BoxImg>       queryBoxImgByID                 ( @Param("productid") String productid );
	
	@Select ("SELECT boximg.productid as productid , code , boximg , boximgsmall  FROM boximg INNER JOIN product ON boximg.productid = product.productid WHERE product.username = #{username} LIMIT 16 ;")
	public    List<BoxImg>       queryBoxImgByUsername           ( @Param("username") String username );
	
	@Update ("UPDATE boximg SET boximgsmall220 = #{boximgsmall220} WHERE productid = #{productid} AND CODE = #{code};")
	public    int                updateBoxImgSmall220ByID        ( @Param("boximgsmall220") String boximgsmall220 , @Param("productid") byte[] productid , @Param("code") int code );
	
	@Select ("SELECT boximg.productid , boximg.code , boximg.boximg , boximg.boximgsmall FROM boximg INNER JOIN product ON boximg.productid = product.productid WHERE product.username = #{username} AND boximg.`code` = 0;")
	public    List<BoxImg>       queryFirstBoxImgByUsername      ( @Param("username") String username );
	
	@Select ("SELECT boximg.boximg FROM boximg INNER JOIN product ON boximg.productid = product.productid WHERE product.username = #{username} AND boximg.`code` = 0;")
	public    List<String>       queryFirstBoxImgsmallByUsername ( @Param("username") String username );
	
	
	
	/*
	@Select ("SELECT boximg FROM boximg INNER JOIN product ON boximg.productid = product.productid WHERE product.username = #{username} AND boximg.code = 0 ORDER BY boximg.ctime DESC;")
	public    List<String>       queryAllFirstBoxImgByUsername   ( @Param("username") String username );
	*/
	
	
	
	
}





