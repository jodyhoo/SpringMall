<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta    http-equiv  ="Content-Type" 
         content     ="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%  %>
		
		<h3>Ajax Request</h3>
		
		<form method="POST">
			<textarea style    ="width:100px; height:100px; resize:none;" 
			          maxlength="50" 
			          cols     ="num" 
			          rows     ="num"
			          name     ="msg"></textarea>
			<input type="text"     style="width:200px;"      name="username" value=""/><br />
			<input type="password" style="width:200px;"      name="password" value=""/>
			<input type="button"   onclick="ajaxrequest();" name="ok"       value="OK"/>
		</form>
		
		<script language="javascript" type="text/javascript">
		
			var ajaxrequest;
			
			function initajax() {
				//IE
				//try {
					/*	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					             这句话是一般是为IE浏览器创建建ajax引擎的，IE不支持所有要先创建，前面会有个判断语句，支持Ajax的浏览器就不需要创建，要判断下的  
						
						这行简单的代码在 Mozilla、Firefox、Safari、Opera 以及基本上所有以任何形式或方式支持 Ajax 的非 Microsoft 浏览器中，
						创建了 XMLHttpRequest 对象。但是对于市场占有率达到70%的IE来说，这种方法是不行的，而不同的IE版本还有不同的创建方法，
						所以我们需要在IE下面使用下面两种创建对象的办法：
					 */
					//针对较新的浏览器
					
					/*
					ajaxrequest = new ActiveXObject("Msxml2.XMLHTTP");
					document.write( "<span style=\"color:#C11;\">Browser is New Version Internet Explorer.</span>");
				} catch (e) {
					*/
					
				var iemark =false;
				var newversion;
				var ieversion;
				//针对较老的浏览器
				
	            var versions=
	            ['Microsoft.XMLHTTP' ,'MSXML.XMLHTTP'     ,'Msxml2.XMLHTTP.7.0','Msxml2.XMLHTTP.6.0',
	             'Msxml2.XMLHTTP.5.0','Msxml2.XMLHTTP.4.0','MSXML2.XMLHTTP.3.0','Msxml2.XMLHTTP'    ];
				
	            for(var i=0; i < versions.length; i++){
	                try{
	                	//document.write( "attempt version : " + versions[i] + "<br />" );
	                	ajaxrequest = new ActiveXObject(versions[i]);
	                	
	                	//document.write( "Browser Support." + "<br />" );
	                	iemark = true;
	                	if ( versions[i] == "Msxml2.XMLHTTP" ) {
	                		niemark=true;
	                	} else {
	                		ieversion = versions[i];
	                	}
	                }catch(e){
	                	//document.write( "Error Occurs." + "<br />" );
	                }
	            }
	            
	            if(iemark) {
	            	if(niemark=true) {
	            		document.write( "<span style=\"color:#C11;\">Browser is New Internet Explorer.</span>" + "<br />" );
	            		ajaxrequest =  new ActiveXObject("Msxml2.XMLHTTP");
	            	} else {
	            		document.write( "<span style=\"color:#C11;\">Browser is Old Internet Explorer.</span>" + "<br />" );
	            		ajaxrequest =  new ActiveXObject(ieversion);
	            	}
	            } else {
					//document.write( "Browser is not Internet Explorer." + "<br />" );
					try {
						ajaxrequest = new XMLHttpRequest();
						document.write( "<span style=\"color:#C11;\">Browser Version is Opera8.0+ , FireFox , Safari.</span>" + "<br />" );
					} catch (e) {
						document.write( "<span style=\"color:#C11;\">no such a browser support.</span>" + "<br />" );
					}
	            } 
		         
			}
			
			initajax();
			
		</script>
		
		
		<p name="a"></p>
		<p name="b"></p>
		<p name="c"></p>
		<p name="d"></p>
		<p name="e"></p>
		<p name="f"></p>
		
		
		<script>
		</script>
		
		
</body>
</html>

































