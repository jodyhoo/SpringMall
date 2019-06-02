<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored ="false"%>
<%@ taglib uri         ="http://www.springframework.org/tags/form"
           prefix      ="form" %>
<%  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="refresh"      content="5 ; <%=basePath%>">
		<title>Insert title here</title>
		<style>
			/******** basic part. ********/
		    *            { font-family     : 微软雅黑; }
			.unline      { text-decoration : none; 
						   color           : #000;  }
			.page { 
					position: relative;
					display : block;
			        margin  : 0 auto;
			        margin-top : 30px;
			        height  : 600px;
			        width   : 600px; 
			        border  :   0px solid #e6e6e6;
			        border-radius: 5px;
			        box-shadow: 0px 0px 10px #e6e6e6;
				  }
			.core{
			    	position    : absolute;
			    	margin-left :  50px;
			    	margin-top  : 100px;
			    	height      : 250px;
			    	width       : 500px;
				  	text-align: center;
				  	border         : 0px solid #222;  
			}
		</style>
	</head>
	
	<body>
	
		<div class="page">

			<div class="core">
				
				<h3>你好  <%=session.getAttribute("username")%>  ${title}</h3>
				<h4><img height="18" src="<%=basePath%>/img/tinyicon/admin/return.png">&nbsp;5秒后自动跳转回主页</h4>
				<a class="unline" href="<%=basePath%>">如无响应，请点击此处返回主页</a>
				
			</div>
		
		</div>

	</body>
	
</html>

