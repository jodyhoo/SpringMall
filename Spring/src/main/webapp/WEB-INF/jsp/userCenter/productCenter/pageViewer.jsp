<%@ page language    ="java" 
         contentType ="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8"); 
    String basePath       = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
    String productPageURL = (String)session.getAttribute("productPageURL"); 
    if((productPageURL=="null")||(productPageURL==null)) { productPageURL=""; } %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<script src="<%=basePath%>/js/jQuery 3.3.1.js"></script>
		<style>
			* { font-family: 微软雅黑; }
			.productPage { width:1000px; 
						   margin: 0 auto;
						   padding:10px;
						   overflow-x:hidden;
						 }
		    .outerdiv    { width:1100px; 
		    			   border: 1px solid #969696; 
		    			   margin: 0 auto;
		    			   position: relative;
		                   }
		     .center    {  text-align: center;
		                   margin: 0 auto; }
		</style>
	</head>
	
	<body>
			
			<div class="center">
				<a class="center" href="<%=basePath%>/userCenter/addProduct"  >
					<button class="center">返回</button>
				</a>
			</div>
			
			<div class="outerdiv" >
				<div id="productPage" class="productPage"><%=productPageURL%></div>
			</div>
			
			<div class="center">
				<a class="center" href="<%=basePath%>/userCenter/addProduct"  >
					<button class="center">返回</button>
				</a>
			</div>
			
	</body>
	
</html>


