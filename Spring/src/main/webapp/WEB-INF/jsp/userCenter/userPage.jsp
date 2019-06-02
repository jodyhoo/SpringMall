<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
		<title>产品中心</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script src="<%=basePath%>/js/jQuery/jquery-3.2.1.js"></script>
		
		<style>
		
			div          { margin: 0 auto; }
			div table    { margin: 0 auto; }

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
						   
						   
						   
						   
			/* product part. */
			.productInforBlock  {
								   position:relative;
								   clear   :both;
								   width   : 1240px;
								   height: 300px; 
						           background-color: #f6f6f6; 
						           margin-top: 10px; 
						           margin-left: auto;
						           margin-right: auto;
						           padding: 30px;
						           text-align: center;
						           box-shadow: 0px 0px 10px #222;
							     }

			/* core platform part. */
			.platform      {
							 position:relative;
							 margin-top : 20px;
							 margin-left: auto;
							 margin-right: auto;
							 /*height  : 1640px;*/
							 width   : 1300px;
							 border: 1px solid #f6f6f6;
						   }

			.platformcore  {
							position   :relative;
							float      : left;
							margin-top : 20px;
							margin-left: 30px;
							height  : 1260px;
							width   : 980px;
							border: 1px solid #f6f6f6;
						   }

			.platformsideads {
							  position:relative;
							  float      : right;
							  margin-top : 20px;
							  margin-right: 30px;
						  	  height  : 1260px;
							  width   : 250px;
							  border: 1px solid #f6f6f6;
						     }

			.platformbuttomads {
							  position:relative;
							  float      : right;
							  margin-top : 20px;
							  margin-right: 30px;
						  	  height  : 330px;
							  width   : 1240px;
							  border: 1px solid #f6f6f6;
						     }

			/* core part. */ 
			div .productBox    {
							 position: relative;
							 margin-top  : 20px;
							 margin-left : 20px;
							 float   : left;
			                 height  : 290px;
			             	 width   : 220px;
			             	 box-shadow: 0px 0px 10px #f6f6f6;
							 display: block;
						   }

			/* side ads. */ 
			div .productAdsBox {
							 position: relative;
							 margin-top  : 20px;
							 margin-left : 20px;
							 float   : left;
			                 height  : 290px;
			             	 width   : 220px;
			             	 box-shadow: 0px 0px 10px #f6f6f6;
							 display: block;
						   }

			.productBoxImg     {
								 position    : relative;
				                 height      : 220px;
				             	 width       : 220px;
								 display: block;
								 vertical-align: middle;
								 text-align: center;
								 border        : 1px solid #fafafa;
							   }	

			.productNameText   { 
								 position    : relative;
								 float       : left;
								 margin-top  : 2px;
								 margin-left : 10px;
								 height      : 40px;
								 width       : 136px;
								 font-size   : 14px; 
								 display: block;
							   }

			.productPriceText  { 
								 position    : relative;
								 float       : left;
								 margin-top  : 2px;
								 margin-left : 2px;
								 height      : 40px;
								 width       : 60px;
								 text-align    : left; 
								 vertical-align: text-bottom;
								 font-size   :  14px;
								 display: block;
							   }

			.productValidation 	  { 
									 position    : relative;
									 float       : left;
									 margin-top  : 2px;
									 margin-left : 10px;
									 height      : 20px;
									 width       : 200px;
									 font-size   : 14px; 
									 display: block;
								   }
			.productIdentifiCation   {
								 position    : relative;
								 float       : left;
							  }
			.productDescription   {
								 position    : relative;
								 float       : right;
							  }							  
			.productBoxRowGap { position: relative;
								margin-top : 0px;
								clear:both; }










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
								
								window.location = basePath+'/userCenter/userPage'  ;
								
							}
						}
							maccbu.addEventListener( 'click' , macc , false );			
							
							
					</script>

			</div>

		</div>

		
		<div class="platform">
			
			<div class="platformcore">
			
				<!-- boximg part. -->
				<% 
				   
				   // 0.productID.
				   List<String> userPageproductidList     =  (List<String>)session                .getAttribute("userPageproductidList");
				   Iterator             productiditerList =   userPageproductidList.iterator();     
				   	    String          productid         =   null;
				   	    
				   // 1.boximgsmall list.
				   List<String> userPageBoxImgList        =  (List<String>)session                .getAttribute("userPageFirstboximgsmall220List");
				        String          boxImgSmall       =   null;
				   
				   // 2.namelist.
				   List<String> userPageproductnameList   =  (List<String>)session                .getAttribute("userPageProductnameList");
				        String          productname       =   null;
				   
				   // 3.pricelist.
				   List<String> userPageproductpriceList  =  (List<String>)session                .getAttribute("userPageProductpriceList");
				        String          productprice      =   null;
				   
				   for( int i = 0 ; productiditerList.hasNext() ; i++ ) {
					   productid    = (String)productiditerList.next();
					   productprice = (String)userPageproductpriceList.get(i);
					   boxImgSmall  = (String)userPageBoxImgList      .get(i);
					   productname  = (String)userPageproductnameList .get(i);
				
				 %>
				 
						<div class="productBox">
						
							<!-- 1.boximg  -->
							<div class="productBoxImg">
							
								<% if((boxImgSmall!=null)&&(boxImgSmall!="null")) { %>
									<img  src  ="<%=basePath%><%=boxImgSmall%>"    />
								<% } %>
								    
								<input type="hidden"  class="productid" value="<%=productid%>" />
								
							</div>
							
							<!-- 2.productname -->
							<div class="productNameText" ><%=productname%></div>
							<div class="productPriceText">￥<span id="price1"><%=productprice%></span></div>
							
							<!-- 3.productname -->
							<div class="productValidation">
								<div class="productIdentifiCation">
									<a href="">
										<img src="<%=basePath%>/img/icon/serviceCenter/tiny/7daysExchange_icon_20.png"/>
									</a>
								</div>
								<div class="productDescription">
									<a href="">
										<img src="<%=basePath%>/img/icon/serviceCenter/tiny/icons_Validation_20.png"/>
									</a>
								</div>
							</div>
							
						</div>
						
						<% if( (i>0)&&((i+1)%4==0) ) { %>
						<div class="productBoxRowGap"></div>
						<%                           } %>
						
				<%  } %>
				
				<script>
					
					var platform    = document.getElementsByClassName( "platform"      )[0];
					
					var boximgArray = platform.getElementsByClassName( 'productBoxImg' );
					
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
							url         : 'storeProductID' ,
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
				
			</div>
			
		</div>



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






