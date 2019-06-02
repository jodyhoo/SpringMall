<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
         import      ="com.buffer.imgbuffer.*"
         import      ="sun.misc.BASE64Encoder.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
           
<%  request.setCharacterEncoding("utf-8"); 
    String  basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
    
    String 						 username = 
   (String)session.getAttribute("username"); 
    
						    if( (username== "null")||
							    (username==  null ) ) 
						      {  username="";       }  
    
    String                       productPageURL  = 
   (String)session.getAttribute("productPageURL" ); 
    
    if(                        ( productPageURL == "null")||
    						   ( productPageURL ==  null )   ) 
    						   { productPageURL =   "";      } 
    
    
 %>

<html>
	
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加新产品</title>
	    <script src="<%=basePath%>/js/jQuery/jquery-3.2.1.js"></script>
	    <script src="<%=basePath%>/js/jQuery/jqueryform.js"></script>
	    <script src="<%=basePath%>/js/userCenter/productCenter/addProduct.js"></script>
	    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/userCenter/productCenter/addProduct.css"/>
		
		<script>
			
			$(document).ready(function() {
				
				$('#cleancontent').click( function() {
					$('#productPage').html('');
				});
				$('#setleft').click( function() {
					$('#productPage').css('text-align',"left");
				});
				$('#setcenter').click( function() {
					$('#productPage').css('text-align',"center");
				});
				$('#setright').click( function() {
					$('#productPage').css('text-align',"right");
				});
				
				
				$('#pageImgJile').change( function() {
					
					var productPage = document.getElementById('productPage');
					var files       = document.getElementById('pageImgJile').files;
					
					for( var i = 0 ; i < files.length ; i++ ) {
					
						if( files[i].type.substring(0,5)=="image" ) {
						
							var file       = files[i];
							
								filereader = new FileReader();
								filereader.readAsDataURL(file);
								
								filereader.onload = function(filedata) {
									
									var srcData = filedata.target.result;
									var img     = new Image();
										img.src = srcData;
										
										productPage.appendChild(img);
								} 
						} 
					} 
				}); 
				
				
				$('#pageImgJile').blur( function() {
					var       formdata     = new FormData();
						if(            String(                     document.getElementById('productPage').innerHTML ).length != 0 )
						  	  formdata.append( 'tempProductPage' , document.getElementById('productPage').innerHTML );	
						else {
							  formdata.append( 'tempProductPage' , '' 												);	
						}
						
					$.ajax( {
						
						url         : 'pageUploader',
						data        :  formdata     , 
						type        : 'POST'        ,
						
						processData :  false        ,
						contentType :  false        
					}); 
				}); 
				
				
				$('#productPage').blur( function() {
					var formdata     = new FormData();
					formdata.append( 'tempProductPage' , document.getElementById('productPage').innerHTML );	
					
					$.ajax( {
						
						url         : 'pageUploader'    ,
						data        :  formdata     , 
						type        : 'POST'        ,
						
						processData :  false        ,
						contentType :  false        
					}); 
				});	
				
				
				// when enter text, save content.
				document.getElementById('productPage').addEventListener( "input" , function() {
					var formdata     = new FormData();
						formdata.append( 'tempProductPage' , document.getElementById('productPage').innerHTML );	
				
					$.ajax( {
						
						url         : 'uploader'    ,
						data        :  formdata     , 
						type        : 'POST'        ,
						
						processData :  false        ,
						contentType :  false        
					}); 
				} , false);
				
			});
			
		</script>
		
		
		
		
		
		<style>
		
			* { font-family: 微软雅黑; }
			
			#midcontent   	{
				
								/* 1.initial edge&space */
								border-width  : 0px;
								padding       : 0px;
								border-spacing: 0px;

								/* 2.background color */
								border-radius: 5px;

								/* 3.position in block */
								top          : 20px;
								bottom       : 20px;
								margin-top   : 30px;
								display : block;
							    position: relative;
						        margin  : 0 auto;
						        margin-bottom: 30px;
								width  : 1200px;
								min-height : 2800px;

								/* 4.detail decoration. */
								color: #000000;
								box-shadow: 0px 0px 6px #e6e6e6;

								/* 5.text decoration. */
								padding       :  5px;
								border-spacing: 15px;

						  	}
			.pagetop 		{
								 display     : block;
							     position    : relative;
							     margin      : 0 auto;
						         margin-top  : 10px;
						         height      : 60px;
						         width       : 859px;
						         border      : 1px solid #fafafa;
			      			}			
			.productPage 	{ 
							     height:500px; width:1100px; 
							     margin-left: auto;
							     margin-right: auto;
							     padding:10px;
							     overflow-x:hidden;
							     overflow-y:auto  ;
						 	}
			.middle		 	{
							     display: table-cell;
							     vertical-align: middle;
							     border        : 1px solid #aaa;
						 	}
			.outerdiv    	{ 
								 height:550px; width:1100px;
				                 border: 1px solid #fafafa; 
				                 text-align: center;
				                 border-radius: 5px;
				                 margin: 0 auto;
						         display: table;
			                }
			
			
				.titlecore  {
								 display     : block;
							     position    : relative;
							     margin      : 0 auto;
						         margin-top  :  30px;
						         margin-bottom : 60px;
						         height      :  60px;
						         width       : 859px;
						         border      : 0px solid #fafafa;
							}
							
							
				.boximgpage { 
								  /*min-height  : 400px;*/
						      	  height  : 825px;
						      	  width   : 1150px; 
					  		}
				.boximgcore {
								  display     : block;
								  position    : relative;
								  margin      : 0 auto;
							      margin-top  : 30px;
							      max-height      : 734px;
							      width       : 859px;
							      border      : 1px solid #fafafa;
					      	} 
				.boximgroom { 
								  position : relative;
								  margin   : 0 auto;
								  float    : left;
								  margin-left: 2px;
								  margin-right: 2px;
								  margin-top  : 20px;
								  margin-bottom : 2px; 
								  height   : 350px;
								  width    : 280px;
								  border   : 1px solid #fafafa;
							} 
				.boximg 	{ 
								  position : relative;
								  margin   : 0 auto;
								  float    : left;
								  height   : 280px;
								  width    : 280px;
								  border   : 1px solid #fafafa;
							}




				/* style part */
				.stylepage  { 
							      min-height : 325px;
							      width      : 1150px; 
					  	    }
				.stylecore  {
								  display     : block;
							      position    : relative;
							      margin      : 0 auto;
						          margin-top  : 30px;
						          min-height  : 234px;
						          width       : 859px;
						          border      : 1px solid #fafafa;
				      		 }	
				.addbox      { 
								  position   : relative;
								  float      : left;	
								  margin-top :  10px;
								  margin-left:  26px;				
						          height     :  25px;
						          width      : 160px;
						          font-size  :  12px; 
						      }			
				.styleimgroom { 
								  position      : relative;
								  float         : left;
								  margin-left   : 25px;
								  margin-right  : 25px;
								  margin-top    : 20px;
								  margin-bottom : 3px; 
								  height        : 280px;
								  width         : 160px;
								  border        : 0px solid #fafafa;
							  }	 		
				.stylerow     { 
								  position:relative; 
								  clear:left;
								  margin-bottom : 5px;
								  min-height:300px; 
								  width: 850px; 
								  border : 0px solid #222;				
						      }	 
				.styleimgroom { 
								  position      : relative;
								  float         : left;
								  margin-left   : 25px;
								  margin-right  : 25px;
								  margin-top    : 20px;
								  margin-bottom : 2px; 
								  height        : 280px;
								  width         : 160px;
								  border        : 1px solid #fafafa;
							  }	 
				.styleimg 	  {
								  position : relative;
								  margin   : 0 auto;
								  float    : left;
								  height   : 160px;
								  width    : 160px;
								  border   : 1px solid #fafafa;
							  }			
							  
							  
							  
							  
							  
				.styleupload  {
								  position : relative;
								  margin   : 0 auto;
								  float    : left;
								  height   : 25px;
								  width    : 160px;
								  border   : 1px solid #eee;					
							  }	
				.styletexttitle {
								  position   : relative;
								  margin     : 0 auto;
								  margin-top : 3px;
								  float      : left;
								  height     : 23px;
								  width      : 125px;
								  font-size :  12px;
								  border     : 1px solid #eee;				
								}			  
				.styletext    {
								  position   : relative;
								  margin     : 0 auto;
								  margin-top : 3px;
								  float      : left;
								  height     : 26px;
								  width      : 160px;
								  border     : 1px solid #eee;
								}   		
				.stylename    	{ 
								  position : relative;
								  margin   : 0 auto;
								  float    : left;
								  height   : 25px;
								  width    : 160px;
								  border   : 1px solid #eee;									
							  	}			
				.deletestyle  	{
								  position : relative;
								  margin   : 0 auto;
								  float    : left;
								  height   : 25px;
								  width    : 160px;
								  border   : 1px solid #eee;	
							  	}			  
							  
				.editbar      	{
								  position   : relative;
								  float      : left;
								  margin-left: 150px;
								  margin-top : 10px;
								  height     : 30px;
							  	  width      : 900px;						  
							 	}
				.contentpage 	{ 
						          height  : 670px;
						          width   : 1150px; 
							 	}
							  
							  
						
			/* text infor style  */
			.formname 			{
								  height :  20px; 
								  width  :  80px; 
								  font-size : 18px;
			          			} 
			.gap      			{ 
								  height :  10px; 
					 			} 
			.page 				{ 
								  display : block;
							      position: relative;
						          margin  : 0 auto;
						          margin-top : 30px;
						          margin-bottom: 30px;
						          border  :   0px solid #e6e6e6;
						          border-radius: 5px;
						          box-shadow: 0px 0px 10px #e6e6e6;
				  				} 
			.textpage 			{ 
							      height  : 700px;
							      width   : 600px; 
					  			}
			.core 				{
								  display     : block;
							      position    : relative;
							      float       : left;
						          margin-left : 100px;
						          margin-top  : 30px;
						          height      : 300px;
						          width       : 400px;
						          border      : 0px solid #e6e6e6;
			      				}
			      				
			.home 				{
								  display     : block;
							      position    : relative;
							      margin      : 0 auto;
							      text-align  : center;
							      font-size   : 16px;
							      color       : #000;
							      text-decoration: none;
							    }
							    
			.coretitle    	    {
								  clear         : both;
								  margin-top    : 25px;
								  margin-left   : 63px;
								  margin-bottom : 0px;
								  height        : 20px;
								  width         : 500px;
							 	  font-size:    : 20px;
								  color         : #3dbbd4; 
						    	}
						    	
			.title 				{
								  display : block;
								  position: relative;
							      margin  : 0 auto;
							      text-align: center;
							      font-size: 20px;
							      font-weight: 800px;
							      height      : 30px;
							      width       : 400px;
				    			}
				    			
			.titlethin   		{
			        			  font-weight: 800;
								} 
								
			.titlethick  		{
			        			  font-weight: 300;
								}
			.mainbox 			{
							      height      : 300px;
							      width       : 400px;
					 			}
			.message 			{
						          height      : 80px;
						          width       : 200px;
					 			}
			.textbox 			{
						          height      : 30px;
						          width       : 400px;
						          font-size   : 18px;
						          border-radius: 5px;
						          border       : 1px solid #e6e6e6;
					 			}
			.pswdbox			{
							      height      : 30px;
							      width       : 400px;
							      font-size   : 18px;
							      border-radius: 5px;
							      border       : 1px solid #e6e6e6;
					 			}		 
			.submitbox 			{
							      height      : 30px;
							      width       : 400px;
					   			}
			.userboxselect 		{
							      height      : 30px;
							      width       : 400px;
							      border-radius: 5px;
							      border       : 1px solid #e6e6e6;
							      box-shadow   : 0px 0px 12px #66e0ff;
					 			}
			.pswdboxout			{
						          height      : 30px;
						          width       : 400px;
						          border-radius: 5px;
						          border       : 1px solid #e6e6e6;
					    		}
			.pswdboxuse 		{
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
			.showpswd  			{  
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
			.pageinfor 			{
								  display     : block;
							      position    : relative;
							      float       : left;
							      margin-top  : 300px;
							      margin-left : 50px;		
							      text-align  : center;
						          font-size   : 12px;
						        	
						          height      : 30px;
						          width       : 500px;
						          border      : 0px solid #e6e6e6;
							    }
			.bottominfor 		{
								  font-size: 12px;
								}
			.textboxover		{ 
								  animation-name     : textboxover;
								  animation-duration : 0.3s;
								  box-shadow: 0px 0px  5px #00aaff;
								}
			.textboxout 		{ 
								  animation-name     : textboxout;
								  animation-duration : 0.3s;
								  box-shadow: 0px 0px  0px #00aaff;
								}
			.textboxblur 		{    
								  animation-name     : textboxblur;
								  animation-duration : 0.3s;
								  box-shadow: 0px 0px 0px #00aaff;
								}
			.textboxfocus		{ 
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
			
			
			
			
			
			
			

			
			
			.button_over {
				
				height     : 200px;
				width      : 200px;
				border: 1px solid #222;
				
				background-image : url( "http://localhost:8080/Spring/img/default/productCenter/addProduct/upload.png" );

				animation-name     : animain;
				animation-duration : 0.3s;
			}
			
			
			.button_out {
				
				height     : 200px;
				width      : 200px;
				border: 1px solid #222;
				
				background-image : url( "http://localhost:8080/Spring/img/default/productCenter/addProduct/upload.png" );
				/*background-image   : url( "img/200_200.jpg" );*/
				
				animation-name     : animaout;
				animation-duration : 0.3s;
			}
			
			
			/**** upload img animation ****/			
			@keyframes animain {
				from {
					box-shadow: 0px 0px 3px #000000;
				}
				to   {
					box-shadow: 0px 0px 13px #C11;
				}
			}
			
			@keyframes animaout {
				from {
					box-shadow: 0px 0px 13px #C11;
				}
				to   {
					box-shadow: 0px 0px 3px #000000;
				}
			}
			
			
			
			
			
			/**************** new file input  ****************/
			.func                {	
									position     : relative;
									float        : left;
									margin-left  : 10px;
									margin-right : 10px; 
									height		 : 30px;
									width        : 30px;
									border-radius: 5px;		
								 }			
			
			.funcout             {	
									position     : relative;
									float        : left;
									margin-left  : 10px;
									margin-right : 10px; 
									height		 : 30px;
									width        : 30px;
									border-radius: 5px;
									background-color : #fff;
									box-shadow		 : 0px 0px  0px #fafafa;
									
									cursor           : pointer;
									
									animation-name     : funcout;
									animation-duration : 0.3s;					
								 }
								 
			.funcover            {
									position     : relative;
									float        : left;
									margin-left  : 10px;
									margin-right : 10px; 
									height		 : 30px;
									width        : 30px;
									border-radius: 5px;	
									
									cursor           : pointer;
									
									background-color : #eee;
									box-shadow		 : 0px 0px  3px #aaa;
									
									animation-name     : funcover;
									animation-duration : 0.3s;												
								} 
								
			@keyframes funcout  { 
									from {	background-color : #eee; 
											box-shadow		 : 0px 0px  3px #aaa;		} 
									to   {	background-color : #fff; 
											box-shadow		 : 0px 0px  0px #fafafa;   	} 
								} 
			
			@keyframes funcover { 
									from {	background-color : #fff; 
											box-shadow		 : 0px 0px  0px #fafafa;		} 
									to   {	background-color : #eee; 
											box-shadow		 : 0px 0px  3px #aaa;   	} 
								} 
								
								
								
			#viewpage           {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/0viewpage.png" );
								} 
			#bold 		     	{   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/1bold.png" );
								} 
			#italic             {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/2italic.png" );
								} 
			#addimg 		   	{ 
									background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/3addimg.png" );
								} 							
								
			#link               {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/4link.png" );
								} 
			#leftalign 		    {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/5leftalign.png" );
								} 
			#middlealign        {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/6middlealign.png" );
								} 
			#rightalign 		{   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/7rightalign.png" );
								} 
								
			#underline          {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/8underline.png" );
								} 
			#return 		    {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/9return.png" );
								} 
			#redo               {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/10redo.png" );
								} 
			#cleanpage 		    {   background-image : url( "<%=basePath%>/img/tinyicon/userCenter/productCenter/addProduct/11cleanpage.png" );
								} 
								
								
								
			label				{	display: block;	 }
			input[type="file"]  {   display: none;	 }
			input[type="button"]{   display: none;	 }
			
			
			
			/* add boximg bu*/
			.addboximg  		{
									position     : relative;
									float        : left;
									margin-left  : 5px;
									margin-right : 5px; 			
			
									height        : 200px;
									width         : 200px;
									border-radius : 5px;
									box-shadow    : 0px 0px 15px #aaa;
									color         : #eee;
									background-image : url( "<%=basePath%>/img/icon/userCenter/productCenter/addProduct/upload.png" );									
								}
								
		</style>
		
	</head>
	
	<body>
		
		<div  id="midcontent">
		
			<div class="titlecore">
			
				<div ><a class="home" href="<%=basePath%>">返回主页</a></div>
				
				<div class="title titlethick"><span>你好  <%=username%>&nbsp;</span></div>
				<div class="title titlethin" >欢迎添加新产品</div>
				
			</div>
			
			
			<div class="page boximgpage">

				<div class="boximgcore">
				
					<div class="coretitle">插入细节图</div>
					
					<% for ( int i = 0 ; i < 6 ; i++ ) { %>
						
						<div class="boximgroom" >
							<div class="boximg" >
								<div  id="imgbox<%=i%>">
									<!-- init img setting... -->
									<img src="<%=basePath%>/boxImgPath<%=i%>/<%=java.util.Calendar.getInstance().getTimeInMillis()%>"/>
								</div>
							</div>
							<form id="form<%=i%>" 
							      method="post" 
							  	  action="/Spring/boxImgUpload<%=i%>" 
							  	  enctype="multipart/form-data">
								<!-- File input --> 
								<label id="addimg"   class="func" style="width:40px;"> 
									<input class="tdwid" name="file" onchange="uploadImgBox<%=i%>()" type="file" />
									<!-- 
								    <input type="file"   name="pageImgJile" id="pageImgJile" multiple="true"/>
								      -->
								</label> 
								
								
							</form>
							<span>图片<%=i%></span>
						</div>

						<% if ( (i+1)%3==0 ) { %>
						<div class="gap"></div>
						<% } %>
						
					<% } %>	
					
				</div>

			</div>
			
			
			
			<!-- new framework -->
			<!-- 
			<div class="page boximgpage">
			
				<div class="boximgcore">
				
					<div class="coretitle">插入细节图</div>
					
					
					<!-- update experience -->
					<!--  
					<label class="addboximg"> 
					    <input type="file" class="addbox" id="addboximg" />
					</label> 
					  -->
					
					<div>
						<!-- 
						<label class="addboximg"> 
							<input  type="button" class="addbox" id="addboximg" value="点击插入细节图" />
						</label> 
						  -->
						
						
						<!-- 
						<a href="<%=basePath%>/userCenter/addProductTest">Add TEST</a>
					 	  -->
					</div> 
					
					
					<script>
					
					
						/*
						var boximgupload = document.getElementById('boximgupload');
						
					    function encodeImageFileAsURL() {
					    	
					        var filesSelected = document.getElementById("inputFileToLoad").files;
					        
					        if (filesSelected.length > 0) {
					        	
					          var fileToLoad = filesSelected[0];
					          
					          console.log( '' + fileToLoad.name );
					          console.log( '' + fileToLoad.type.substring(0,5) );
					          
						          if( fileToLoad.type.substring(0,5) == 'image' ) {
							          
							          var fileReader = new FileReader();
		
							          fileReader.onload = function(fileLoadedEvent) {
							          
							          var srcData  = fileLoadedEvent.target.result; // <--- data: base64
		
							          var newImage = document.createElement('img');
							              newImage.src = srcData;
		
							          document.getElementById("imgTest").innerHTML = newImage.outerHTML;
		
							          alert("Converted Base64 version is " + 
							                   document.getElementById("imgTest").innerHTML);
		
							          console.log("Converted Base64 version is " + document.getElementById("imgTest").innerHTML);
						          		
							      }
						          
					          }

					          fileReader.readAsDataURL(fileToLoad);

					        }
					        
					    }
					    
					    
							boximgupload.addEventListener( "change" , encodeImageFileAsURL , false );
							
						*/
						
					</script>
					
					
					
					
					
				</div>
			
			 
			</div>
			  
			
			<script>
			
				/*
				var boximgroom = document.getElementsByClassName('boximgroom');
				
					for( var i = 0 ; i < boximgroom.length ; i++ ) {
						boximgroom[i].style.display = 'none';
					}
				*/
			</script>
			
			
			
			
			
			
			
			<!-- style part -->
			<!-- 
			<div         class = "page stylepage">
			
				<div     class = "stylecore" id="stylecore">
				
					<div class = "coretitle">插入款式</div>
					
					<div>
						<input type="button" class="addstylebox" id="addstylebox" value="点击插入新款式" />
					</div>
					
					<%
					    
							String                      stylerow	  =        (     String               )session.getAttribute( "stylerow"      );
						Map<String,String>              stylename 	  =        ( Map<String,String>       )session.getAttribute( "stylename"     );
						Map<String,BoxImgBuffer>        styleimgsmall =        ( Map<String,BoxImgBuffer> )session.getAttribute( "styleimgsmall" );
						
						if((    stylerow 		   == null  )||
						   (    stylerow.length()  == 0    ))     stylerow      =  "0";
						if( 	stylename          == null  )     stylename     =  new  HashMap<String,String>(); 
						if(     styleimgsmall      == null  )     styleimgsmall =  new  HashMap<String,BoxImgBuffer>();
						
						
								System.out.println( "stylerow.length -- " + stylerow.length()	 );
								System.out.println( "stylerow --------- " + stylerow         	 );
								System.out.println( "stylename -------- " + stylename.size() 	 );
								System.out.println( "styleimgsmall	 -- " + styleimgsmall.size() );
						
						
						// calculate by quantity of stylename.
						for( int i =  0 ; i < (int)Integer.valueOf(stylerow) ; i++ ) {
						
					 %>
					
					<div class="stylerow">
					
						<%
							
							int    cursize    = 0;
							if ( ( stylename.size() - i*4 ) < 4 )
								   cursize    = stylename.size() - i*4;
							else   cursize    = 4;
							
							
							System.out.println( "----imgsmall key set----" );
							
							for( int n = 0 ; n < cursize ; n++ ) {
									
									/*
									Set<String> keyset  = styleimgsmall.keySet();
									Iterator    keyiter = keyset.iterator();
									while(keyiter.hasNext()) {
										String key = (String)keyiter.next();
										System.out.println( "ketset ------ " + key );
									}*/
									
									BoxImgBuffer boximg = styleimgsmall.get("styleimgsmall"+(i*4+n));
									
									System.out.println(     "imgsmall ---- " + (i*4+n) );
									
									String		 base64 = null;
									
								if (boximg!=null) {
									
									boximg.getBytes();
									
									System.out.println( "********img exists********" );
									System.out.println( "getOriginalFilename -- " + boximg.getOriginalFilename() );
									
									/*
						        	BASE64Encoder encoder = new BASE64Encoder();			    
						        	     		  base64  =  encoder.encode(boximg.getBytes());
						        	*/
								}
								
						 %>
						
						
						<div class="styleimgroom" >
						
							<div class="styleimg" >
								<% if (boximg!=null) { %>
									<img src="data:<%=boximg.getContentType()%>;base64,<%=base64%>"/>
								<% } %>
							</div>
							
							<form>
								<input type="file"       class="styleupload" name ="file"                          />
								<input type="text"       class="styletext"   value="请输入款式名称 : "readonly="true"    />
								<input                   class="stylename"   value="<%=stylename.get("style"+(i*4+n))%>" />
								<input type ="button"    class="deletestyle" value="删除款式"                         />
								<input type ="hidden"    class="stylecode"   value="<%=i*4+n%>"                             />
							</form>
							
						</div>
						
						
						<%  }  %>
						
					</div>
					 
					<% } %>
					
					<script>
						
						/* upload img part. */
						function styleimgupload(event) {
							
							var   files          =  event.target.parentNode.getElementsByClassName('styleupload')[0].files;
							
							if( ( files.length > 0 ) && (files[0].type.substring(0,5)=='image') ) { 
							
								var stylesum     =  document.getElementsByClassName('styleimgroom').length; 
								var imgbox       =  event.target.parentNode.parentNode.getElementsByClassName('styleimg')[0]; 
								var stylecode    =  event.target.parentNode.getElementsByClassName('stylecode')[0].value; 
								
									console.log( 'style quantity -- ' + stylesum ); 
									console.log( 'converting form...'            ); 
								
					            var img               = files[0]; 
				            	
			            		var imgdata = new FormData(); 
			            			imgdata.append( 'img'       ,        img   ); 
			            			imgdata.append( 'stylecode' ,  stylecode   ); 
			            			
								$.ajax( { 
											url         : 'styleimgUpload' , 
											type        : 'POST'           , 
											data        :  imgdata         , 
											processData :   false          , 
											contentType :   false          , 
											success     :   function(data) { 
								                imgbox.innerHTML = data; 
											} 
								}); 
								
							} 
							
						} 
						
						
						// init style img upload part 
						var styleuploads    = document.getElementsByClassName('styleupload');
						for( var i = 0 ; i <    styleuploads.length ; i++ ) {
							styleuploads[i].addEventListener( 'change' , styleimgupload , false );						
						}
						
						
						function storestyle(event) {
							
								//console.log( 'submit box...' );
							
							/*
								$("form#applyform").serialize();
							    var data = $("form#applyform").serialize();
							    
							    jQuery.each($('#file')[0].files, function(i, file) {
							        data.append('file-'+i, file);
						    });*/
						    
						    var stylenames   = document.getElementsByClassName ( 'stylename' );
						    
							var styledata    = new FormData();
							
							for( var i = 0 ; i < stylenames.length ; i++ ) {
								styledata.append( 'stylename' , encodeURI(stylenames[i].value) );
							}
							
							$.ajax( {
								       url  :   'storeStyle' ,
								       type :   'pOST'       ,
								       cache:    false       ,
								       data :    styledata   ,
								processData : 	 false       ,
								contentType : 	 false       ,
								success     :    function(data) {}
							});
							
						} 
								//storestyle();
						
						
						// store infor
						function addstore(event) {
							// -- record infor --
							var stylenames   = document.getElementsByClassName ( 'stylename' );	
							
							for( var i = 0 ; i < stylenames.length ; i++ ) 
								stylenames[i].addEventListener( 'keyup' , storestyle , false );
						}
						
						
						/* delete style. */
						function deletestyle(event) {
							/*console.log( 'deleting style...' );*/
							var parent = event.target.parentNode.parentNode.parentNode;
							var child  = event.target.parentNode.parentNode;
								parent.removeChild(child);
							if( parent.getElementsByClassName('styleimgroom').length < 1 ) 
								parent.parentNode.removeChild(parent);
							
							if( parent.getElementsByClassName('styleimgroom').length > 1 ) 
								storestyle();
							
						}
						
						
						/* init delete style part */
						var deletestylebox = document.getElementsByClassName('deletestyle');
						for( var i = 0 ; i < deletestylebox.length ; i++ ) {
							deletestylebox[i].addEventListener( 'click' , deletestyle , false );
						}
						
						
						/* add new style part */
						var addstylebox		  	   = document.getElementById(     'addstylebox' );
						var addstyle               = function(event) {
							
							   	       console.log( 'adding node.' );
					   	    
						var stylecore          = document.getElementById(         'stylecore'   );
						var stylerows          = document.getElementsByClassName( 'stylerow'    );
						var currow             = null;
						
						// style code part.
						 	currowcode         = 0;
						 	curstyle           = 0;
						 	reststyles         = 0;
						
						
						// 1.detect style quantity.
						for( var i = 0 ; (i < stylerows.length)&&(currow==null) ; i++ ) {
							if(stylerows[i].getElementsByClassName('styleimgroom').length<4) 
								 currow     = stylerows[i];
								 currowcode = i;
						}
						
						
						// 1.find cur styleimgcode.
						function curcode(event) {
							
							   stylerows          = document.getElementsByClassName( 'stylerow'    );
							
							if(stylerows.length > 0) {
								for( var i = 0 ; i <= currowcode ; i++ ) {
									curstyle = curstyle + stylerows[i].getElementsByClassName('styleimgroom').length;
								}
									reststyles= curstyle;
								
								// 2.rearrange rest of codes.
								for( var i = currowcode+1 ; i < stylerows.length ; i++ ) {
									
									stylecodes = stylerows[i].getElementsByClassName('stylecode');
									
									for( var i = 0 ; i < stylecodes.length ; i++ ) {
										reststyles = reststyles + 1;									
										stylerows[i].getElementsByClassName('stylecode')[i].value = reststyles;
										console.log( 'rest style -- ' + reststyles );
									}
								}
							}
						}
						
						
						// 2.new row
						if(currow==null) {
						   currow = document.createElement('div');
						   currow.className = 'stylerow';
						   stylecore.appendChild(currow);
						}
						
						   console.log( 'cur style  -- ' + curstyle );
						
						
						// add style
						function addstyle(currow) {
							
								curcode                =  document.getElementsByClassName('styleimgroom').length;
							
							var styleimgroom           =  document.createElement('div');
								styleimgroom.className = 'styleimgroom';
								
							var styleimg           	   =  document.createElement('div');
								styleimg.className 	   = 'styleimg';
								
							var form                   =  document.createElement('div');
								
							var fileinput            =  document.createElement('input');
								fileinput.type       = 'file';
								fileinput.className  = 'styleupload';
								fileinput.addEventListener( 'change' , styleimgupload , false );
								
								
							var deletebox            =  document.createElement('input');
								deletebox.type       = 'button';
								deletebox.className  = 'deletestyle';
								deletebox.value      = '删除款式';
								deletebox.addEventListener( 'click'  , deletestyle    , false );
								
								
							var styletext            =  document.createElement('div');
							var styletextin          =  document.createTextNode('请输入款式名称 : ');
								styletextin.className  = 'styletexttitle';
								styletext.appendChild(styletextin);
								//styletext.value      = '请输入款式名称 : ';
								//styletext.readonly   = 'true';
								
								
							var stylename            =  document.createElement('input');
								stylename.className  = 'stylename';
								
								
							var stylecode            =  document.createElement('input');
								stylecode.type       = 'hidden';
								stylecode.className  = 'stylecode';
								stylecode.value      =  curcode;
								
								
									 form.appendChild(fileinput);
									 form.appendChild(styletext);
									 form.appendChild(stylename);
									 form.appendChild(deletebox);
									 form.appendChild(stylecode);
							 
							 
							 styleimgroom.appendChild(styleimg );
							 styleimgroom.appendChild(    form );
							 
							 
								   currow.appendChild( styleimgroom );
							 
							 
						}
												 addstyle(currow);
												 addstore();
												 storestyle();
						}
						
									addstylebox.addEventListener( 'click' , addstyle , false );
						
			</script> 
				
				</div> 
				
			</div> 
			 -->
			
			
			<div class="page contentpage">
				
				
				<div       class="pagetop">
					<div   class="coretitle">插入详情页</div>
				</div>
				
				
				<div class="editbar"> 
				
					<a     href="<%=basePath%>/pageViewer.htm">
					<label id="viewpage" class="func"> 
					    <input type="button"   name="userpage" id="userpage"/> 
					</label> 
					</a>
					
					<label id="bold"     class="func"> 
					    <input type="button"   name="bold"    id="bold"/> 
					</label> 
			 		
			 		
					<label id="italic"   class="func"> 
					    <input type="button" name="italic" id="italic"/> 
					</label> 
					
					<label id="addimg"   class="func" style="width : 40px;"> 
					    <input type="file"   name="pageImgJile" id="pageImgJile" multiple="true"/>
					</label> 
					
					<label id="link"     class="func"> 
					    <input type="button" name="addlink" id="addlink"/>
					</label> 					
					
					
					<label id="leftalign" class="func"> 
					    <input type="button" name="setleft" id="setleft"/>
					</label> 
					
					<label id="middlealign" class="func"> 
					    <input type="button" name="setcenter" id="setcenter"/> 
					</label> 
					
					<label id="rightalign" class="func"> 
					    <input type="button" name="setright" id="setright" />
					</label> 
					
					
					<label id="underline"  class="func"> 
					    <input type="button" name="underline" id="underline"/>
					</label> 
					
					<label id="return"     class="func"> 
					    <input type="button" name="return" id="return"/>
					</label> 
					
					<label id="redo"       class="func"> 
					    <input type="button" name="redo"      id="redo"      />
					</label> 
					
					<label id="cleanpage"  class="func"> 
					    <input type="button" name="cleancontent" id="cleancontent" />
					</label> 
					
					
					<!-- 
					<a href="<%=basePath%>/pageViewer.htm"><button id="userpage">浏览页面</button></a>
					<button id="cleancontent">清除页面</button>
					<button id="setleft"     >向左对齐</button>
					<button id="setcenter"     >居中</button>
					<button id="setright"    >向右对齐</button>
					<button id="appendrtext" >添加文字</button>
					  -->
					
				</div>
				
				<script>
					
				var func	 = document.getElementsByClassName('func');
					
				var funcover = function(event) {
					console.log( 'mouseover...' );
					event.target.className = 'funcover';
				}	
				
				var funcout  = function(event) {
					console.log( 'mouseout...' );
					event.target.className = 'funcout';
				}
				
				for( i = 0 ; i < func.length ; i++ ) {
					/*
					func[i].getElementsByTagName('input')[0].addEventListener( 'mouseover' , funcover , false );
					func[i].getElementsByTagName('input')[0].addEventListener( 'mouseout'  , funcover , false );
					 */
					func[i].addEventListener( 'mouseover' , funcover , false );
					func[i].addEventListener( 'mouseout'  , funcout  , false );
				}
				
				</script>
				
				<div class="outerdiv">
					<div class="middle">
						<div id="productPage" class="productPage" contenteditable="true"><%=productPageURL%></div>
					</div>	
				</div>
				
				
			</div>
			
			
			<div class="page textpage">
			
			
				<div class="core">
				
					<table class="mainbox" border = "0">
					<form:form action="/Spring/userCenter/addProduct"
					           method="POST"
					           modelAttribute="product"
					           >
						    <tr>
						    <td   class="message">
						    <form:errors    style="color:#c11;" path="*" />
						    <div            style="color:#c11;"   >${message}</div>
						    <div            style="color:#008000;">${success}</div>
						    </td></tr>
						    
						    <tr>
						    <td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/userCenter/productCenter/name.png">&nbsp;产品名称  : </td>	
						    </tr>
	
						    <tr>
						    <td>
							    <form:label  path ="productname" />
							    <form:input  type ="text" class="textbox" name="username" id="username" value="${productname}" path ="productname" />
						    </td>
						    </tr>
	
						    <tr>
						    <td class="tvalid">${nameValidator}</td>
						    </tr>
	
						    <tr><td class="gap"></td><tr>
	
						    <tr>
						    	<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/userCenter/productCenter/price.png">&nbsp;产品价格 ( 格式   00.00  或  00 ) </td>
						    </tr>
	
						    <tr>
							    <td>
								    <form:label  path ="price" />
								    <form:input  path ="price" type="text" class="textbox" name="price" id="price"/>
								</td>
							</tr>
	
						    <tr>
							    <td class="tvalid">${priceValidator}</td>
							</tr>
	
						    <tr><td class="gap"></td><tr>
	
						    <tr>
						   		<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/userCenter/productCenter/quantity.png">&nbsp;产品数量   </td>
						    </tr>
	
						    <tr>
						    	<td>
								    <form:label  path ="quantity" />
								    <form:input  path ="quantity" type="text" class="textbox" name="quantity" id="quantity" />
								</td>    
						    </tr>
	
						    <tr>
							    <td class="tvalid">${quantityValidator}</td>
							</tr>
	
						    <tr><td class="gap"></td><tr>
	
						    <tr>
						    	<td class="formname">&nbsp;<img height="16" src="<%=basePath%>/img/tinyicon/userCenter/productCenter/category.png">&nbsp;选择品类    </td>
						    </tr>
	
						    <tr>
						    	<td>
								    <form:label  path="category" />
									<form:select     class="textbox" path ="category">
									   <form:option  value="" label="--------"/>
									   <form:options items="${categoryList}" />
									</form:select>
								</td>
						    </tr>
	
						    <tr>
							    <td class="tvalid">${categoryValidator}</td>
							</tr>
	
						    <tr><td class="gap"></td><tr>
	
						    <tr>
						    	<td align="left" colspan="2">
						    	<input type="submit" class="submitbox" id="submit" name="submit" value="提交" />
						   		</td>
						    </tr>
						</form:form>
	
					</table>
	
				</div>

				<div class="pageinfor"><a  class="bottominfor" href="">法律声明</a>&nbsp;<br /> yourstore copyright 2018 coporation</div>
				
			</div>
			
			
			<!-- css effect -->
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
				
			</script>
			
		</div>
		
	</body>
	
</html>


