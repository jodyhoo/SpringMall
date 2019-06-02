<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta    http-equiv="Content-Type" 
         content="text/html; charset=UTF-8">
         
<title>Insert title here</title>

</head>
	<body>
	</body>
	
	<body>
	
	<script type="text/javascript">
		
		function ajaxFunction() {
		 var xmlHttp;
		 
		 try{
		   // Firefox, Opera 8.0+, Safari
		    xmlHttp=new XMLHttpRequest();
		 } catch (e) {
			
			  // Internet Explorer
			  try{
			      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			  } catch (e)  {
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			         } catch (e) {
				         alert("您的浏览器不支持AJAX！");
				         return false;
			         }
			      }
		    }
		 }
	</script>
		
		<form name="myForm">
			用户: <input type="text" name="username" />
			时间: <input type="text" name="time" />
		</form>
		
	</body>

</html>