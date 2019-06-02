<%@ page   language    ="java" 
           contentType ="text/html; charset=UTF-8"
           pageEncoding="UTF-8"
           isELIgnored ="false"%>
<%@ taglib uri         ="http://www.springframework.org/tags/form"
           prefix      ="form" %>
<%  request.setCharacterEncoding("utf-8"); %>
<%  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	
	<head>
		<title>登陆</title>
		<style>
			* { font-family: 微软雅黑; }
			.formname {
						height :  20px; 
						width  :  80px; 
						font-size : 18px;
			          }
			.formsmallname {
							height :  16px; 
							width  :  80px; 
							font-size : 16px;
						   }
			.page { 
					display : block;
				    position: relative;
			        margin  : 0 auto;
			        margin-top : 30px;
			        height  : 600px;
			        width   : 600px; 
			        border  :   0px solid #e6e6e6;
			        border-radius: 5px;
			        box-shadow: 0px 0px 10px #e6e6e6;
				  }
			.core {
					display     : block;
				    position    : relative;
				    float       : left;
			        margin-left : 100px;
			        margin-top  : 30px;
			        height      : 300px;
			        width       : 400px;
			        border      : 0px solid #e6e6e6;
			      }
			.home {
					display     : block;
				    position    : relative;
				    margin      : 0 auto;
				    text-align  : center;
				    font-size   : 16px;
				    color       : #000;
				    text-decoration: none;
				  }
			.title{
					display : block;
				    position: relative;
			        margin  : 0 auto;
			        font-weight: 800;
			        text-align: center;
			        font-size: 20px;
			        font-weight: 800px;
			        height      : 30px;
			        width       : 400px;
				  }
			.mainbox {
			        height      : 300px;
			        width       : 400px;
					 }
			.message {
				        height      : 80px;
				        width       : 200px;
					 }
			.textbox {
				        height      : 30px;
				        width       : 400px;
				        font-size   : 18px;
				        border-radius: 5px;
				        border       : 1px solid #e6e6e6;
					 }
			.submitbox {
				        height      : 30px;
				        width       : 400px;
					   }
			.userboxselect {
				        height      : 30px;
				        width       : 400px;
				        border-radius: 5px;
				        border       : 1px solid #e6e6e6;
				        box-shadow   : 0px 0px 12px #66e0ff;
					 }
			.pswdboxout {
				        height      : 30px;
				        width       : 400px;
				        border-radius: 5px;
				        border       : 1px solid #e6e6e6;
					    }
			.pswdboxuse {
				        height      : 30px;
				        width       : 400px;
				        font-size   : 18px;

				        border-bottom-right-radius: 0px;
				        border-bottom-left-radius: 0px;

				        border-top-right-radius: 5px;
				        border-top-left-radius: 5px;

				        border-top    : 1px solid #e6e6e6;
				        border-left   : 1px solid #e6e6e6;
				        border-right  : 1px solid #e6e6e6;
				        border-bottom : 0px solid #e6e6e6;
					   }  
			.showpswd  {  
				        height      : 18px;
				        width       : 400px;

				        border-top-right-radius: 0px;
				        border-top-left-radius: 0px;

				        border-bottom-right-radius: 5px;
				        border-bottom-left-radius: 5px;

				        border-top    : 0px;
				        border-left   : 1px solid #e6e6e6;
				        border-right  : 1px solid #e6e6e6;
				        border-bottom : 1px solid #e6e6e6;
					   }  
			.pageinfor {
						display     : block;
					    position    : relative;
					    float       : left;
					    margin-top  : 200px;
					    margin-left : 50px;		
					    text-align  : center;
				        font-size   : 12px;
				        	
				        height      : 30px;
				        width       : 500px;
				        border      : 0px solid #e6e6e6;
					   }
			.bottominfor {
							font-size: 12px;
						 }
			.textboxover{ 
				animation-name     : textboxover;
				animation-duration : 0.3s;
				box-shadow: 0px 0px  5px #00aaff;
			}
			.textboxout { 
				animation-name     : textboxout;
				animation-duration : 0.3s;
				box-shadow: 0px 0px  0px #00aaff;
			}
			.textboxblur {    
				animation-name     : textboxblur;
				animation-duration : 0.3s;
				box-shadow: 0px 0px 0px #00aaff;
			}
			.textboxfocus{ 
				animation-name     : textboxover;
				animation-duration : 0.3s;
				box-shadow: 0px 0px 10px #00aaff;
			}
			@keyframes textboxover {
				from   { box-shadow: 0px 0px  0px #00aaff; }
				to     { box-shadow: 0px 0px  5px #00aaff; }
			}
			@keyframes textboxout {
				from   { box-shadow: 0px 0px  5px #00aaff; }
				to     { box-shadow: 0px 0px  0px #00aaff; }
			}
			@keyframes textboxblur {
				from   { box-shadow: 0px 0px 10px #00aaff; }
				to     { box-shadow: 0px 0px  0px #00aaff; }
			}
			@keyframes textboxfocus {
				from   { box-shadow: 0px 0px  5px #00aaff; }
				to     { box-shadow: 0px 0px 10px #00aaff; }
			}
		</style>
	</head>

	<body>

		<div class="page">
			

			<div class="core">

				<div  ><a class="home" href="<%=basePath%>">返回主页</a></div>
				
				<div class="title">账户登陆</div>

				<table class="mainbox" border = "0">
					<form:form action     ="/Spring/login"
					           method     ="POST" 
					           modelAttribute="userlog"
					           >
					    <tr>
					    <td   class="message">
					    <form:errors    style="color:#c11;" path="*" />
					    <span           style="color:#c11;"   >${message}</span>
					    <span           style="color:#008000;">${success}</span>
					    </td></tr>

					    <tr>
					    <td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/account.png">&nbsp;账户  : </td>
					    </tr>
						
						<tr>
					    <td colspan="2">
						    <form:label  path ="username" />
						    <form:input  type="text" class="textbox" name="username" id="username"
						    			 value=""
						                 path ="username" />
					    </td>
					    </tr>

					    <tr><td class="formname"></td><tr>

					    <tr>
					    <td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/pswd.png">&nbsp;密码  : </td>
					    </tr>

					    <tr>
					    <td>
						    <form:label  path ="password" />
						    <form:input  type="password" class="textbox" name="password" id="password"
						                 path ="password" /><br />
						    <div         class="showpswd"   id="showpswd"></div>
					    </td>
					    </tr>
					    
					    <tr>
					    <td class="formsmallname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/showpswd.png">&nbsp;显示密码
					    	<input type="checkbox" class="pswdcheck" name="pswdcheck" id="pswdcheck" value=""/>
					    	</td>
					    </tr>

					    <tr><td class="formname"></td><tr>

					    <tr>
					    	<td align="left" colspan="2">
					    		<input type="submit" class="submitbox" id="submit" name="submit" value="提交" />
					   		</td>
					    </tr>
					    
					</form:form>
					    <tr>
					    	<td align="right"       colspan="3">
					    	<a  class="bottominfor" href="">忘记密码</a>&nbsp;</td>
					    </tr>
				</table>

			</div>

			<div class="pageinfor"><a  class="bottominfor" href="">法律声明</a>&nbsp;<br /> yourstore copyright 2018 coporation</div>

			
		</div>

		<script>

			var username  = document.getElementById('username');

			var boxover   = function(event) {
				console.log( 'over!' );
				if( (username.className == 'textbox textboxout')||
					(username.className == 'textbox') )
				     username.className =  'textbox textboxover';
			}
			var boxout    = function(event) {
				console.log( 'over!' );
				if(username.className == 'textbox textboxover')
				   username.className =  'textbox textboxout';
			}
			var boxfocus  = function(event) {
				console.log( 'focus!' );
				username.className = 'textbox textboxfocus';
			}
			var boxblur   = function(event) {
				console.log( 'blur!' );
				username.className = 'textbox textboxout';
			}	
				username.addEventListener( 'mouseover' , boxover  , false );
				username.addEventListener( 'mouseout'  , boxout   , false );
				username.addEventListener( 'focus' 	   , boxfocus , false );
				username.addEventListener( 'blur'      , boxblur  , false );

			var showpswd  = document.getElementById('showpswd' );
				showpswd.style.display='none';

			var pswdcheck = document.getElementById('pswdcheck');

			var password  = document.getElementById('password' );

			var changepswd = function(event) {
				showpswd.innerHTML = password.value;
			}

			var inpaswd = function(event) {

					  changepswd();

				if  ( pswdcheck.checked == false        ) showpswd.style.display ='none';
				else                                      showpswd.style.display ='block';

				if ( ( password.className == 'textbox'              )||
					 ( password.className == 'textbox textboxout'   )||
					 ( password.className == 'textbox textboxfocus' ) )
				       password.className  = 'pswdboxuse';
				else   password.className  = 'textbox'   ;
			}


			var pswdover   = function(event) {
			 	     console.log( 'over -- ' );
				if( (password.className == 'pswdboxuse') || 
					(password.className == 'pswdboxuse textboxout' ) )
			    	 password.className =  'pswdboxuse textboxover';
				else 
				if( (password.className == 'textbox textboxout')||
					(password.className == 'textbox'   ) )
				     password.className =  'textbox textboxover';
			}
			var pswdout    = function(event) {
				     console.log( 'out!' );
				if( (password.className == 'textbox textboxover') || 
					(password.className == 'textbox'   ) )
				     password.className =  'textbox textboxout';
				else
				if  (password.className == 'pswdboxuse textboxover')
				     password.className =  'pswdboxuse textboxout';				 
			}


			var pswdfocus  = function(event) {
				console.log( 'focus!' );
				if( (password.className == 'pswdboxuse textboxover') )
					 password.className =  'pswdboxuse textboxfocus';
				else 
				if( (password.className == 'textbox textboxover') )
					 password.className =  'textbox textboxfocus';
			}
			var pswdblur   = function(event) {
				console.log( 'blur -- ' );
				if( (password.className == 'pswdboxuse textboxfocus') )
					 password.className =  'pswdboxuse textboxout';
				else 
				if( (password.className == 'textbox textboxfocus') )
					 password.className =  'textbox textboxout';
			}	

				password.addEventListener( 'mouseover' , pswdover   , false );
				password.addEventListener( 'mouseout'  , pswdout    , false );
				password.addEventListener( 'focus' 	   , pswdfocus  , false );
				password.addEventListener( 'blur'      , pswdblur   , false );

				pswdcheck.addEventListener( 'change'   ,   inpaswd  , false );
				password.addEventListener ( 'keyup'  , changepswd , false );

		</script>

	</body>

</html>


