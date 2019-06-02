<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
		    *     { font-family: 微软雅黑; }
		    topinfor  { font-size: 20px; 
		                font-weight: 600;}
		    shadow { box-shadow : 0px 0px 12px #222; }
		    div  {
			  text-align: center;
			  vertical-align: top;
			  margin-left: auto ;
  			  margin-right: auto ;
			}
		</style>
	</head>
	
	<body>
		
		<% String username = (String)session.getAttribute("username"); 
		   if((username=="null")||(username==null)) { 
			   username=""; 
		   } %>
		
		<div>
			<span class="topinfor">你好  <%=username%>&nbsp;</span>
				<a href="<%=basePath%>">返回主页</a>
			
		</div>
		
		<div>
			
			<h3>请选择上传文件</h3>
			
			<form action ="uploadfile"
			      method ="POST"
			      enctype="multipart/form-data">
			    <input type="file"   name ="file"   multiple/>
			    <input type="submit" value="SUBMIT"         />
			</form>
		
		</div>
		
	</body>
	
</html>
































