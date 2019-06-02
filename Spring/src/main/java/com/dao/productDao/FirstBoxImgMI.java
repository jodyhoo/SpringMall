package com.dao.productDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bean.FirstBoxImg;


public interface FirstBoxImgMI {
	
	@Select ("SELECT productid , firstboximg , productname , price  FROM product WHERE category IN ( SELECT category FROM product WHERE productid = #{productid} ) ORDER BY value DESC LIMIT 7;")
	public List<FirstBoxImg> queryRecommand7ProductsByID( @Param("productid") byte[] productid );
	
}















