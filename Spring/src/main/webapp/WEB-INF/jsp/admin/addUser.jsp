<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  request.setCharacterEncoding("utf-8"); %>
<%  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>注册用户</title>
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
			.gap      {
						height :  10px; 
					  }
			.page { 
					display : block;
				    position: relative;
			        margin  : 0 auto;
			        margin-top : 30px;
			        margin-bottom: 30px;
			        height  : 900px;
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
			.pswdbox {
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
					    margin-top  : 500px;
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

				<div ><a class="home" href="<%=basePath%>">返回主页</a></div>
				
				<div class="title">创建账户</div>

				<table class="mainbox" border = "0">
				<form:form action     ="/Spring/addUser"
				           method     ="POST" 
				           modelAttribute="user"
				           >
					    <tr>
					    <td   class="message">
					    <form:errors    style="color:#c11;" path="*" />
					    <div            style="color:#c11;"   >${message}</div>
					    <div            style="color:#008000;">${success}</div>
					    </td></tr>

					    <tr>
					    <td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/account.png">&nbsp;账户  : </td>
					    </tr>
					    
						<tr>
					    <td>
						    <form:label  path ="username"                  />
						    <form:input  type="text" class="textbox" name="username" id="username" path ="username" />
					    </td>
					    </tr>

					    <tr><td class="gap"></td><tr>

					    <tr>
					    	<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/pswd.png">&nbsp;密码  : </td>
					    </tr>

					    <tr>
					    <td>
						    <form:label  path ="password" />
						    <form:input  type="password" class="pswdbox" name="password" id="password" path ="password" />
						    <div         class="showpswd"   id="showpswd"></div>
					    </td>
					    </tr>
					    
					    <tr>
					    <td class="formsmallname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/showpswd.png">&nbsp;显示密码
					    	<input type="checkbox" class="pswdcheck" name="pswdcheck" id="pswdcheck" value=""/>
					    	</td>
					    </tr>

					    <tr><td class="gap"></td><tr>

					    <tr>
					   		<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/name.png">&nbsp;性  : </td>
					    </tr>

					    <tr>
					    	<td>
						    <form:label  path ="firstname" />
						    <form:input  type="text" class="textbox" name="firstname" id="firstname" path ="firstname" />
						    </td>
					    </tr>

					    <tr><td class="gap"></td><tr>

					    <tr>
					    	<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/name.png">&nbsp;名  : </td>
					    </tr>
						
					    <tr>
					    	<td>
						    <form:label  path ="lastname" />
						    <form:input  type="text" class="textbox" name="lastname" id="lastname" path ="lastname" /></td>
					    </tr>

					    <tr><td class="gap"></td><tr>

					    <tr>
					    	<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/phone.png">&nbsp;电话号码 : </td>
					    </tr>

					    <tr>
					    	<td>
						    <form:label  path ="phone" />
						    <form:input  type="text" class="textbox" name="lastname" id="phone" path ="phone" />
					    	</td>
					    </tr>

					    <tr><td class="gap"></td><tr>

					    <tr>
					    	<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/admin/email.png">&nbsp;Email : </td>
					    </tr>

					    <tr>
					    	<td>
						    <form:label  path="email" />
						    <form:input  type="text" class="textbox" name="email" id="email" path ="email" />
					    	</td>
					    </tr>

					    <tr><td class="gap"></td><tr>

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

			var textbox  = document.getElementsByClassName('textbox');

			var boxover   = function(event) {
				console.log( 'over!' );
				if( (event.target.className == 'textbox textboxout')||
					(event.target.className == 'textbox') )
				     event.target.className =  'textbox textboxover';
			}
			var boxout    = function(event) {
				console.log( 'over!' );
				if(event.target.className == 'textbox textboxover')
				   event.target.className =  'textbox textboxout';
			}
			var boxfocus  = function(event) {
				console.log( 'focus!' );
				event.target.className = 'textbox textboxfocus';
			}
			var boxblur   = function(event) {
				console.log( 'blur!' );
				event.target.className = 'textbox textboxout';
			}

			for( var i = 0 ; i < textbox.length ; i++ ) {
				textbox[i].addEventListener( 'mouseover' , boxover  , false );
				textbox[i].addEventListener( 'mouseout'  , boxout   , false );
				textbox[i].addEventListener( 'focus' 	 , boxfocus , false );
				textbox[i].addEventListener( 'blur'      , boxblur  , false );
			}



			var showpswd   = document.getElementById('showpswd' );
				showpswd.style.display='none';

			var pswdcheck  = document.getElementById('pswdcheck');

			var password   = document.getElementById('password' );

			var changepswd = function(event) {
				showpswd.innerHTML = password.value;
			}

			var inpaswd    = function(event) {

					  changepswd();

				if  ( pswdcheck.checked   == false     ) showpswd.style.display ='none';
				else                                     showpswd.style.display ='block';

				if ( ( password.className == 'pswdbox'              )||
					 ( password.className == 'pswdbox textboxout'   )||
					 ( password.className == 'pswdbox textboxfocus' ) )
				       password.className  = 'pswdboxuse';
				else   password.className  = 'pswdbox'   ;
			}



			var pswdover   = function(event) {
			 	     console.log( 'over -- ' );
				if( (password.className == 'pswdboxuse') || 
					(password.className == 'pswdboxuse textboxout' ) )
			    	 password.className =  'pswdboxuse textboxover';
				else 
				if( (password.className == 'pswdbox textboxout')||
					(password.className == 'pswdbox'   ) )
				     password.className =  'pswdbox textboxover';
			}
			var pswdout    = function(event) {
				     console.log( 'out!' );
				if( (password.className == 'pswdbox textboxover') || 
					(password.className == 'pswdbox'   ) )
				     password.className =  'pswdbox textboxout';
				else
				if  (password.className == 'pswdboxuse textboxover')
				     password.className =  'pswdboxuse textboxout';				 
			}


			var pswdfocus  = function(event) {
				console.log( 'focus!' );
				if( (password.className == 'pswdboxuse textboxover') )
					 password.className =  'pswdboxuse textboxfocus';
				else 
				if( (password.className == 'pswdbox textboxover') )
					 password.className =  'pswdbox textboxfocus';
			}
			var pswdblur   = function(event) {
				console.log( 'blur -- ' );
				if( (password.className == 'pswdboxuse textboxfocus') )
					 password.className =  'pswdboxuse textboxout';
				else 
				if( (password.className == 'pswdbox textboxfocus') )
					 password.className =  'pswdbox textboxout';
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
