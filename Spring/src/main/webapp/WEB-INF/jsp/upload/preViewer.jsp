<%@ page language    ="java" 
		 contentType ="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"
         import      ="java.util.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<style>
		    * { font-family: 微软雅黑; }
		    div {
			  text-align: center;
			  vertical-align: middle;
			  margin-left: auto ;
  			  margin-right: auto ;
			}
			.outersize{ height:800px; width:1000px; overflow:auto; border:1px solid #EEE;}
			bottomedge { margin-bottom: 20px; }
		</style>
	</head>
	
	<body>
		
		<% String username = (String)session.getAttribute("username"); 
		   if(username==null) { username=""; } %>
		
		<div>
			<h3><%=username%> 的展示</h3>
			<a href="<%=basePath%>">返回主页</a>
		</div>
		
		<div>
			<% List<String> tempimg = (List<String>)session.getAttribute("tempimg"); 
			   Iterator     itera   =  tempimg.iterator();
			   while(itera.hasNext()) {
			 	   String imgPath = (String)itera.next();
			 %>
			<img src="<%=imgPath%>"/><br />
			<% } %>
		</div>
		
		<div class="bottomedge">
			<button>确定页面</button>
		</div>
		
		<br />
		
	</body>
	
</html>



