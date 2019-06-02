package com.dao.productPageDao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bean.BoxImg;

public interface ProductPageMI {
	
	@Select ("select  code , boximg , boximgsmall  from boximg where PRODUCTID=#{productid}")
	public List<BoxImg> queryImg(String username);
	
	@Insert ("INSERT INTO boximg( productid ,code,boximg,boximgsmall) VALUES(#{productid},#{code},#{boximg},#{boximgsmall});")
	public int insert(BoxImg boximg);
	
}
