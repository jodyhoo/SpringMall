<%@ page   language     ="java" 
           contentType  ="text/html; charset=UTF-8"
           pageEncoding ="UTF-8"
           import       ="java.util.*"
           import       ="com.bean.*"
           import       ="com.buffer.imgbuffer.BoxImgBuffer.LONGEREDGE"
           import       ="com.dao.uuid.UuidUtils"%>
<%                         request.setCharacterEncoding("utf-8"); 
    String basePath     =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();  
    String username     = (String)session.getAttribute("username"); 
	   if((username=="null")||(username==null)) { username=""; }
	String cartquantity = (String)session.getAttribute( "cartquantity" );
	   if((cartquantity=="null")||(cartquantity==null)) { cartquantity="0"; } 	
	
	/* product part. */
    String productid    = (String) session.getAttribute("productid"   );
    String productName  = (String) session.getAttribute("productName" );
    String productPrice = (String) session.getAttribute("productPrice");
    String seller       = (String) session.getAttribute("seller");
    
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		
		<title>产品展示</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<script src="<%=basePath%>/js/jQuery/jquery-3.2.1.js"></script>
		
		<style>
		
			/******** basic part. ********/
			*            { 		font-family     : 微软雅黑; 	  }
			body         {		margin          : 0;     	  }
			
			.unline      { 		text-decoration : none; 
						   		color           : #000;  
						   		cursor          : pointer;
						 }
			.blue        {		color           : #3dbbd4;    }	
					 
			.gap         {   	position        : relative;
							 	clear           : both;       }			 



			/******** title part. ********/
			.top         {   
							 position        : relative; 
							 top             :  0px; 
							 height          : 90px; 
							 min-width       : 1300px;
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
							     position   :relative;
								 margin-top : 13px;
								 margin-left: 50px;
				                 height     : 53px;
				             	 width      : 130px; 
				             	 float      : left;
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




			/******** productHead part. ********/			 			   
			.productHeadBlock       {
									   position:relative;
									   clear   :both;
									   width   : 1280px;
									   height  : 610px; 
							           background-color: #FFFFFF; 
							           margin-top: 10px; 
							           margin-left: auto;
							           margin-right: auto;
							           padding: 10px;
							           text-align: center;
							           box-shadow: 0px 0px 10px #fff;
								    }

            /******** BoxImg Block. ********/								    
			.productBoxImgBasic      {
									   position : relative;
									   float    : left;
									   border   : 0px solid #222;
								     }
			.productBoxImgBlock 	 {
									   width    : 510px;
									   height   : 600px; 
									 }	
			.productBoxImgCore       {
									   position : relative;
									   width    : 510px;
									   height   : 510px;
									   box-shadow: 0px 0px 10px #ccc; 
									 }
			.productBoxImg           {
									   position : absolute;
									   width    : 510px;
									   height   : 510px;
									   box-shadow: 0px 0px 10px #ccc; 
									 }
			.productBoxImgSmallBar   {
									   width    : 510px;
									   height   :  90px;
			                         }	
            .productBoxImgSmall		 {
									   width    : 75px;
									   height   : 75px;
									   margin-top: 12px;
			           				 }

			.productBoxImgSmallfocus {		
										box-shadow : 0px 0px 15px #39b8d2;
		                                animation-name     : productBoxImgsmallfocus;
										animation-duration : 0.3s;
			                         }           		
			.productBoxImgSmallblur  {
										box-shadow : 0px 0px 15px #ccc;
		                                animation-name     : productBoxImgsmallblur;
										animation-duration : 0.3s;
			                         }      

			.productBoxImgSmallGap   {
									   width    : 12px;
									   height   : 11px;
			                         }	
			@keyframes 
			 productBoxImgsmallfocus {
									   from { box-shadow : 0px 0px 15px #ccc;    }
									   to   { box-shadow : 0px 0px 15px #39b8d2; }
								   	 }
			@keyframes 
			 productBoxImgsmallblur  {
									   from { box-shadow : 0px 0px 15px #39b8d2; }
									   to   { box-shadow : 0px 0px 15px #ccc;    }
									 }





			/******** productInforBlock. ********/
			.productInforBlock      {
									   width    : 435px;
									   height   : 580px;
									   padding  : 10px; 
									}
            .productInforBasic      {
									   position : relative;
									   float    : left;
									   border   : 0px solid #f6f6f6;
									}
 	        .productInforGap    {
								   width    : 431px;
								   height   : 80px;
								   padding  : 2px; 		
	        					}
 	        .productNameBar     {
								   width    : 431px;
								   height   : 60px;
								   padding  : 2px; 
								   font-size: 18px;
								   font-variant: 2px;
								   font-weight : 500;
								   font-family : 微软雅黑;		
	        					}



		    /******** productPriceBlock. ********/
	 	    .productInforPriceBar      {
											   width       : 431px;
											   height      : 30px;
											   padding     : 2px; 
											   font-size   : 14px;
											   font-variant: 2px;
											   font-weight : 500;
											   font-family : 微软雅黑;			
		        					 	   }
			.productInforPriceName {
											   width    : 196px;
											   height   : 20px;
											   padding  : 4px; 
											   font-size: 14px;
											   font-variant: 2px;
											   font-weight: 500;
											   font-family: 微软雅黑;			        	
			       						   }
		 	.productInforPrice     {
											   width    : 216px;
											   height   : 20px;
											   padding  : 4px; 
											   font-size: 18px;
											   color    : #C11;
											   font-variant: 2px;
											   border: 0.1px solid #c11;
											   background-color: #fff6f6;
											   font-weight: 800;
											   font-family: Times NewRoman;		
			        					   }
 	        .productInforPriceDescountName {
											   width    : 200px;
											   height   : 24px;
											   padding  : 2px; 
											   font-size: 18px;
											   font-variant: 2px;
											   font-weight: 500;
											   font-family: 微软雅黑;			
	        							   }
 	        .productInforPriceDescountTime {
											   width    : 216px;
											   height   : 20px;
											   padding  : 4px; 
											   font-size: 14px;
											   color    : #C11;
											   font-variant: 2px;
											   border: 0.1px solid #c11;
											   background-color: #fff6f6;
											   font-weight: 800;
											   font-family: 微软雅黑;		
	        							   }
	        .productStyleBar         {
	        						   margin       : 0 auto;
									   width        : 431px;
									   min-height   : 110px;
									   padding      : 2px; 		
	        						 }
	        .productStyle            {
	        						   margin-left  : 4px;
	        						   margin-top   : 4px;
									   height       : 24px;
									   padding-top  : 2px;
									   padding-bottom: 2px;
									   padding-left : 20px;
									   padding-right: 20px;
									   border       : 2px solid #555;
									   border-radius: 2px;
									   text-align: center;		
									   font-size: 16px;
									   font-variant: 2px;
									   font-family: 微软雅黑;	
	        						 }


            .productStyleDefault    {

                                     }
            .productStyleSelected    {
									   border       : 2px solid #555;
	        						   background-color: #f6f6f6;
                                     }


	        .productAddCartBar       {
									   width    : 431px;
									   height   :  40px;
									   padding  : 2px; 		
	        						 }	       
	        .productAddCart          {
									   width    : 430px;
									   height   :  30px;
	        						 }	 


	        .productInforDescription {
									   width    : 431px;
									   height   : 180px;
									   padding  : 2px; 	
	        						 }



            /******* storeInforBlock. *******/
            .storeInforBlock         {
									   width    : 292px;
									   height   : 578px;
									   padding  : 10px;		
									   border   : 1px solid #f6f6f6;
                                     }
		    .storeInforBasic     	 {
									   position : relative;
									   float    : left;
									   border   : 1px solid #f6f6f6;
		        					 }                        
		    .storeInforTopGap    		 {
										   width    		: 292px; 
										   height   		:  80px; 
		        					 	 }
		    .storeInforCore      		 {
										   width    		: 284px; 
										   height   		: 460px; 
										   padding  		:   4px; 
		        					 	 }
		    .storeInforNameBlock 		 {
										   width      		:  286px; 
										   min-height 		:   80px;
										   max-height 		:  200px; 
										   border     		:    0px solid #222;
			        					 }
			.storeNameText       		 {
										   position 		: relative; 
										   float    		:   left; 
										   width    		: 100px; 
										   height   		:  20px; 
										   font-size		:  14px; 
										   padding  		:   1px; 
										   text-align       : left; 
										   background-color : #fafafa; 
										   border-bottom    :   1px solid  #e8e8e8; 
										   font-family		: 微软雅黑; 
			        				     }
			.storeNameContent    		 {
										   position 		: relative;
										   float    		:   left; 	
										   width    		: 178px;
										   height           :  20px; 
										   font-size		:  14px;
										   padding  		:   1px;
										   text-align       :   left;
										   background-color :  #fcfcfc;
										   border-left      :   1px solid #e8e8e8;  
										   border-bottom    :   1px solid #e8e8e8;
										   font-family      :    微软雅黑;
									 	 }
			.storeInforCredit    		 {
										   width    		: 276px;
										   height   		: 200px;	
										   padding  		:   4px;		
			        					 }



			/* recommendation part. */
			.recommendBlockBasic {
									 position: relative;
									 float   : left;
								 }
			.recommendTitle      {
									 position: relative;
									 clear   : both;
									 margin-top    : 25px;
									 margin-left   : 63px;
									 margin-bottom : 0px;
									 height  : 20px;
									 width   : 500px;
									 font-size:  : 20px;
									 color : #3dbbd4; 
									 font-family : 微软雅黑;
						         }
			.recommendCore       {
								     position   : relative;
								     margin     :  0 auto;  
									 margin-top :   20px;
									 height  	:  320px;
									 width   	: 1288px;
						         }						        
			.recommendBoxes      {
									 margin 	: 0 auto;
									 height  	:  290px;
									 width   	: 1288px;
							     }


				/* recommendMid part. */ 
			.recommandMidButton      {
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
			.recommendMidBox     {
											 margin-top  : 20px;
											 margin-left : 5px;
											 margin-right : 5px;
							                 height  : 250px;
							             	 width   : 160px;
											 display: block;
									 }
			.recommendMidBoxImg      {
											 margin-top  : 0px;
											 margin-left : 0px;
							                 height      : 160px;
							             	 width       : 160px;
							             	 /* box-shadow: 0px 0px 10px #111; */
											 display: block;
											 vertical-align: middle;
											 text-align: center;
								 	 }	
			.recommendMidNameText    { 
											 margin-top  : 0px;
											 margin-left : 0px;
											 height      : 40px;
											 width       : 160px;
											 font-size   : 14px; 
											 display: block;
								     }
			.recommendMidPriceText   { 
											 margin-top  : 0px;
											 margin-left : 0px;
											 height      : 20px;
											 width       : 160px;
											 text-align    : left; 
											 vertical-align: text-bottom;
											 font-size   :  14px;
											 display: block;
									 }     
			.recommendMidBoxRowGap   { 
											 margin-top : 0px;
											 clear:both; 
									 }
									 
			.recimg                  {
											 max-height : 160px;
											 max-width  : 160px;
									 }						 
									 



		    /******** productPageInfor ********/
			.productPageBasic    {
									 position     : relative;
									 display      : block;
									 margin       : 0 auto;
									 width        : 1300px;
									 overflow     : hidden;
								 }
			.productPageBlock    {
									 position     :  relative;
									 display      :  block;
									 margin       :  0 auto;
									 margin-top   : 20px;
									 width        : 1300px;
                                     overflow     : hidden;
						         }




            /******** comment part. ********/
            .commentcore           {
            						 position     : relative;
            						 float        :   left;
            						 margin-left  :   10px;
            					   }
            .commenttable          {
									 max-width    : 1306px;
									 width        : 1306px;
            					   }
			.commenttd             {        
									 vertical-align : top;	 
								   }
			.commentCore           {
									 position      : relative;
									 clear         : left;
									 margin-top    :   50px;
									 margin-left   :   60px;

									 height     : 100%;
									 /*max-height    : 1200px;*/
									 width         :  700px;
							       }
            .commentTitle          {
									 position      : relative;
									 float         : left;
									 margin-bottom : 20px;
									 margin-left   : 20px;
									 height        : 20px;
									 width         : 700px;
									 font-size:    : 20px;
									 color         : #3dbbd4; 
									 border        : 0px solid #eee;
            					   }
			.commentBox            {
									 margin-top    :   20px;
									 margin-left   :    5px;
									 margin-right  :    5px;
					                 height        :  300px;
					             	 width         :  800px;
									 display       :  block;
							       }

			.commentPage           {
										 margin-top    : 0px;
										 margin-bottom : 20px;
										 margin-left   : 0px;

										     height    : 100%;
						                 max-height    : 620px;

						             	 width         : 700px;
						             	 clear         : left;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display       : block;
										 vertical-align: middle;
										 text-align    : center;
										 border        : 0px solid #eee;
							 	   }

			.commentBoxImgCore     {
						                 height        : 160px;
						             	 width         : 700px;
						             	 clear         : left;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display       : block;
										 vertical-align: middle;
										 text-align    : center;
										 border        : 0px solid #eee;
							 	   }	
			.commentBoxImg		   {
										 margin-top    :   0px;
										 margin-right  :  10px;
						                 height        : 160px;
						             	 width         : 160px;
						             	 float         : left;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display       : block;
										 vertical-align: middle;
										 text-align    : center;
										 border        : 0px solid #eee;
							 	   }		 	   

            /* user part. */
            .commentuser           {
										 margin-top    : 4px;
										 margin-left   : 0px;
										 height        : 40px;
										 width         : 398px;
										 text-align    : left; 
										 vertical-align: text-bottom;
										 font-size     :  14px;
										 display       : block;
										 clear         : left;
										 border        : 0px solid #eee;
            					   }
			.commentprotrait       { 
										 margin-top    :    0px;
										 margin-left   :    0px;
										 height        :   40px;
										 width         :   40px;
										 font-size     :   14px;
										 display       :  block;
										 float         :   left;
								   } 
			.commentName           { 
										 margin-top    :   10px;
										 margin-left   :    6px;
										 height        :   40px;
										 width         :  200px;
										 font-size     :   14px;
										 display       :  block;
										 float         :   left;
							       }


            /* style part. */
            .commentstylebar       {
										 margin-top    :   4px;
										 margin-bottom :   4px;
										 margin-left   :   0px;

										     height    : 100%;
										 max-height    :  300px;
										 
										 width         : 700px;
										 text-align    : left; 
										 vertical-align: text-bottom;
										 font-size     :  14px;
										 display       : block;
										 clear         : left;
										 border        :   1px solid #eee;
            					   }
  			.commentstyleblock     {
										 margin-top    :    4px;
										 margin-left   :    4px;

										 height        :  100%;
										 max-height    :   60px;

										 width         :  600px;
										 float         :  left;
										 text-align    :  left; 
										 vertical-align: text-bottom;
										 font-size     :   16px;
										 display       : block;
										 border        :    1px solid #eee;
  								   }          					   
            .commentstyle          {
										 margin-top    :   0px;
										 margin-left   :   0px;
										 height        :  22px;
										 width         :  80px;
										 float         :  left;
										 text-align    :  left; 
										 vertical-align: text-bottom;
										 font-size     :  16px;
										 display       : block;
										 border        :   0px solid #eee;
            					   }
			.commentstylepic       { 
										 height        :   40px;
										 width         :   40px;
										 font-size     :   14px;
										 display       :  block;
										 float         :   left;
								   } 
			.commentstylename      { 
										 margin-top    :   10px;
										 margin-left   :    6px;
										 height        :   20px;
										 width         :  400px;
										 font-size     :   14px;
										 display       :  block;
										 float         :   left;
							       }							       
			/********/				       



			.commentstarBlock      {
										 margin-top    :    0px;
										 margin-left   :   42px;
										 height        :   34px;
										 width         :  180px;
										 font-size     :   14px;
										 display       :  block;
										 clear         :   left;
										 text-align    :   left;
										 border        :  0px solid #eee;
								   }			
			.commentdate           {
										 margin-top    :    0px;
										 margin-left   :   40px;
										 height        :   18px;
										 width         :  300px;
										 color         :  #666;
										 font-size     :   13px;
										 display       :  block;
										 text-align    :   left;
										 clear         :   left;
										 padding-left  :    8px;
										 border        :    0px solid #eee;
										 border-radius :    5px;
								   }					   	       
			.comment               {
										 margin-top    :    5px;
										 margin-left   :   40px;

										 height        :   100%;
										 max-height    :  200px;

										 width         :  584px;
										 font-size     :   15px;
										 display       :  block;

									     overflow-x    : hidden;
										 overflow-y    :   auto;

										 text-align    :   left;
										 clear         :   left;
										 padding       :    8px;
										 border        :    0px solid #555;
										 border-radius :    5px;
								   }


			.commentpage           {
										 margin-top    :    0px;
										 margin-left   :   60px;

										 height        :   45px;
										 width         :  700px;
										 font-size     :   18px;
										 display       :   block;
										 text-align    :   center;
										 padding-top   :   20px;
										 clear         :   left;
										 border        :    0px solid #eee;
									}					   
			.commentgap        		{
											float        : left;
										    margin-left  : 5px;
											margin-right : 20px;
											margin-top   :  0px;
											margin-bottom:  0px; 
											height       : 50px;
											width        : 35px;
								   }			



			.commentrecCore           {

										 position      : relative;
										 clear         : left;
										 margin-top    :   50px;
										 margin-left   :   60px;
	
										    height     : 100%;
										 /*max-height    : 1200px;*/
	
										 width         :  400px;
										 border        :    0px solid #eee;
									 
							        }

            .commentrecTitle        {
										 position      :  relative;
										 float         :  left;
										 margin-bottom :  20px;
										 margin-left   :  20px;
										 height        :  20px;
										 width         : 400px;
										 font-size:    :  20px;
										 color         : #3dbbd4; 
										 border        :   0px solid #eee;
            					    }
			.commentrecBox      {
										 margin-top    :   20px;
										 margin-left   :    5px;
										 margin-right  :    5px;
						                 height        :  300px;
						             	 width         :  800px;
										 display       :  block;
							        }

			.commentrecPage         {
										 margin-top    :   0px;
										 margin-bottom :  20px;
										 margin-left   :   0px;

										     height    : 100%;
						                 max-height    : 620px;

						             	 width         : 400px;
						             	 clear         : left;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display       : block;
										 vertical-align: middle;
										 text-align    : center;
										 border        : 0px solid #eee;
							 	    }
			
			.commentrecBoxImgCore   {
						                 height        : 160px;
						             	 width         : 400px;
						             	 clear         : left;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display       : block;
										 text-align    : center;
										 border        : 0px solid #eee;
							 	    } 
			.commentrec             {
										 margin-top    :    0px;
										 margin-left   :   40px;
										 height        :  200px;
										 width         :  302px;
										 font-size     :   15px;
										 display       :  block;

										 text-align    :   left;
										 clear         :   left;

									     overflow-x:hidden;
										 overflow-y:auto  ;

										 padding       :    8px;
										 border        :    0px solid #eee;
										 border-radius :    5px;										 
								    } 
			.commentusebar          { 
										 margin-top    :    0px;
										 margin-left   :   46px;

										 height        :   35px;
										 width         :  584px;
										 color         :  #666;
										 font-size     :   14px;
										 display       :   block;
										 text-align    :   left;
										 padding-top   :   10px;
										 clear         :   left;
										 border        :    0px solid #f6f6f6;										 
									}

            /* recommend style part. */
            .commentrecstylebar       { 
										 margin-top    :   4px;
										 margin-bottom :   4px;
										 margin-left   :   0px;

										     height    : 100%;
										 max-height    :  300px;
										 
										 width         : 420px;
										 text-align    : left; 
										 vertical-align: text-bottom;
										 font-size     :  14px;
										 display       : block;
										 clear         : left;
										 border        :   0px solid #eee;
            					   	  } 
  			.commentrecstyleblock     { 
										 margin-top    :    2px;
										 margin-left   :    2px;

										 height        :  100%;
										 max-height    :   60px;

										 width         :  400px;
										 float         :  left;
										 text-align    :  left; 
										 vertical-align: text-bottom;
										 font-size     :   16px;
										 display       : block;
										 border        :    0px solid #eee;
  								      } 
			.commentrecstylepic       { 
										 height        :   40px;
										 width         :   40px;
										 font-size     :   14px;
										 display       :  block;
										 float         :   left;
								      }
			.commentrecstylename      { 
										 margin-top    :   10px;
										 margin-left   :    6px;
										 height        :   20px;
										 width         :  280px;
										 font-size     :   14px;
										 display       :  block;
										 float         :   left;
										 border        :    0px solid #eee;  
							       }								   
			/********/	


			/* button */
			.commentuse             {
										 height        :   22px;
										 width         :   80px;
										 font-size     :   12px; 
									}

			.commentrecpage         {
										 margin-top    :    0px;
										 margin-left   :   60px;

										 height        :   45px;
										 width         :  700px;
										 font-size     :   18px;
										 display       :   block;
										 text-align    :   center;
										 padding-top   :   20px;
										 clear         :   left;
										 border        :    0px solid #eee;
									}



		  /* issue part */
			.issueblock             {
										 margin-top    :    20px;
										 margin        :    0 auto; 
										 height        :   190px;
										 width         :  1300px;
										 display       :   block;
										 text-align    :   center;
										 padding-top   :    20px;
										 clear         :   left;
										 border        :     0px solid #eee;	
									}						
            .issuetitle             {
										 position      : relative;
										 margin-left   :    60px;
										 margin-bottom :    20px;
										 height        :    20px;
										 width         :   400px;
										 font-size     :    16px;
										 text-align    :    left;
										 color         : #3dbbd4; 
										 border        :     0px solid #eee;
            					    }
			.issuecore              {
										 margin-top    :    20px;
										 margin-left   :    60px; 
										 height        :   60px;
										 width         :  1180px;
										 font-size     :    18px;
										 display       :   block;
										 text-align    :   left;
										 font-size     :    16px;
										 padding-top   :    20px;
										 clear         :   left;
										 border        :     0px solid #eee;	
									}	
            .issuebox               {
										 margin-top    :     2px;
										 margin-left   :     0px;
										 height        :   22px;
										 width         :   600px;
										 font-size     :    18px;
										 display       :   block;
										 text-align    :   left;
										 padding-top   :    20px;
										 clear         :   left;
										 border        :     0px solid #eee;	            	
            						}
            .issuesubmit 			{
										 height        :    26px;
										 width         :   150px;
										 font-size     :    14px;
            						}			




		  /* video part */
			.videoblock             {
										 margin-top    :    20px;
										 margin        :    0 auto; 
										 height        :   450px;
										 width         :  1300px;
										 font-size     :    18px;
										 display       :   block;
										 text-align    :   center;
										 padding-top   :    20px;
										 clear         :   left;
										 border        :     1px solid #eee;	
									}						
            .videotitle             {
										 position      : relative;
										 margin        :    0 auto;
										 margin-bottom :    20px;
										 height        :    20px;
										 width         :   400px;
										 font-size     :    20px;
										 text-align    :    center;
										 color         : #3dbbd4; 
										 border        :     0px solid #eee;
            					    }
			.videocore              {
										 margin-top    :    20px;
										 margin        :    0 auto; 
										 height        :   370px;
										 width         :  1180px;
										 font-size     :    18px;
										 display       :   block;
										 text-align    :   center;
										 padding-top   :    20px;
										 clear         :   left;
										 border        :     0px solid #eee;	
									}	
            .videobox               {
										 margin-top    :     2px;
										 margin        :    0 auto; 
										 height        :   330px;
										 width         :   580px;
										 font-size     :    18px;
										 display       :   block;
										 text-align    :   center;
										 padding-top   :    20px;
										 clear         :   left;
										 border        :     1px solid #eee;	            	
            						}





			/* title animation. */
			.titleunit_out {    
				animation-name     : titleunit_out;
				animation-duration : 0.3s;
				color  : #92afbd;
				background-color: #002739;
			}
			.titleunit_over{ 
				animation-name     : titleunit_over;
				animation-duration : 0.3s;
				color  : #cce6f2;
				background-color: #020c14;
			}
			@keyframes titleunit_over {
				from   { color  : #92afbd;
					     background-color: #002739; }
				to     { color  : #cce6f2;
						 background-color: #020c14; }
			}
			@keyframes titleunit_out {
				from   { color  : #cce6f2;
					     background-color: #020c14; }
				to     { color  : #92afbd;
					     background-color: #002739; }
			}


			.titletable       {  
							     position: relative;
							     margin  : 0 auto;
							     height: 30px;
				                 width : 800px;
				                 text-align: center;
				                 padding: 2px;
				                 color  : #92afbd;
				                 font-size:  16px;
			               	  }
			.titleunit        {  
								 width : 80px; 
						      }



			/******** content part. ********/
			.contentboxdigit  { 
								 z-index : 0; 
							     margin-top: 10px;
							     height: 450px;
							     width : 1000px;
							     box-shadow: 0px 0px 8px #000;
						      }

			.contentdigitblock{ 
								 height: 410px;
							     width : 1020px;
							     /*box-shadow: 0px 0px 8px #222;*/
			                  }

			.contentbox3c     { 
								 height: 400px;
							     width : 495px;
								 margin-top: 10px;
								 margin-left: 10px;
								 float : left ;
								 box-shadow: 0px 0px 8px #222;
						      }

			.digitbarnner     { 
								 position: absolute;
								 margin-top : 10px;
								 margin-left : 10px;
								 height: 65px;
								 width : 795px;
								 background-image : url( "img/digitbar/bar.jpg" ); 
								 border-radius: 5px;
								 box-shadow: 0px 0px 8px #222;
								 text-align: left;
						       }

		    .digittitleblock   { 
		    					 position: absolute;
							     margin-top : 10px;
							     margin-left : 16px; 
							     text-align:  center;
							   }
			.digittitle        { 
								 font-size: 20px;
								 color: #FFF; 
							   }
			.digitsubtitle     {
								 font-size: 14px;
								 font-family: Times NewRoman;
							 	 color: #FFF; 
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
					<input type="hidden" id="basePath"  value="<%=basePath%>" />
					<input type="hidden" id="username"  value="<%=username%>" />
					<input type="hidden" id="productid" value="<%=productid%>" />
				
				</div> 
				
				<!-- indexbox effect -->
				<script>
					
					/* get init value. */
					var basePath    = document.getElementById( 'basePath'    ).value;
					
					var keyword     = document.getElementById( 'keyword'     );
					var indexsubmit = document.getElementById( 'indexsubmit' );
					
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
					
					
					/**** ****/		 
					/*
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
					*/
					
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
							
							window.location = basePath+'/productPage'  ;
							
						}
					}
						maccbu.addEventListener( 'click' , macc , false );
						
						
				</script>
				
			</div>
			
		</div>
		
		
		<!-- productImgBlock. -->
		<div class="productHeadBlock">
			
			<div         class="productBoxImgBlock     productBoxImgBasic">
				<div     class="productBoxImgCore      productBoxImgBasic">

					<div id   ="productBoxImg0"
					     class="productBoxImg" ></div>

					<div id   ="productBoxImg1"
					     class="productBoxImg" ></div>

					<div id   ="productBoxImg2"
					     class="productBoxImg" ></div>

					<div id   ="productBoxImg3"
					     class="productBoxImg" ></div>

					<div id   ="productBoxImg4"
					     class="productBoxImg" ></div>

					<div id   ="productBoxImg5"
					     class="productBoxImg" ></div>

				</div>

				<div     id   ="productBoxImgSmallBar"
				         class="productBoxImgSmallBar  productBoxImgBasic">

					<div id   ="productBoxImgSmall0"
					     class="productBoxImgSmall     productBoxImgBasic  productBoxImgSmallblur"></div>
					<div class="productBoxImgSmallGap  productBoxImgBasic"></div>

					<div id   ="productBoxImgSmall1"
					     class="productBoxImgSmall     productBoxImgBasic  productBoxImgSmallblur"></div>
					<div class="productBoxImgSmallGap  productBoxImgBasic"></div>

					<div id   ="productBoxImgSmall2"
					     class="productBoxImgSmall     productBoxImgBasic  productBoxImgSmallblur"></div>
					<div class="productBoxImgSmallGap  productBoxImgBasic"></div>

					<div id   ="productBoxImgSmall3"
					     class="productBoxImgSmall     productBoxImgBasic  productBoxImgSmallblur"></div>
					<div class="productBoxImgSmallGap  productBoxImgBasic"></div>

					<div id   ="productBoxImgSmall4"
					     class="productBoxImgSmall     productBoxImgBasic  productBoxImgSmallblur"></div>
					<div class="productBoxImgSmallGap  productBoxImgBasic"></div>

					<div id   ="productBoxImgSmall5"
					     class="productBoxImgSmall     productBoxImgBasic  productBoxImgSmallblur"></div>

				</div>
			</div>
			
			<!-- load function -->
			<script>
				
			
				$.ajax( {
					url         : 'boxImgsmall0',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImgsmall0 data        -- ' + data );
						    console.log( 'boxImgsmall0 data.length -- ' + data.length );
						$('#productBoxImgSmall0').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImgsmall1',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImgsmall1 data        -- ' + data );
						    console.log( 'boxImgsmall1 data.length -- ' + data.length );
						$('#productBoxImgSmall1').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImgsmall2',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImgsmall2 data        -- ' + data );
						    console.log( 'boxImgsmall2 data.length -- ' + data.length );
						$('#productBoxImgSmall2').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImgsmall3',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImgsmall3 data        -- ' + data );
						    console.log( 'boxImgsmall3 data.length -- ' + data.length );
						$('#productBoxImgSmall3').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImgsmall4',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImgsmall4 data        -- ' + data );
						    console.log( 'boxImgsmall4 data.length -- ' + data.length );
						$('#productBoxImgSmall4').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImgsmall5',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImgsmall5 data        -- ' + data );
						    console.log( 'boxImgsmall5 data.length -- ' + data.length );
						$('#productBoxImgSmall5').html(data);
					}
				});
				
				
				
				
				$.ajax( {
					url         : 'boxImg0',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImg0      data        -- ' + data );
						    console.log( 'boxImg0      data.length -- ' + data.length );
						$('#productBoxImg0').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImg1',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImg1      data        -- ' + data );
						    console.log( 'boxImg1      data.length -- ' + data.length );
						$('#productBoxImg1').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImg2',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImg2      data        -- ' + data );
						    console.log( 'boxImg2      data.length -- ' + data.length );
						$('#productBoxImg2').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImg3',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImg3      data        -- ' + data );
						    console.log( 'boxImg3      data.length -- ' + data.length );
						$('#productBoxImg3').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImg4',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImg4      data        -- ' + data );
						    console.log( 'boxImg4      data.length -- ' + data.length );
						$('#productBoxImg4').html(data);
					}
				});
				
				$.ajax( {
					url         : 'boxImg5',
					type        : 'GET'         ,
					success     :  function(data) {
						    console.log( 'boxImg5      data        -- ' + data );
						    console.log( 'boxImg5      data.length -- ' + data.length );
						$('#productBoxImg5').html(data);
					}
				});
				
				
			</script>
			
			<!-- display function -->
			<script>
				
				var initboximg     = function() {
					document.getElementById('productBoxImgSmall0').className     = 
											"productBoxImgSmall productBoxImgBasic productBoxImgSmallfocus";
					document.getElementById('productBoxImg0'     ).style.display = 'block';		
				}
				
				var productBoxImgs = document.getElementsByClassName('productBoxImg');
				for( var i = 0 ; i < productBoxImgs.length ; i++ ) {
					 productBoxImgs[i].style.display = 'none';
				}
	
					initboximg();
				
				var code = 0;
				
				var showboximg     = function(node) {
	
					// set block hide.
					document.getElementById('productBoxImg'      +code).style.display = 'none';
					document.getElementById('productBoxImgSmall' +code).className     = "productBoxImgSmall productBoxImgBasic productBoxImgSmallblur";
	
					// 1.get code.
					code = node.id.toString().substring( node.id.toString().length-1 ,
						                                 node.id.toString().length  );
					
					// 2.set boximg      display.
					document.getElementById('productBoxImg'+code).style.display = 'block';
	
					// 3.set boximgsmall focus
					node.className  = "productBoxImgSmall productBoxImgBasic productBoxImgSmallfocus";
	
					console.log( "finsih set class." );
				}
				var displayimg      = function() {
					showboximg(this);
				}
	
				var productBoxImgSmalls = document.getElementsByClassName('productBoxImgSmall');
				for( var i = 0 ; i < productBoxImgSmalls.length ; i++ ) {
					 productBoxImgSmalls[i].addEventListener( "mouseover" , displayimg , false );
				}
				
			</script>
			
			
			<div         class="productInforBlock              productInforBasic">
				<div     class="productInforGap                productInforBasic"></div>
				<div     class="productNameBar                 productInforBasic">${productName}</div>

				<div     class="productInforPriceBar           productInforBasic">
					<div class="productInforPriceName          productInforBasic">价 格: </div>
					<div class="productInforPrice              productInforBasic">￥${productPrice}</div>
				</div>
				
				<div     class="productInforPriceBar           productInforBasic">
					<div class="productInforPriceDescountName  productInforBasic"></div>
					<!-- 
					<div class="productInforPriceDescountTime  productInforBasic">倒计时 1 天 19 时 20 分 18 秒 </div>
				 	  -->
				</div>
				
				
				<div     class="productStyleBar                productInforBasic">
				
					<% 
							List<String>          styleimgList            =  (List<String>)session.getAttribute( "styleimgList"            ); 
							List<String>          styleimgsmallList       =  (List<String>)session.getAttribute( "styleimgsmallList"       );
							List<String>          styleImgLongerEdgeList  =  (List<String>)session.getAttribute( "styleImgLongerEdgeList"  ); 
							
							List<String>          styleimgnameList        =  (List<String>)session.getAttribute( "styleimgnameList"        ); 
					 		
					 		
							Iterator                      nameiter        =   styleimgnameList.iterator();
					 		
							
							for( int i = 0 ; nameiter.hasNext() ; i++ ) {
								
								 String name = (String)nameiter.next();
					 %>
						
						<% if( styleimgsmallList.get(i) != null ) { %>
							<img height="60" src="<%=basePath%><%=styleimgsmallList.get(i)%>"/>&nbsp;
							<!-- 
							<div class="productStyle productStyleSelected productInforBasic">屌丝款</div>
							<div class="productStyle                      productInforBasic">高富帅款</div>
							  -->
						<% } else { %>
							<div><%=name%></div>
						<% } %>
						
					<% } %>
					
				</div>
				
				<div     class="productAddCartBar              productInforBasic">
					<button class='productAddCart' id="addcart">加入购物车</button>
				</div>
				
				<script>
					
					var productid = document.getElementById('productid').value; 
					var addcartbu = document.getElementById('addcart'); 
					
					var addcart   = function(event) {
						
						var formdata = new FormData();
							formdata.append( 'productid' , productid );
							
							console.log( '-------- adding to cart -------- ' + productid );
							
						$.ajax( {
							url         :  'addcart'  ,
							data        :   formdata  ,
							type        :  'POST'     ,
							contentType :   false 	  ,
							processData :   false     ,
							success     :   function(data) {
								if(document.getElementById('cartquantity' )!=null) 
									$('#cartquantity' ).html(data);
								if(document.getElementById('cartquantityl')!=null) 
									$('#cartquantityl').html(data);
							}
							
						});
					}
					
						addcartbu.addEventListener( 'click' , addcart , false );
					
				</script>
				
				
				<script> 
					// clean cart clean cookie.
					window.onbeforeunload = function (e) {
					  	  $.ajax( {
					  		  url         :  'cleancart'  ,
					  		  type        :  'GET'         
					  	  });
					  	  //return "确定要刷新或关闭浏览器窗口？"; 
					}
				</script>
				
				
				<div     class="productInforDescription        productInforBasic">明星同款耳机</div>
				
				
			</div>
			
			<div                class="storeInforBlock     storeInforBasic">
				<div            class="storeInforTopGap    storeInforBasic"></div>
				<div            class="storeInforCore      storeInforBasic">

					<div        class="storeInforNameBlock storeInforBasic">

							<div class="storeNameText"   ></div>
							<div class="storeNameContent">
								<a class="unline blue" href="<%=basePath%>/msgCenter">联系卖家</a></div>
							<div class="gap"></div>
							
							<div class="storeNameText"   >店铺名称</div>
							<div class="storeNameContent"><%=seller%></div>
							<div class="gap"></div>
							
							<div class="storeNameText"   >综合信用</div>
							<div class="storeNameContent">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
							<div class="gap"></div>
							
							<div class="storeNameText"   >好评概率</div>
							<div class="storeNameContent">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
							<div class="gap"></div>
							
							<div class="storeNameText"   >信誉等级</div>
							<div class="storeNameContent">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
							<div class="gap"></div>
							
					</div>
					
					<div class="storeInforCredit  storeInforBasic">8940 次评价 </div>
					
				</div>
				
			</div>
			
		</div>
		
		<!-- recommend part. -->
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
					
					for ( int i = 0 ; boximgiter.hasNext() ; i++ ) {
						System.out.println( "Number -- " + i + " BoxImg " );
						   
						   FirstBoxImg     boximg         = (FirstBoxImg)boximgiter.next();
						   System.out.println( "Number " + i + " img Name -- " + boximg.getProductname() );
						   
						   byte[]     productidbytes  =  (byte[])boximg.getProductid();
						   UUID       productuuid     =   UuidUtils.asUuid(productidbytes);
						   
						   System.out.println( "Number " + i + " img UUID        -- " + productuuid.toString() );
						   
				 %>
				
				<!-- 0. -->
				<div     class="recommendMidBox       recommendBlockBasic"  
					     id   ="recommendBoxImg<%=i%>"                      >
					     
					<div class="recommendMidBoxImg    recommendBlockBasic"  >
						<img class="recimg" src="<%=basePath%><%=boximg.getFirstboximg()%>"/>
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
		

		<!-- productPage part  -->
		<div     class="productPageBlock">
			<div class="productPageBasic"></div>
		</div>
		
		<script>
				
			var pageaddr = new FormData();
				pageaddr.append('basePath'   ,document.getElementById('basePath')   .value);
				
				console.log('' + document.getElementById('basePath')   .value );
				
			var basePath = document.getElementById('basePath').value;
			
			$.ajax( {
				url         : 'loadProductPage'  ,
				data        :  pageaddr          ,
				type        : 'POST'             ,
				processData :  false             ,
				contentType :  false             ,
				success     :  function(data) {
					$('.productPageBasic').html(data);
				}
			});
			
			// 2.ensure the load the data.
			setTimeout( function(){} , 200);
			
		</script> 
		
		
		<!-- comment part. -->
		<div class="commentcore">

			<table class="commenttable" border="0">

				<tr>
					<td class="commenttd">

						<div         class="commentCore" >
							
							<div     class="commentTitle">用户评论</div>

							<div     class="commentPage" >
							
								<div class="commentBoxImgCore">
								
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
								</div>
								
								<div class="gap"></div>  




							    <div class="commentstylebar">
							    	<table border="0" >
							    		<tr>
									    	<td>
									    		<div class="commentstyleblock">
											    	<div class="commentstylepic">
														<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
													</div>
													<div class="commentstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣</div>
												</div>
											</td>
										</tr>
							    		<tr>
									    	<td>
									    		<div class="commentstyleblock">
											    	<div class="commentstylepic">
														<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
													</div>
													<div class="commentstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣</div>
												</div>
											</td>
										</tr>
									</table>
							    </div>

								<div class="gap"></div>  

							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
								
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>
								
								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
								</div>

								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  
							



							<div     class="commentPage">

								<div class="commentBoxImgCore">

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

								</div>

								<div class="gap"></div>  

							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
								
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>

								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">尺寸刚好 颜色很正 是正品 值得入手</div>

								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  




							
							<div     class="commentPage">
								<div class=""></div>
								<div class="gap"></div>  
							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
							    
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>
								
								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">尺寸刚好 颜色很正 是正品 值得入手</div>

								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  




							<div     class="commentPage">
								<div class=""></div>
								<div class="gap"></div>  

							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
							    
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>
								
								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">尺寸刚好 颜色很正 是正品 值得入手</div>

								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  




							<div     class="commentPage" >
							
							
								<div class="commentBoxImgCore">
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
								</div>

								<div class="gap"></div>  

								
							    <div class="commentstylebar">
							    	<table border="0" >
							    		<tr>
									    	<td>
									    		<div class="commentstyleblock">
											    	<div class="commentstylepic">
														<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
													</div>
													<div class="commentstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣</div>
												</div>
											</td>
										</tr>
									</table>
							    </div>


								<div class="gap"></div>  
								

							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
								
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>

								<div class="commentdate">2018 年 6 月 12 日</div>

								<div class="comment">
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
									尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
								</div>


								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>


							</div>  



							
							<div     class="commentPage">

								<div class="commentBoxImgCore">

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>

								</div>

								<div class="gap"></div>  

							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
								
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>

								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">尺寸刚好 颜色很正 是正品 值得入手</div>
								
								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  




							
							<div     class="commentPage">
								<div class=""></div>
								<div class="gap"></div>  
							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
							    
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>
								
								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">尺寸刚好 颜色很正 是正品 值得入手</div>

								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  



							<div     class="commentPage">
								<div class=""></div>
								<div class="gap"></div>  
							    <div class="commentuser">
							    	<div class="commentprotrait">
										<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentName">
							    		来自火星的猫 来自火星的猫
							    	</div>
							    </div>
							    
								<div class="commentstarBlock">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
									<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
								</div>
								
								<div class="commentdate">2018 年 6 月 12 日</div>
								<div class="comment">尺寸刚好 颜色很正 是正品 值得入手</div>

								<div class="commentusebar">
									这条评论对我 :  &nbsp;
									<button class="commentuse" id="useful"  >有用</button>&nbsp;
									<button class="commentuse" id="unuseful">没有用</button>&nbsp;
									<span>156</span> 个人说有用
								</div>

							</div>  

						</div>

						<div class="commentpage">... 1 2 3 4 5 6 7 8 9 10 ...</div>
  
				</td>





				<td class="commenttd">

					<div         class="commentrecCore" >

						<div     class="commentrecTitle">推荐评论</div>

						<div     class="commentrecPage" >
							<div class="commentrecBoxImgCore">
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
									<div class="commentBoxImg">
										<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
									</div>
							</div>
								
							<div class="gap"></div>



						    <div class="commentrecstylebar">
						    	<table border="0" >
						    		<tr>
								    	<td>
								    		<div class="commentrecstyleblock">
										    	<div class="commentrecstylepic">
													<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
												</div>
												<div class="commentrecstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣 原厂真品 支持实体验货 无瑕疵 极致手工</div>
											</div>
										</td>
									</tr>
						    		<tr>
								    	<td>
								    		<div class="commentrecstyleblock">
										    	<div class="commentrecstylepic">
													<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
												</div>
												<div class="commentrecstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣 原厂真品 支持实体验货 无瑕疵 极致手工</div>
											</div>
										</td>
									</tr>
								</table>
						    </div>

							<div class="gap"></div>  

						    <div class="commentuser">
						    	<div class="commentprotrait">
									<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
								</div>
								<div class="commentName">
						    		来自火星的猫 来自火星的猫
						    	</div>
						    </div>
						
							<div class="commentstarBlock">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
							</div>

							<div class="commentdate">2018 年 6 月 12 日</div>

							<div class="commentrec">
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
							</div>

							<div class="commentusebar">
								这条评论对我 :  &nbsp;
								<button class="commentuse" id="useful"  >有用</button>&nbsp;
								<button class="commentuse" id="unuseful">没有用</button>&nbsp;
								<span>156</span> 个人说有用
							</div>
						</div> 






						<div     class="commentrecPage" >

							<div class="commentrecBoxImgCore">
								<div class="commentBoxImg">
									<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
								</div>
								<div class="commentBoxImg">
									<img height="160" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
								</div>
							</div>

							<div class="gap"></div>

						    <div class="commentrecstylebar">
						    	<table border="0" >
						    		<tr>
								    	<td>
								    		<div class="commentrecstyleblock">
										    	<div class="commentrecstylepic">
													<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
												</div>
												<div class="commentrecstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣 原厂真品 支持实体验货 无瑕疵 极致手工</div>
											</div>
										</td>
									</tr>
						    		<tr>
								    	<td>
								    		<div class="commentrecstyleblock">
										    	<div class="commentrecstylepic">
													<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
												</div>
												<div class="commentrecstylename">深绿色 拍下立减50 送高级防尘塞 真皮皮扣 原厂真品 支持实体验货 无瑕疵 极致手工</div>
											</div>
										</td>
									</tr>
								</table>
						    </div>

						    <div class="gap"></div>

						    <div class="commentuser">
						    	<div class="commentprotrait">
									<img height="40" src="<%=basePath%>/img/default/productCenter/comment/useproduct.jpg"/>
								</div>
								<div class="commentName">
						    		来自火星的猫 来自火星的猫
						    	</div>
						    </div>
						
							<div class="commentstarBlock">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star.png">
								<img height="25" src="<%=basePath%>/img/tinyicon/productCenter/comment/star_empty.png">
							</div>

							<div class="commentdate">2018 年 6 月 12 日</div>

							<div class="commentrec">
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手
								尺寸刚好 颜色很正 是正品 值得入手 尺寸刚好 颜色很正 是正品 值得入手	
							</div>

							<div class="commentusebar">
								这条评论对我 :  &nbsp;
								<button class="commentuse" id="useful"  >有用</button>&nbsp;
								<button class="commentuse" id="unuseful">没有用</button>&nbsp;
								<span>156</span> 个人说有用
							</div>

						</div>  

					</div>

				</td>

				</tr>

			</table>
			
		</div>
		
		<!-- comment block-->


		<!-- video part. -->
		<div     class="issueblock">

			<div class="issuetitle">其他问题</div>

			<div class="issuecore">
				如有任何其他疑问及问题，请提交给我们。我们会及时进行处理
				<form action="">
				<div class="issuebox">
					<input type="text"   class="textbox"     name="issue"  id="issue"  value="" /><br />
				</div>
				<div class="issuebox">
					<input type="button" class="issuesubmit" name="issuesubmit" id="issuesubmit" value="提交问题" />
				</div>
				</form>
			</div>

		</div>

		<script>
			var textboxes = document.getElementsByClassName('textbox');

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

			for( var i = 0 ; i < textboxes.length ; i++ ) {
				textboxes[i].addEventListener( 'mouseover' , boxover  , false );
				textboxes[i].addEventListener( 'mouseout'  , boxout   , false );
				textboxes[i].addEventListener( 'focus' 	   , boxfocus , false );
				textboxes[i].addEventListener( 'blur'      , boxblur  , false );
			}

		</script>


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




