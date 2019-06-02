<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  
	request.setCharacterEncoding("utf-8"); 

	String basePath         =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
   
    String 						 username = 
   (String)session.getAttribute("username"); 
    
						    if( (username== "null")||
							    (username==  null ) ) 
						      {  username="";       }  
	   
	   
	String                        cartquantity   = 
   (String)session.getAttribute( "cartquantity" );
	
	   						if(  (cartquantity=="null")||
	   							 (cartquantity== null)) 
	   						  {   cartquantity= "0";  } 	
 %>

<!DOCTYPE html>
<html>
	
	<head>
	
		<title>应用中心</title>	
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script src="<%=basePath%>/js/jQuery/jquery-3.2.1.js"></script>
		
		<style>
		
			/******** basic part. ********/
			*            { font-family     : 微软雅黑; }
			body         { margin          : 0;     }
			.unline      { text-decoration : none; 
						   color           : #000;  
						   cursor          : pointer;
						 }

			/******** title part. ********/
			.top         {   
							 position        : relative; 
							 top             :  0px; 
							 height          : 90px; 
							 min-width           : 1300px;
							 display         : block;
							 border-bottom   : 1px solid #eee; 
						   }

			.topcore      { 
							 position        : relative;
							 margin          : 0 auto;
							 height          : 80px;   
							 width           : 1300px;
							 display         : block;
							 border          : 0px solid #eee;
						   }

			/* logo part.*/
			.logoblock     {  
							     position:relative;
								 margin-top : 13px;
								 margin-left: 50px;
				                 height  : 53px;
				             	 width   : 130px; 
				             	 float   : left;
								 color      : #e8d57c;
								 text-align : center;
								 border     : 0px solid #eee;
			               }

			.index         {
								 position:relative;
								 margin-top : 21px;
								 margin-left: 90px;
								 margin-right: auto;
								 height  : 35px;
								 float   : left;
								 display: block;
								 vertical-align : middle;
								 text-align     : center;
			 			    }


			/* index form part. */
			.indexsubmit     {
							     height                    : 34px; 
							     width                     : 45px; 
							     border-top-right-radius   :  5px;
					             border-bottom-right-radius:  5px;
					             font-size                 : 18px;
					             background                : #fff;
					             border-left               : 1px solid #fff;
					             border-right              : 1px solid #a6a6a6;
					             border-top                : 1px solid #a6a6a6;
					             border-bottom             : 1px solid #a6a6a6;
					             color                     : #111;
					             border                    : 1px solid #222;
			                 }
			.textbox 		 {
								 font-size                : 18px;
								 height                   : 30px; 
					             width                    : 500px; 
					             border-top               : 1px solid #a6a6a6;
					             border-bottom            : 1px solid #a6a6a6;
					             border-left              : 1px solid #a6a6a6;
					             border-right             : 0px solid #ccc; 
					             border-top-left-radius   : 5px;
					             border-bottom-left-radius: 5px;
							 }
			.textboxover{ 
				animation-name     : textboxover;
				animation-duration : 0.3s;
				box-shadow: 0px 0px  5px #999;
			}
			.textboxout { 
				animation-name     : textboxout;
				animation-duration : 0.3s;
				box-shadow: 0px 0px  0px #999;
			}
			.textboxblur {    
				animation-name     : textboxblur;
				animation-duration : 0.3s;
				box-shadow: 0px 0px 0px #999;
			}
			.textboxfocus{ 
				animation-name     : textboxover;
				animation-duration : 0.3s;
				box-shadow: 0px 0px 10px #999;
			}
			@keyframes textboxover {
				from   { box-shadow: 0px 0px  0px #999; }
				to     { box-shadow: 0px 0px  5px #999; }
			}
			@keyframes textboxout {
				from   { box-shadow: 0px 0px  5px #999; }
				to     { box-shadow: 0px 0px  0px #999; }
			}
			@keyframes textboxblur {
				from   { box-shadow: 0px 0px 10px #999; }
				to     { box-shadow: 0px 0px  0px #999; }
			}
			@keyframes textboxfocus {
				from   { box-shadow: 0px 0px  5px #999; }
				to     { box-shadow: 0px 0px 10px #999; }
			}

			.topfunc       { 
								 margin-top      :   6px; 
				                 margin-left     :  20px; 
				                 font-size       :  16px; 
				                 float           :  left; 
				                 color           : #222;  
				                 height          :  72px; 
				                 width           : 400px; 
				                 border          :   0px solid #222;
			               }
			.username      {
								 font-weight     :    300;    }	
			.longname      {     font-size       :   14px;    }					
			.topbox        {
								 position        :  relative; 
								 clear           : left; 
								 margin-top      :   5px; 
				                 margin-left     :   2px; 
				                 font-size       :  16px; 
				                 color           : #222; 
				                 height          :  40px;
				                 min-width       : 100px;
				                 max-width       : 200px;
				                 border          :   0px solid #222;
						   }
			.funcbox       {
								 position        :  relative; 	
								 float           :    left; 			                 
								 height          :  70px;
				                 min-width       : 130px;
				                 max-width       : 180px;
				                 border          :   0px solid #c11;
						   }
			.sicon         {
								 margin-top      :   2px; 
								 float           :  left;
								 height          :  17px;
								 min-width       :  22px;
								 border          :   0px solid #222;
						   }
			.hellotext     {
								 position        :  relative; 	
								 float           :   left; 	
								 margin-top      :    8px; 
								 font-size       :   12px;
								 text-align      :   left;
						   }			   
			.licon         {
								 margin-top      :  2px; 
								 float           : left;
								 height          :  17px;
								 width           :  47px;
								 text-align      : center;
								 border          :   0px solid #222;
						   }	
			.carttext      {     position        : absolute;
							     bottom          :  0;
							     left            :  47px;       }			   		   
			.cartquantity  {
								 position        : absolute; 
								 margin-top      :     6px; 
				                 margin-left     :  18px; 
				                 text-align		 : center;
				                 font-size       :    16px;
				                 font-weight     :   800; 
				                 width           :    20px; 
						   }
			.cartquantityl {
								 position        : absolute;
								 margin-top      :     9px; 
				                 margin-left     :  18px; 
				                 text-align		 : center;
				                 font-size       :    12px;
				                 font-weight     :   300; 		
				                 width           :    20px;		
						   }
						   
			
			/*  */	
			.core           {
			    			 	position 	 : relative;
			    			 	margin       : 0 auto;
			    			 	margin-top   : 40px;
								height 		 : 500px;
								width 		 : 998px;
								border   	 : 0px solid #222;
							}
		    .iconbox 	    {    
			    			 	position 	 : relative;
			    			 	float    	 : left;
			    			 	margin-left  : 20px;
			    			 	margin-right : 20px;
			    			 	margin-top   : 30px;
				    			height		 : 130px;
				    			width        : 100px;
				    			text-align   : center;
				    			border       : 0px solid #222;
			    			}
		</style>

	</head>

	<body>
		
		<div class="top">

			<div class="topcore">

				<div class="logoblock">
					<a href="<%=basePath%>">
						<img src="<%=basePath%>/img/logo/toplogo.png"/>
					</a>
				</div> 
				
				<!-- 1.index part -->
				<div               class  = "index"> 
					<form          name   = "indexform" 
					               id     = "indexform"> 
						<div       style  = "float:left"> 
							<input type   = "text" 
							       name   = "indexbox" 
							       class  = "textbox" 
							       id     = "keyword"  /> 
						</div> 
						<div       style  = "float:left"> 
							<input type   = "button" 
							       class  = "indexsubmit" 
							       id     = "indexsubmit" 
							       value  = "&#128270;"/> 
						</div> 

					</form> 
					
				<!-- hidden input part. -->
				<input type="hidden" id="basePath" value="<%=basePath%>" />
				<input type="hidden" id="username" value="<%=username%>" />
				
				</div> 

				<!-- indexbox effect -->
				<script>
					/* get init value. */
					var basePath    = document.getElementById( 'basePath' ).value;
					
					var keyword     = document.getElementById('keyword');
					var indexsubmit = document.getElementById('indexsubmit');

					var boxover   = function(event) {
						console.log( 'over!' );
						if( (keyword.className == 'textbox textboxout')||
							(keyword.className == 'textbox') )
							 keyword.className =  'textbox textboxover';

						if( (indexsubmit.className == 'indexsubmit textboxout')||
							(indexsubmit.className == 'indexsubmit') )
						     indexsubmit.className =  'indexsubmit textboxover';
					} 
					var    boxout    = function(event) {
						   console.log( 'over!' );
						if(keyword.className    == 'textbox textboxover')
						   keyword.className    =  'textbox textboxout' ;

						if(indexsubmit.className == 'indexsubmit textboxover')
						   indexsubmit.className =  'indexsubmit textboxout';
					}
					var    boxfocus  = function(event) {
						   console.log( 'focus!' );
						   keyword.className = 'textbox textboxfocus';
						   indexsubmit.className = 'indexsubmit textboxfocus';
					}
					var    boxblur   = function(event) {
						   console.log( 'blur!' );
						   keyword.className = 'textbox textboxout';
						   indexsubmit.className = 'indexsubmit textboxout';
					}	
					
						   keyword.addEventListener( 'mouseover' , boxover  , false );
						   keyword.addEventListener( 'mouseout'  , boxout   , false );
						   keyword.addEventListener( 'focus' 	 , boxfocus , false );
						   keyword.addEventListener( 'blur'      , boxblur  , false );
						   
					
					// keyword box input. 
					function indexEnterDown (event) {
						if ( event.key       == "Enter") {
					         event.preventDefault();
					         window.location =   basePath+'/indexPage?'+'keyword='+encodeURI(encodeURI(keyword.value))+'&page=1';
					    }
					}
							 console.log( '' + basePath );
							 keyword.addEventListener(     'keydown'   , indexEnterDown , false );
					// submit button input. 
					function productPageLink(event) {
							 window.location  =  basePath+'/indexPage?'+'keyword='+encodeURI(encodeURI(keyword.value))+'&page=1';
					}
					
							 indexsubmit.addEventListener( 'mousedown'  , productPageLink , false );
						
				</script>
				
				<div class="topfunc">

					<div class="funcbox">
	
						<div class="topbox" >
						
							<div>
								<% if((username=="")||(username==null)||(username=="null")) {%>
							</div></div>
							
							<div class="topbox">
								<a class="unline" id="macc" name="login">
								<span class="sicon"></span>
								   <span class="sicon">
								   		<img height="18" src="<%=basePath%>/img/tinyicon/topinfo/account.png"/>
								   	</span>登陆账户
								</a>
							</div>
							
								<% }else{ %>
								<a style="cursor:pointer;" id="macc" name="quitacc"><span class="sicon"><img height="18" src="<%=basePath%>/img/tinyicon/topinfo/account.png"/></span>退出账户</a>
							</div>	
							
							<div>
								<div   class="sicon"></div>
								<div   class="hellotext">你好</div>
							</div>
							
						</div>
						
						<div class="topbox">
							<div><div   class="sicon"></div><div id="showusername" class="username" ><%=username%></div></div>
	  					</div> 
	  							<% } %>
						
					</div>
					
					<div class="funcbox">
						
						<a class="unline" href="<%=basePath%>/cart">
						
							<% if(cartquantity.length()<3) { %>
							<span class="cartquantity unline"  id="cartquantity" ><%=cartquantity%></span>
						  	<% } else { %>
							<span class="cartquantityl unline" id="cartquantityl" ><%=cartquantity%></span>
							<% } %>
							
							<div class="topbox"> 
									<span class="licon"><img height="40" src="<%=basePath%>/img/tinyicon/topinfo/cart.png"></span>
									<span class="carttext">购物车</span>
							</div>	
						</a>
						
						<div      class="topbox" >
							<a    class="unline" href="<%=basePath%>/userCenter.htm"><span class="licon"><img height="18" src="<%=basePath%>/img/tinyicon/topinfo/wrench.png"></span>应用中心</a>
						</div>
						
					</div>
					
				</div>
				
					<script>
						
						var maccbu = document.getElementById('macc');
						console.log( '' + maccbu.name );
						
						var macc   = function(event) {
							if( maccbu.name == 'login') 
								window.location = basePath+'/login'  ;
							else	
							if( maccbu.name == 'quitacc') {
								
								$.ajax( {
									url         :  'quitlogin'   ,
									type        :  "POST"        ,
									contentType :   false        ,
									processData :   false        ,
									success     :   function(data) {
											$('#showusername').html(data);
									}
								} );
								
								$.ajax( {
									url         :  'cleancart'   ,
									type        :  'POST'        ,
									contentType :   false 	     ,
									processData :   false        ,
									success     :   function(data) {
										if(document.getElementById('cartquantity' )!=null) 
											$('#cartquantity' ).html(data);
										if(document.getElementById('cartquantityl')!=null) 
											$('#cartquantityl').html(data);
									}
								});
								
								window.location = basePath+'/userCenter'  ;
								
							}
						}
							maccbu.addEventListener( 'click' , macc , false );					
						
					</script>
					
			</div>
			
		</div>
		
		
		
		<div class="core">
			
			<% Map<String,List<String>> functionMap   = (Map<String,List<String>>)request.getAttribute("userCenterFunctionMap"); 
			   Set<String>              functionSet   =  functionMap.keySet  ();
			   List<String>             functionList  =  new ArrayList<String>();
			                            functionList.addAll(functionSet);
			   java.util.Collections.sort(functionList);
			   
			   Iterator                 iternames     =  functionList.iterator();
			   int                      maxcol        =  6;
			   for ( int i = 0 ; iternames.hasNext() ; i++ ) {
				   
				   String       functionname = (String)iternames.next();
				   List<String> functionlist =  functionMap.get(functionname);%>
				   
					<div class="iconbox">
						<!-- 1.link address -->
						<a class="unline" href="<%=basePath%><%=functionlist.get(0)%>">
							<!-- 2.img address -->
							<img src="<%=basePath%><%=functionlist.get(1)%>" width="100"/><br />
							<!-- 3.letter content -->
							<%=functionlist.get(2)%>
						</a>
					</div>
				
			<%}%>
			
			<script>
				
				var redirectuserPage = function() {
					if(username=='')
						window.location = basePath+'/login';
				}
				
				var userFunctions     = document.getElementsByClassName('userFunction');
				for( var i = 0 ; i < userFunctions.length ; i++ )
					userFunctions[i].addEventListener( 'mouseup' , redirectuserPage , false );
				
			</script>
			
		</div>
		
	</body>
	
</html>

