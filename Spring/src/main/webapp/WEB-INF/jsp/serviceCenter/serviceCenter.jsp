<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  request.setCharacterEncoding("utf-8"); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
    String username = (String)session.getAttribute("username"); 
	   if((username=="null")||(username==null)) { username=""; } %>
<html>

	<head>
		<style>
		    *          { font-family: 微软雅黑; }
		    .topinfor  { font-size: 18px; 
		                 font-weight: 300;}
		    .topbox    { height:30px; }
		    .titlebox  { height:30px; }
		    #corebox   {    align:center; 
			    			height: 200px;
			    			text-align: center;
			    			vertical-align: middle;
		              }
		    div table {
		      position: relative;
		      margin-top: 10px;
			  text-align: center;
			  vertical-align: top;
			  margin-left: auto;
  			  margin-right: auto;
			}
		    div {
			  text-align: center;
			  vertical-align: middle;
			  margin-left: auto ;
  			  margin-right: auto ;
			}
  		</style>
	</head>
	
	<body>
		
		<div>
			<table class="topbox"><tr><td>
				<span class="topinfor">你好  <%=username%>&nbsp; 欢迎来到客户服务中心 </span>
					<a href="<%=basePath%>">返回主页</a>
			</td></tr></table>
		</div>
		
		<div>
			<table class="titlebox" >
				<tr><td>
				</td></tr>
			</table>
		</div>
		
		<div>
			
			<table >
			
				<% Map<String,List<String>> functionMap   = (Map<String,List<String>>)request.getAttribute("serviceCenterFunctionMap"); 
				   Set<String>              functionSet   =  functionMap.keySet  ();
				   //functionSet.toArray(a)
				   
				   Iterator                 iternames     =  functionSet.iterator();
				   int                      maxcol        =  6;
				   for ( int i = 0 ; iternames.hasNext() ; i++ ) {
					   String       functionname = (String)iternames.next();
					   List<String> functionlist =  functionMap.get(functionname);%>
						<%if(i%(maxcol+1)==0){%><tr><%}%>
						
						<td width="50"></td>
						<td id="corebox">
							<!-- 1.link address -->
							<a href="<%=basePath%><%=functionlist.get(0)%>">
								<!-- 2.img address -->
								<img src="<%=basePath%><%=functionlist.get(1)%>" width="100"/><br />
								<!-- 3.letter content -->
								<%=functionlist.get(2)%>
							</a>
						</td>
					<%if((i%maxcol==0)&&(i/maxcol>=1)){%>
						<td width="50"></td></tr>
					<%}%>
					
				<%}%>
			</table>
			
		</div>
		

		
	</body>
	
</html>