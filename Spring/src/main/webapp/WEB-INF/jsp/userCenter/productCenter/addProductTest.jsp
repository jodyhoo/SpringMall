<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%  request.setCharacterEncoding("utf-8"); 
    String  basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
    
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		
		<style>
		
			.bu 				 {	
									height : 200px;
									width  : 200px;
									border-radius: 5px;
									box-shadow: 0px 0px 15px #888;
									color : #eee;
									background-color: #eee;
									background-image : url( "http://localhost:8080/Spring/img/default/productCenter/addProduct/upload.png" );
								}

			.bub 		   	    { 	
									height : 200px;
									width  : 200px;
									border-radius: 5px;
									box-shadow: 0px 0px 15px #888;
									color : #eee;
									background-image : url( "<%=basePath%>/img/default/productCenter/addProduct/addimage_icon.png" );
								}


			label				{
								    display: block;
						    	}

			input[type="file"]  {   display: none;	 }

		</style>

	
	</head>
	
	
		<body>
			
			 <label class="bu">
			    <input type="file" id="file" multiple="true"/>
			 </label> 
			 
			 <label class="bub">
			    <input type="file" id="file" multiple="true"/>
			 </label> 
			 	
			<input type="file" class="bu" value="选择文件" />
			
			<a href="">AAA</a>
			
		</body>
		
		
		
	</html>