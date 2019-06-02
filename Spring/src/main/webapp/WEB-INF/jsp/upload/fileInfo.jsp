<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored ="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
		    *     { font-family: 微软雅黑; }
		</style>
	</head>
	
	<body>
		
		<h3>请选择上传文件</h3>
		
		<form action ="uploadfile"
		      method ="POST"
		      enctype="multipart/form-data">
		    <input type="file"   name ="file"   multiple/>
		    <input type="submit" value="SUBMIT"         />
		</form>
		
		
	</body>
	
</html>