<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         
         import       ="java.util.*"
         import       ="com.bean.*"
         import       ="com.buffer.imgbuffer.BoxImgBuffer.LONGEREDGE"
         import       ="com.dao.uuid.UuidUtils"
                    
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  request.setCharacterEncoding("utf-8"); 


	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
   
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
	
		<title>搜索结果</title>	
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script src="<%=basePath%>/js/jQuery/jquery-3.2.1.js"></script>
		
		<style>

			/******** basic part. ********/
			*            {  font-family     : 微软雅黑;   }
			body         {  margin          : 0;       }
			.unline      {  text-decoration : none; 
						    color           : #000;  
						    cursor          : pointer;
						 }
			.gap 		 { 	position		: relative;
							clear			: both; 	}
			
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
			.textboxover	{ 
								 animation-name     : textboxover;
								 animation-duration : 0.3s;
								 box-shadow: 0px 0px  5px #999;
							}
			.textboxout 	{ 
								animation-name     : textboxout;
								animation-duration : 0.3s;
								box-shadow: 0px 0px  0px #999;
							}
			.textboxblur 	{    
								animation-name     : textboxblur;
								animation-duration : 0.3s;
								box-shadow: 0px 0px 0px #999;
							}
			.textboxfocus	{ 
								animation-name     : textboxover;
								animation-duration : 0.3s;
								box-shadow: 0px 0px 10px #999;
							}
			@keyframes textboxover  {
										from   { box-shadow: 0px 0px  0px #999; }
										to     { box-shadow: 0px 0px  5px #999; }
									}
			@keyframes textboxout   {
										from   { box-shadow: 0px 0px  5px #999; }
										to     { box-shadow: 0px 0px  0px #999; }
									}
			@keyframes textboxblur  {
										from   { box-shadow: 0px 0px 10px #999; }
										to     { box-shadow: 0px 0px  0px #999; }
									}
			@keyframes textboxfocus {
										from   { box-shadow: 0px 0px  5px #999; }
										to     { box-shadow: 0px 0px 10px #999; }
									}

			.topfunc    		    { 
										 margin-top      :   6px; 
						                 margin-left     :  20px; 
						                 font-size       :  16px; 
						                 float           :  left; 
						                 color           : #222;  
						                 height          :  72px; 
						                 width           : 400px; 
						                 border          :   0px solid #222;
			              			}
			.username      			{
										 font-weight     :    300;    }	
			.longname      			{    font-size       :   14px;    }					
			.topbox       			{
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
			.funcbox       			{
										 position        :  relative; 	
										 float           :    left; 			                 
										 height          :  70px;
						                 min-width       : 130px;
						                 max-width       : 180px;
						                 border          :   0px solid #c11;
						   			}
			.sicon         			{
										 margin-top      :   2px; 
										 float           :  left;
										 height          :  17px;
										 min-width       :  22px;
										 border          :   0px solid #222;
						   			}
			.hellotext     			{
										 position        :  relative; 	
										 float           :   left; 	
										 margin-top      :    8px; 
										 font-size       :   12px;
										 text-align      :   left;
						   			}			   
			.licon         			{
										 margin-top      :  2px; 
										 float           : left;
										 height          :  17px;
										 width           :  47px;
										 text-align      : center;
										 border          :   0px solid #222;
						   			}	
			.carttext      			{    position        : absolute;
									     bottom          :  0;
									     left            :  47px;       }			   		   
			.cartquantity    		{
										 position        : absolute; 
										 margin-top      :     6px; 
						                 margin-left     :  18px; 
						                 text-align		 : center;
						                 font-size       :    16px;
						                 font-weight     :   800; 
						                 width           :    20px; 
						  			}
			.cartquantityl    		{
										 position        : absolute;
										 margin-top      :     9px; 
						                 margin-left     :  18px; 
						                 text-align		 : center;
						                 font-size       :    12px;
						                 font-weight     :   300; 		
						                 width           :    20px;		
						   			}
						   
						   

			/* main page part. */
			.core{
				   position: relative;
				   margin: 0 auto;
				   margin-top: 30px;
				   margin-bottom: 30px;
				   height:2000px;
			       width :1210px;
			       border:  1px solid #ccc; 
				 }
			/* boximg part. */
			.boxbasic {

					  }
			.box 	{ 
					   margin-top  : 20px;
					   margin-right: 10px;
					   margin-left : 10px;
					   float       : left;
					   height:430px;
				       width :280px;
				       background-color: #fff;
				       border:  0px solid #ccc; 
			     	}
			/* box animation. */     	
			.boxout { 
						animation-name     : boxout;
						animation-duration : 0.3s;
						box-shadow: 0px 0px  0px #00aaff;
					}
			.boxover{ 
						animation-name     : boxover;
						animation-duration : 0.3s;
						box-shadow: 0px 0px 10px #00aaff;
					}
			@keyframes boxover {
				from   { box-shadow: 0px 0px  0px #00aaff; }
				to     { box-shadow: 0px 0px 10px #00aaff; }
				
			}
			@keyframes boxout {
				from   { box-shadow: 0px 0px 10px #00aaff; }
				to     { box-shadow: 0px 0px  0px #00aaff; }
			}


			.boximg   {
					    position: relative;
				        margin: 0 auto;
					    max-height:280px;
				        max-width :280px;
				        border:  0px solid #eee; 
					  }

			.boxtitlebasic {
							display       : block;
							position      : relative;
							padding-left  :   8px;
							padding-right :   8px;							
						   }		  
			.boxtitle {
						font-size     :  16px;
						font-weight   : 300;
						padding-top   :   8px;
						padding-bottom:   2px;		
						height        :  63px;
						width         : 280px;
					  }
			.boxtitleblod { font-weight: 800; }
			.boxuser      { 
							float         :  left;
							font-size     :  12px;
							font-weight   :   300;
							vertical-align:   text-top;
							padding-top   :   2px;
							padding-bottom:   2px;	
							color         :  #888;
						    height        :  20px;
					        width         : 170px;	
					        border        :   0px solid #222; 									
			              }
			.boxuserquantity {
								font-size: 18px; 
								font-family:Times New Roman;
							 }
			.boxservice    {
							float         :  right;
							font-size     :  14px;
							font-weight   :   300;
							
							padding-right :   12px;
							padding-top   :   2px;
							padding-bottom:   2px;
							
						    height        :  62px;
					        width         :  76px;	
					        text-align    :  right;
					        border        :   0px solid #f6f6f6; 								
						   }         
			.boxservicebar {
							float         :  right;
							font-size     :  14px;
							font-weight   :   300;
							/*
							padding-right :   12px;
							padding-top   :   2px;
							padding-bottom:   2px;	
							*/
						    height        :  30px;
					        width         :  76px;	
					        text-align    :  right;
					        border        :   0px solid #f6f6f6;
						   }			       
			.boxprice { 
						float         : left;
						font-weight   : 300;
						font-size     : 26px;
						/*
						padding-left  : 6px;
						padding-top   : 2px;
						padding-bottom: 2px;		
						*/
					    height        :  36px;
				        width         :  170px;	
					    border        :   0px solid #222; 	
						font-family: Times New Roman;
					  }	  
			.indexfunc  {
								margin-top    : 20px;
								margin-bottom : 20px;
								float         : left;
								font-weight   : 300;
							    height        :  50px;
						        width         :  1192px;
						        border        :   1px solid #e6e6e6; 	
						}		  
			.funcbutton   {
								font-size     :  14px;
							    height        :  30px;
						        width         : 120px;	
						  }			
			.indexfuncbox {
								margin-top    :   4px;
								margin-bottom :   4px;
								margin-left   :  10px;
								margin-right  :  10px;
								float         :  left;
								font-weight   :   300;
								font-size     :  20px;
							    height        :  30px;
						        width         :  120px;	
						        border        :    1px solid #f6f6f6; 								
						  }			

			#priceindex	  {
								display       :  block;
								margin-top    :   4px;
								margin-bottom :   4px;
								margin-left   :  10px;
								margin-right  :  10px;
								float         :  left;
								font-weight   :   300;
								font-size     :  16px;
							    height        :  32px;
						        width         : 120px;	
						        text-align    :  center;
						        border        :   1px solid #f6f6f6; 					
						  }

			#priceselect  {
								display       :  block;
								margin-top    :   8px;
								float         :  left;
								font-weight   :   300;
								font-size     :   14px;
							    height        :   50px;
						        width         :  260px;	
						        border        :    1px solid #f6f6f6; 		
						  }
			.pricerange   {
								margin-top    :   5px;
								font-size     :  15px;
						  }			  
			.pricedetail  {
								display       :  block;
								float         :  left;								
						  }
			.boxpricelong {
								font-family: Times New Roman;				
								font-size: 22px;
								vertical-align: text-top;
						  }		  
			.topbar 	  {
							   position: relative;
							   margin: 0 auto;
							   height: 120px;
						       border:  1px solid #ccc; 
			       		  }
			        
			.wd           {
							   position:  relative;
							   margin  :  0 auto;
							   margin-top: 30px;
							   margin-bottom: 30px;
							   height  :  520px;
						       width   : 1210px;
						       border  :    1px solid #ccc; 
						  }		
			
			
			/* page number */
			.productPageNumber 		{
										position    : relative;
										margin      : 0  auto;
										margin-top  : 40px;
										height      : 20px;
										width       : 220px;
										/*border      : 1px solid #222;*/
									}	
			.pageSelectedCode       {
										font-size   : 20px;
										font-weight : 800px;
										text-decoration: underline;
									}
			.pageCodeBlock          {   font-size   : 16px;   
			                        }
			.pageCode               {   cursor      : pointer;   
										text-align  : center ;
									    width       : 30px   ;   }



			/* recommend store part. */
			.recommendStore      {
									margin   : 0 auto;
									margin-top: 26px;
									width: auto;
								    height: auto;
								   
								    max-height: 80%;
								    max-width : 70%;
								   
									display: block;
									border   : 1px solid #222;
							     }
			 img .container {
				  max-width: 5em;
				  max-height: 5em;
			}

			/* recommendation part. */
			.recommendBlockBasic {
									 position: relative;
									 float   : left;
								 }
			.recommendTitle      {
									 clear   : both;
									 margin-top    : 25px;
									 margin-left   : 55px;
									 margin-bottom : 0px;
									 height  : 20px;
									 width   : 500px;
									 font-size:  : 20px;
									 color : #3dbbd4; 
									 font-family : 微软雅黑;
						         }
			.recommendBlock      {
								     position   : relative;
								     margin     :  0 auto;  
									 margin-top : 20px;
									 height  	: 320px;
									 width   	: 1288px;
						         }						        
			.recommendCore       {
									 margin 	: 0 auto;
									 height  	: 290px;
									 width   	: 1288px;
							     }
			/* recommendMid part. */ 
			.recommandMidButton {
										vertical-align:text-bottom;
										position: relative;
										float   : left;
										margin-top   : 80px;
									    margin-left  : 5px;
										margin-right : 5px;
										height  : 38px;
										width   : 38px;

									}
			.recommendMidButtonArrow {
										height    :38px; 
										width     :38px; 
										font-size :16px;
									 }												
			.recommendMidBox    {
										 margin-top   : 20px;
										 margin-left  : 5px;
										 margin-right : 5px;
						                 height  : 250px;
						             	 width   : 160px;
										 display: block;
								    }
			.recommendMidBoxImg    {
						                 height      : 160px;
						             	 width       : 160px;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display: block;
										 vertical-align: middle;
										 text-align: center;
							 	   }	
			.recommendMidNameText  { 
										 height      : 40px;
										 width       : 160px;
										 font-size   : 14px; 
										 display: block;
							       }
			.recommendMidPriceText { 
										 height      : 20px;
										 width       : 160px;
										 text-align    : left; 
										 vertical-align: text-bottom;
										 font-size   :  14px;
										 display: block;
								   }  
			.recommendMidBoxRowGap { 
										 clear:both; 
								   }








			/* product part. */
			.productInforBlock  {
						   position:relative;
						   clear   :both;
						   width   : 1240px;
						   height: 300px; 
				           background-color: #FFFFFF; 
				           margin-top: 10px; 
				           margin-left: auto;
				           margin-right: auto;
				           padding: 30px;
				           text-align: center;
				           box-shadow: 0px 0px 10px #eee;
						 }


			/* buttom part. */
			.inforfontunit { float:left;
							 height : 50px;
							 width: 120px;
							 border:1px;
							 margin-top: 20px;
							 margin-left : 10px;
							 margin-right: 10px;
							 text-align: center;
							 font-weight: 500; 
							 color:#4f89ba;
						 }
			.midblock  {
							 margin: 0 auto;
						 }
			.emptyblock {  position:relative;
						   clear   :both;
						   height: 200px; 
				           background-color: #FFFFFF; 
				           margin-top: 10px; 
				           margin-left: auto;
				           margin-right: auto;
				           padding: 30px;
				           text-align: center;
				         }


			.bottom      { 
						   position:relative;
						   margin: 0 auto;
						   clear   :both;
						   bottom    : 0; 
						   height:600px; 
				           background-color: #fff; 
				           padding: 30px;
				           border-top    : 1px solid #222; 
				         }
			.backtotop   {
						   position:relative;
						   margin: 0 auto;
						   clear   :both;
						   height:20px; 
						   text-align: center;
				           padding: 10px;
				           background-color: #fcfcfc;
						 }
			.backtotopover {
							animation-name     : backtotopover;
							animation-duration : 0.3s;	
				            background-color: #eee;
						   }
			.backtotopout  {
							animation-name     : backtotopout;
							animation-duration : 0.3s;				
				            background-color: #fcfcfc;
						   }	
			@keyframes backtotopover {
				from   { background-color: #fcfcfc; }
				to     { background-color: #eee; }
				
			}
			@keyframes backtotopout {
				from   { background-color: #eee; }
				to     { background-color: #fcfcfc; }
			}

			.inforfont   {   clear:both;
							 border:1px;
							 text-align: center;
							 margin: 10px ;
							 margin-top: 20px;
							 font-weight: 300; 
							 color:#888;
			             }

			.aboveinfotfont_out {    
				animation-name     : aboveinfotfont_out;
				animation-duration : 0.3s;
				color:#666;  font-size: 16px;
			}
			.aboveinfotfont_over{ 
				animation-name     : aboveinfotfont_over;
				animation-duration : 0.3s;
				color:#111;  font-size: 16px;
			}
			.lowerinfotfont { font-family: Times New Roman; }
			@keyframes aboveinfotfont_over {
				from   { color:#666; }
				to     { color:#111; }
				
			}
			@keyframes aboveinfotfont_out {
				from   { color:#111; }
				to     { color:#666; }
			}
		
		</style>

		<script>

			function titleunitout() {
				document.getElementsByClassName('titleunit_over')[0].setAttribute("class","titleunit_out");
			}
			function titleover1() {
				document.getElementsByClassName('titleunit_out')[0].setAttribute('class','titleunit_over');
				document.getElementById('buttonlist1').style.display='block';
			}
			function titleover2() {
				document.getElementsByClassName('titleunit_out')[1].setAttribute('class','titleunit_over');
				document.getElementById('buttonlist2').style.display='block';
			}
			/*
			function inforfontover() {
				document.getElementsByClassName('aboveinfotfont_out')[0].setAttribute("class","aboveinfotfont_over");
			}*/
			function inforfontout() {
				document.getElementsByClassName('aboveinfotfont_over')[0].setAttribute("class","aboveinfotfont_out");
			}
		</script>
		
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
							<span class="cartquantityl unline" id="cartquantityl"><%=cartquantity%></span>
							<% } %>
							
							<div  class="topbox"> 
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
								
								window.location  =  basePath+'/indexPage?'+'keyword='+encodeURI(encodeURI(keyword.value))+'&page=1';
								
							}
						}
							maccbu.addEventListener( 'click' , macc , false );
							
					</script>
					
			</div>
			
		</div>
		
		
		<!-- recommend part. -->
		<!-- 
		<div class="wd">
			<div class="recommendTitle">明星单品</div>
			<div class="recommendStore">
				<img  src="<%=basePath%>/img/default/indexCenter/closet.jpg" />
			</div>
		</div>

		<div class="wd">

			<div class="recommendTitle">推荐单品</div>

			<div class="box">
				<div class="boximg"></div>
				<div class="boxtitlebasic boxtitle"><span class="boxtitleblod">汽车</span> 汽车城 全车垫 沙发 真皮 气垫 自动驾驶 福特 加长 超舒适 S500 四驱 加厚刹车</div>
				<div class="boxtitlebasic boxprice"><span style="font-family: 宋体;" class="boxpricelong">￥</span><span class="boxpricelong">69999999999.99</span></div>
				<div class="boxservice">
					<div class="boxservicebar">
					</div>
					<div class="boxservicebar">
						<img height="30" src="<%=basePath%>/img/tinyicon/index/market.png">&nbsp;
						<img height="30" src="<%=basePath%>/img/tinyicon/index/transport.png">
					</div>
				</div>				
				<div class="boxtitlebasic boxuser"><span class="boxuserquantity">20000000000</span> 用户已购买</div>
			</div> 

			<div class="box">
				<div class="boximg"></div>
				<div class="boxtitlebasic boxtitle"><span class="boxtitleblod">汽车</span> 汽车城 全车垫 沙发 真皮 气垫 自动驾驶 福特 加长 超舒适 S500 四驱 加厚刹车</div>
				<div class="boxtitlebasic boxprice"><span style="font-family: 宋体;" class="boxpricelong">￥</span><span class="boxpricelong">69999999999.99</span></div>
				<div class="boxservice">
					<div class="boxservicebar">
					</div>
					<div class="boxservicebar">
						<img height="30" src="<%=basePath%>/img/tinyicon/index/market.png">&nbsp;
						<img height="30" src="<%=basePath%>/img/tinyicon/index/transport.png">
					</div>
				</div>				
				<div class="boxtitlebasic boxuser"><span class="boxuserquantity">20000000000</span> 用户已购买</div>
			</div>

			<div class="box">
				<div class="boximg"></div>
				<div class="boxtitlebasic boxtitle"><span class="boxtitleblod">汽车</span> 汽车城 全车垫 沙发 真皮 气垫 自动驾驶 福特 加长 超舒适 S500 四驱 加厚刹车</div>
				<div class="boxtitlebasic boxprice"><span style="font-family: 宋体;" class="boxpricelong">￥</span><span class="boxpricelong">69999999999.99</span></div>
				<div class="boxservice">
					<div class="boxservicebar">
					</div>
					<div class="boxservicebar">
						<img height="30" src="<%=basePath%>/img/tinyicon/index/market.png">&nbsp;
						<img height="30" src="<%=basePath%>/img/tinyicon/index/transport.png">
					</div>
				</div>				
				<div class="boxtitlebasic boxuser"><span class="boxuserquantity">20000000000</span> 用户已购买</div>
			</div> 

			<div class="box">
				<div class="boximg"></div>
				<div class="boxtitlebasic boxtitle"><span class="boxtitleblod">汽车</span> 汽车城 全车垫 沙发 真皮 气垫 自动驾驶 福特 加长 超舒适 S500 四驱 加厚刹车</div>
				<div class="boxtitlebasic boxprice"><span style="font-family: 宋体;" class="boxpricelong">￥</span><span class="boxpricelong">69999999999.99</span></div>
				<div class="boxservice">
					<div class="boxservicebar">
					</div>
					<div class="boxservicebar">
						<img height="30" src="<%=basePath%>/img/tinyicon/index/market.png">&nbsp;
						<img height="30" src="<%=basePath%>/img/tinyicon/index/transport.png">
					</div>
				</div>				
				<div class="boxtitlebasic boxuser"><span class="boxuserquantity">20000000000</span> 用户已购买</div>
			</div>

			<div class="gap"></div>
		</div>
		  -->
		
		
		
		<div class="core">

			<div class="boxtitlebasic indexfunc">

				<div class="indexfuncbox">
					<button class="funcbutton" id="sortbyprice">销量排序</button>
				</div>

				<div class="indexfuncbox">
					<button class="funcbutton" id="sortbyprice">人气排序</button>
				</div>

				<form>
			
				<div id="priceindex">
					<div class="pricerange">价格范围 &#x2B07; </div>
					<div id="priceselect">
						<div class="pricedetail">
							&nbsp;最低价格 : <input type="text"   id="lowprice"    style="height:18px; width:60px;" />
						</div>
						<div class="pricedetail">
							&nbsp;最高价格 : <input type="text"   id="highprice"   style="height:18px; width:60px;" />
							           &nbsp;<input type="button" id="sortbyprice" style="width:100px;" value="提交搜索" />				
						</div>
					</div>
				</div>

				<script>
					var priceindex  = document.getElementById('priceindex');
					var priceselect = document.getElementById('priceselect');

					var showindex   = function(event) {
						if( priceselect.style.display == 'none' )
							priceselect.style.display =  'block' ;
						else
						if( priceselect.style.display == 'block')
							priceselect.style.display =  'none'  ;
					}	
						priceselect.style.display = 'none';
						priceindex.addEventListener( 'mouseover' , showindex , false );
						priceindex.addEventListener( 'mouseout'  , showindex , false );
				</script>

				</form>

				<div class="indexfuncbox">
					<button class="funcbutton" id="sortbyprice">价格升序</button>
				</div>

				<div class="indexfuncbox">
					<button class="funcbutton" id="sortbyprice">价格降序</button>
				</div>

				<div class="indexfuncbox">
					<button class="funcbutton" id="sortbyprice">新品优先</button>
				</div>
				
			</div>
			
				<!-- boximg part. -->
				<% 
				   
				   // 0.productID.
				   List<String> indexPageproductidList     =  (List<String>)session.getAttribute("indexPageproductidList");
				   Iterator              productiditerList =   indexPageproductidList.iterator();     
				   	    String           productid         =   null;
				   
				   // 1.boximgsmall list.
				   List<String> indexPageBoxImgList        =  (List<String>)session.getAttribute("indexPageFirstboximgList");
				        String           boxImg            =   null;
				   
				   // 2.namelist.
				   List<String> indexPageproductnameList   =  (List<String>)session.getAttribute("indexPageProductnameList");
				        String           productname       =   null;
				   
				   // 3.pricelist.
				   List<String> indexPageproductpriceList  =  (List<String>)session.getAttribute("indexPageProductpriceList");
				        String           productprice      =   null;
				   
				   // 4.longerEdgeList.
				   //List<String> indexPageImgLongerEdgeList =  (List<String>)session.getAttribute("indexPageImgLongerEdgeList");
			       //		String              longerEdge     =   null;
				   
			       System.out.println( "--------indexPage client.--------" );
			       
				   for( int i = 0 ; productiditerList.hasNext() ; i++ ) {
					   
					   productid    = (String)productiditerList.next();
					   productprice = (String)indexPageproductpriceList .get(i);
					   boxImg       = (String)indexPageBoxImgList       .get(i);
					   productname  = (String)indexPageproductnameList  .get(i);
					   //longerEdge   = (String)indexPageImgLongerEdgeList.get(i);
					   
					   
					   System.out.println( "productid -- " + productid );
				       
				 %>
				 
				 
			<div class="box">
				<!-- 1.boximg  -->
				<div class="boximg">
					
					<img  class="boximg"  src="<%=basePath%><%=boxImg%>" />
					<input type="hidden"  class="productid" value="<%=productid%>" />	
					
				</div>
				
				<!-- 2.productname -->
				<div class="boxtitlebasic boxtitle"><span class="boxtitleblod">汽车</span><%=productname%></div>
				<div class="boxtitlebasic boxprice"><span style="font-family : 宋体;" class="boxpricelong">￥</span><span class="boxpricelong"><%=productprice%></span></div>
				
				
				<div class="boxservice">
					<div class="boxservicebar">
					</div>
					<div class="boxservicebar">
						<img height="30" src="<%=basePath%>/img/tinyicon/index/market.png">&nbsp;
						<img height="30" src="<%=basePath%>/img/tinyicon/index/transport.png">
					</div>
				</div>
				<div class="boxtitlebasic boxuser"><span class="boxuserquantity">20000000000</span> 用户已购买</div>
			</div>
					
					<% if( (i>0)&&((i+1)%4==0) ) { %>
					<div class="gap"></div>
					<%                           } %>
					
				<%  } %>
				
				<!---------------- ID storage center. ---------------->
				<script>
					
					var core        = document.getElementsByClassName( "core"     )[0];
					var basePath    = document.getElementById        ( 'basePath' ).value;
					
					var boximgArray = core.getElementsByClassName(     'boximg'   );
					
					for ( var i = 0 ; i < boximgArray.length ; i++ ) {
						// 1. use mouse key down to store    productID  .
						boximgArray[i].addEventListener( 'mousedown' , storeProductID  , false );
						// 2. use mouse key up   to redirect productpage.
						boximgArray[i].addEventListener( 'mouseup'   , productPageLink , false );
					}
					
					function pickProductID(img) {
						
						var formdata  = new FormData();
						    formdata.append( 'productid'     , img.parentNode.getElementsByTagName('input')[0].value );
						    console.log(     'productid -- ' + img.parentNode.getElementsByTagName('input')[0].value );
						    
						$.ajax( { 
							url         : 'userCenter/storeProductID' , 
							data        :  formdata                   , 
							type        : 'POST'                      , 
							processData :  false                      , 
							contentType :  false           
						});
					}
					
					function storeProductID(){
						pickProductID(this);
					}
					
					function productPageLink() {
						window.location = basePath+'/productPage';
					}
					
				</script>
				
				
				<div class="gap"></div>
				
				<div class="productPageNumber">
					
					<% 
					   
					   String        keyword    = (      String )session.getAttribute   ("keyword"       );
														         session.removeAttribute("keyword"       );
														         
					   Integer       curpage    = (     Integer )session.getAttribute   (     "page"     );
					  											 session.removeAttribute(     "page"     );
					  											 
					   List<Integer> pagesList  = (List<Integer>)session.getAttribute   ("indexPagesList"); 
					   											 session.removeAttribute("indexPagesList");
					   
					   Integer       initp      =  new Integer(1);
					   
				       if  ( ( curpage-1 )%10==0       ) 
				        	  initp          = curpage ;
				       else   initp          = curpage - (curpage-1)%10;
				       
					  %> 
					   
					 	<table class="pageCodeBlock" >
					 	<tr>
					 <%	
					 	for( int i = initp ; i  <  pagesList.size()+initp ; i++ ) {
						   	Integer   itemCounts = pagesList.get(i-initp); %>
						   	
						<%        if( ( initp>=11 )&&( i==initp   ) )     { %>
							<td   id="prepages"       class="pageCode"                                 >...</td><%}%>
						
						<%        if( ( i==curpage)&&(i==initp)&&(itemCounts>0) ) { %>
							<td   id=""               class="pageCode firstpage pageSelectedCode"><%=i%></td>  
							
						<% } else if( ( i==curpage)&&(itemCounts>0) )     { %>
							<td   id=""               class="pageCode pageSelectedCode"          ><%=i%></td>  
							
						<% } else if( ((i-1)%10==0)&&(i!=initp    ) )     { %>
							<td   id="nextpages"      class="pageCode"                                 >...</td>  
							
						<% } else if( ( i==initp  )&&(itemCounts>0) )     { %>
							<td   id="firstpage"      class="pageCode firstpage"                       ><%=i%></td>  
						<% } else if(  itemCounts>0  )                   { %>
							<td   id=""               class="pageCode"                                 ><%=i%></td> 
						<% } %>
					<%  }  %>
						</tr>
						</table>
						
					<input type="hidden" id="keywordhide" value="<%=keyword%>" />
					
				</div>
				
				
				
				
				<script>
					
					var pageblock        = document .getElementsByClassName("productPageNumber")[0];
					
					var pages            = pageblock.getElementsByClassName("pageCode");
					
					var keywordhide      = pageblock.getElementsByTagName  ('input')[0];
					
					var firstpage        = pageblock.getElementsByClassName('firstpage')[0];
					
					
					for( var i = 0 ; i < pages.length ; i++ ) {
						pages[i].addEventListener( "mousedown" , productNewPageLink , false );
					}
					
					function productNewPageLink(event) {
						var newpage =   event.target.innerHTML;
						if( newpage==  '...' ) {
							     if(event.target.id== 'prepages' ) newpage =    firstpage.textContent-1 ;
							else if(event.target.id=='nextpages' ) newpage = (( firstpage.textContent-1 )/10+1)*10+1;
						}
						window.location = basePath+'/indexPage?'+'keyword='+encodeURI(encodeURI(keywordhide.value))+'&page='+newpage;
					}
					
					
				</script>
				
				
			</div>
		
		
		
		<!-- box effect. -->
		<script>
			var boxes = document.getElementsByClassName('box');

			var boxeffect = function(event) {
				console.log( ' function !! ' + event.target.className );

				if( (event.target.className == 'box'          )||
					(event.target.className == 'box boxout') ) 
				 	 event.target.className =  'box boxover';
				else 
				if  (event.target.className == 'box boxover') 
				 	 event.target.className =  'box boxout';


				if( (event.target.parentNode.className == 'box'          )||
					(event.target.parentNode.className == 'box boxout') ) 
				 	 event.target.parentNode.className =  'box boxover';
				else 
				if  (event.target.parentNode.className == 'box boxover') 
				 	 event.target.parentNode.className =  'box boxout';


				if( (event.target.parentNode.parentNode.className == 'box'          )||
					(event.target.parentNode.parentNode.className == 'box boxout') ) 
				 	 event.target.parentNode.parentNode.className =  'box boxover';
				else 
				if  (event.target.parentNode.parentNode.className == 'box boxover') 
				 	 event.target.parentNode.parentNode.className =  'box boxout';

				if( (event.target.parentNode.parentNode.parentNode.className == 'box'          )||
					(event.target.parentNode.parentNode.parentNode.className == 'box boxout') ) 
				 	 event.target.parentNode.parentNode.parentNode.className =  'box boxover';
				else 
				if  (event.target.parentNode.parentNode.parentNode.className == 'box boxover') 
				 	 event.target.parentNode.parentNode.parentNode.className =  'box boxout';
  
			}
			
			for( var i = 0 ; i < boxes.length ; i++ ) {
				boxes[i].addEventListener( 'mouseover' , boxeffect , false );
				boxes[i].addEventListener( 'mouseout'  , boxeffect , false );
			}
			
		</script>
		
		
		
		
		
		<!---------------- recommend ---------------->
		<div class="recommendCore">
		
			<div         class="recommendTitle">你可能还需要</div>
			
			<div         class="recommendBoxes">
			
				<div     class="recommandMidButton">
					<a   href ="<%=basePath%>/msgCenter">
						<button class="recommendMidButtonArrow">&#xFFE9;</button>
					</a>
				</div>
				
				<%  Map<FirstBoxImg,LONGEREDGE> recommandBoxImgMap = (Map<FirstBoxImg,LONGEREDGE>)session.getAttribute( "recommandBoxImgMap" );  
					System.out.println( "recommendBoxImg length -- " + recommandBoxImgMap.size() );
					
					Set<FirstBoxImg>            boximgSet          =  recommandBoxImgMap.keySet();
					System.out.println( "recommendBoxImg boximgSet length -- " + boximgSet.size() );
					Iterator                    boximgiter         =  boximgSet.iterator();
					
					Collection<LONGEREDGE>      longeredgeList     =  recommandBoxImgMap.values();
					Iterator                    longeredgeListiter =  longeredgeList.iterator  ();
					
					System.out.println( "recommendBoxImg longeredgeList length -- " + longeredgeList.size() );
					
					for ( int i = 0 ; boximgiter.hasNext() ; i++ ) {
						System.out.println( "Number -- " + i + " BoxImg " );
						   
						   FirstBoxImg     boximg         = (FirstBoxImg)boximgiter.next();
						   System.out.println( "Number " + i + " img Name -- " + boximg.getProductname() );
						   
						   LONGEREDGE      longeredge     = (LONGEREDGE)longeredgeListiter.next();
						   System.out.println( "Number " + i + " img longer edge -- " + longeredge.name() );
						   
						   byte[]     productidbytes  =  (byte[])boximg.getProductid();
						   UUID       productuuid     =   UuidUtils.asUuid(productidbytes);
						   
						   System.out.println( "Number " + i + " img UUID        -- " + productuuid.toString() );
						   
				 %>
				
				<!-- 0. -->
				<div     class="recommendMidBox       recommendBlockBasic"  
					     id   ="recommendBoxImg<%=i%>"                      >
					     
					<div class="recommendMidBoxImg    recommendBlockBasic"  >
					<% if ( longeredge.equals(LONGEREDGE.HEIGHT) ) { %>
						<img height="160" src="<%=basePath%><%=boximg.getFirstboximg()%>"/>
					<% } else if ( longeredge.equals(LONGEREDGE.WIDTH) ){ %>
						<img width="160"  src="<%=basePath%><%=boximg.getFirstboximg()%>"/>
					<% } else {%>			
						<img              src="<%=basePath%><%=boximg.getFirstboximg()%>"/>
					<% } %>	
					
					</div>
					<div class="recommendMidNameText  recommendBlockBasic"><%=boximg.getProductname()%></div>
					<div class="recommendMidPriceText recommendBlockBasic">￥<span id="price1"><%=boximg.getPrice() %></div>
					<input type="hidden" value="<%=productuuid.toString()%>" />
					
				</div>
				
				<%  } %>
				
				<script>
					
					var recommandCoreUp    =        document.getElementsByClassName( "recommendCore"      )[0];
					
					var recommandBoxImgsUp = recommandCoreUp.getElementsByClassName( 'recommendMidBoxImg' );
					
					for ( var i = 0 ; i < recommandBoxImgsUp.length ; i++ ) {
						// 1. use mouse key down to store    productID  .
						recommandBoxImgsUp[i].addEventListener( 'mousedown' , storeProductID  , false );
						// 2. use mouse key up   to redirect productpage.
						recommandBoxImgsUp[i].addEventListener( 'mouseup'   , productPageLink , false );
					}
					
					function pickProductID(img) {
						
						var formdata  = new FormData();
						    formdata.append( 'productid'     , img.parentNode.getElementsByTagName('input')[0].value );
						    console.log(     'productid -- ' + img.parentNode.getElementsByTagName('input')[0].value );
						    
						$.ajax( {
							url         : 'userCenter/storeProductID' ,
							data        :  formdata        ,
							type        : 'POST'           ,
							processData :  false           ,
							contentType :  false           
						});
					}
					function storeProductID(){
						pickProductID(this);
					}
					function productPageLink() {
						window.location = basePath+'/productPage';
					}
				</script>
				
				<div   class="recommandMidButton">
					<a href ="<%=basePath%>/msgCenter">
						<button class="recommendMidButtonArrow">&#xFFEB;</button>
					</a>
				</div>
				
			</div>
			
		</div>
		<!--------------------------------> 
		
		
		
		
		
		
		
		<div class="emptyblock">
				<a >CONTENT</a> <a>CONTENT</a>
		</div>






		<div class="backtotop">返回顶部</div>

		<script>

			var backtotop = document.getElementsByClassName('backtotop')[0];

			var backtotopeffect = function(event) {
				if( ( event.target.className == 'backtotop'              )|| 
				    ( event.target.className == 'backtotop backtotopout' ) ) 
					  event.target.className =  'backtotop backtotopover';
				else 
				if( ( event.target.className == 'backtotop'              )|| 
				    ( event.target.className == 'backtotop backtotopover') ) 
					  event.target.className =  'backtotop backtotopout' ;
			}

			/*
			var topFunction = function(event) {
			    document.body.scrollTop = 0;
			    document.documentElement.scrollTop = 0;
			}*/

			$('.backtotop').click(function(){
			    $('html, body').animate({scrollTop:0}, 'slow');
			});

			backtotop.addEventListener( 'mouseover' , backtotopeffect , false );
			backtotop.addEventListener( 'mouseout'  , backtotopeffect , false );			
			//backtotop.addEventListener( 'click'     , topFunction     , false );		

		</script>

		<div class="bottom">

			<table class="midblock">
				<tr>
					<td class="inforfontunit"> 
						<a 	href="" 
						    onmouseout ="inforfontout()"
						    onmouseover="javascript:document.getElementsByClassName('aboveinfotfont_out')[0].setAttribute('class','aboveinfotfont_over')"
							class="aboveinfotfont_out" >
							<span >联存储系方式</span><br />
							<span class="lowerinfotfont">CONTENT</span>
						</a>
					</td>
					<td class="inforfontunit"> 
						<a 	href="" 
						    onmouseout ="inforfontout()" 
						    onmouseover="javascript:document.getElementsByClassName('aboveinfotfont_out')[1].setAttribute('class','aboveinfotfont_over')"
							class="aboveinfotfont_out" >
							<span >联存储系方式</span><br />
							<span class="lowerinfotfont">CONTENT</span>
						</a>
					</td>
					<td class="inforfontunit"> 
						<a 	href="" 
						    onmouseout ="inforfontout()"
						    onmouseover="javascript:document.getElementsByClassName('aboveinfotfont_out')[2].setAttribute('class','aboveinfotfont_over')"
							class="aboveinfotfont_out" >
							<span >联存储系方式</span><br />
							<span class="lowerinfotfont">CONTENT</span>
						</a>
					</td>
					<td class="inforfontunit"> 
						<a 	href="" 
						    onmouseout ="inforfontout()" 
						    onmouseover="javascript:document.getElementsByClassName('aboveinfotfont_out')[3].setAttribute('class','aboveinfotfont_over')"
							class="aboveinfotfont_out" >
							<span >联存储系方式</span><br />
							<span class="lowerinfotfont">CONTENT</span>
						</a>
					</td>
					<td class="inforfontunit"> 
						<a 	href="" 
						    onmouseout ="inforfontout()"
						    onmouseover="javascript:document.getElementsByClassName('aboveinfotfont_out')[4].setAttribute('class','aboveinfotfont_over')"
							class="aboveinfotfont_out" >
							<span >联存储系方式</span><br />
							<span class="lowerinfotfont">CONTENT</span>
						</a>
					</td>
					<td class="inforfontunit"> 
						<a 	href="" 
						    onmouseout ="inforfontout()" 
						    onmouseover="javascript:document.getElementsByClassName('aboveinfotfont_out')[5].setAttribute('class','aboveinfotfont_over')"
							class="aboveinfotfont_out" >
							<span >联存储系方式</span><br />
							<span class="lowerinfotfont">CONTENT</span>
						</a>
					</td>
				</tr>
			</table>

			<script>
				function inforfontout() {
					document.getElementsByClassName('aboveinfotfont_over')[0].setAttribute("class","aboveinfotfont_out");
				}
			</script>

			<div class="inforfont">
				<p>Corporation © 2018</p>
			</div>
		</div>
		

	</body>

</html>








