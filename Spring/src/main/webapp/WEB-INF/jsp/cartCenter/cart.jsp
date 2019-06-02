<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
<%  request.setCharacterEncoding("utf-8"); 
	String basePath =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
    String username = (String)session.getAttribute("username"); 
	   if((username=="null" )||
		  (username== null  )  ) { username=""; } 
	
	String cartquantity     = (String)session.getAttribute( "cartquantity" );
	   if((cartquantity=="null")||(cartquantity==null)) { cartquantity="0"; } 	
	   
	   
	   
	   
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	
		<title>购物车</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script src="<%=basePath%>/js/jQuery/jquery-3.2.1.js"></script>
		
		<style>
			
			div          {   margin: 0 auto;   }
			div table    {   margin: 0 auto;   }
			
			/******** basic part. ********/
			*            {   font-family     : 微软雅黑;      }
			body         {   margin          : 0;          }
			
			.unline      {   text-decoration : none; 
						   	 color           : #000;  
						   	 cursor          : pointer;
						 }
			.blue        {	 color           : #3dbbd4;    }	
			
			/******** title part. ********/
			.top          {   
							 position        : relative; 
							 top             :  0px; 
							 height          : 90px; 
							 min-width           : 1300px;
							 display         : block;
							 border-bottom   : 1px solid #eee; 
						   } 
			
			
			.topcore       { 
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
			.textboxover	 { 
								animation-name     : textboxover;
								animation-duration : 0.3s;
								box-shadow: 0px 0px  5px #999;
							 }
			.textboxout 	 { 
								animation-name     : textboxout;
								animation-duration : 0.3s;
								box-shadow: 0px 0px  0px #999;
							 }
			.textboxblur 	 {    
								animation-name     : textboxblur;
								animation-duration : 0.3s;
								box-shadow: 0px 0px 0px #999;
							 }
			.textboxfocus	 { 
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
						   
						   
			/*    */
			/* main page part. */
			.core   {
					   position: relative;
					   margin: 0 auto;
					   margin-top: 30px;
					   margin-bottom: 30px;
				       width :1210px;
				       border:  1px solid #ccc; 
				 	}
			/* boximg part. */
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
					    height:280px;
				        width :280px;
				        border:  1px solid #eee; 
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
			.topbar {
					   position: relative;
					   margin: 0 auto;
					   height: 120px;
				       border:  1px solid #ccc; 
			        }
			.gap    {
					   position: relative;
					   clear   : none;
					}
			.wd     {
					   position:  relative;
					   margin  :  0 auto;
					   margin-top: 30px;
					   margin-bottom: 30px;
					   height  :  520px;
				       width   : 1210px;
				       border  :    1px solid #ccc; 
					}		

			/* similar item part. */


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
									 margin-left   : 63px;
									 margin-bottom : 0px;
									 height  : 20px;
									 width   : 500px;
									 font-size:  : 20px;
									 color : #3dbbd4; 
									 font-family : 微软雅黑;
						         }
			.recommendBlock      {
									 margin-top : 20px;
									 height  : 320px;
									 width   : 1311px;
									 border  : 0px solid #fff;
						         }						        
			.recommendCore       {
									 margin : 0 auto;
									 height  : 290px;
									 width   : 1320px;
							     }
			/* recommendMid part. */ 
			div .recommandMidButton {
										vertical-align:text-bottom;
										position: relative;
										float   : left;
										margin-top   : 75px;
									    margin-left  : 5px;
										margin-right : 20px;
										height  : 50px;
										width   : 35px;

									}
			div .recommandMidButtonArraw     
									{
										height  : 50px;
										width   : 50px;	
										font-size: 24px;
									}
			div .recommendMidBox    {
										 margin-top  : 20px;
										 margin-left : 5px;
										 margin-right : 5px;
						                 height  : 250px;
						             	 width   : 160px;
										 display: block;
								    }
			.recommendMidBoxImg    {
										 margin-top  : 0px;
										 margin-left : 0px;
						                 height      : 160px;
						             	 width       : 160px;
						             	 /* box-shadow: 0px 0px 10px #111; */
										 display: block;
										 vertical-align: middle;
										 text-align: center;
							 	   }	
			.recommendMidNameText  { 
										 margin-top  : 0px;
										 margin-left : 0px;
										 height      : 40px;
										 width       : 160px;
										 font-size   : 14px; 
										 display: block;
							       }
			.recommendMidPriceText { 
										 margin-top  : 0px;
										 margin-left : 0px;
										 height      : 20px;
										 width       : 160px;
										 text-align    : left; 
										 vertical-align: text-bottom;
										 font-size   :  14px;
										 display: block;
								   }  
			.recommendMidBoxRowGap { 
										 margin-top : 0px;
										 clear:both; 
								   }


			/* shop List */	
			.listrow               {
									   position: relative;
									  /* margin: 0 auto; */
									   margin-left : 15px; 
									   margin-top: 10px;
									   margin-bottom: 30px;
								       width :1175;
								       border:  1px solid #eee; 

								   }
			.listbox               {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :   20px;
									   height      :  200px;
								       width       :  160px;
								       border:  1px solid #ccc; 
								   }

			.listboximg            {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-right:   10px;
									   margin-top  :    5px;
									   height      :   60px;
								       width       :   60px;
								       border:  1px solid #ccc; 
								   }			

			.listtitle             {
									   position    :  relative;
									   float       :    left; 
									   margin-left :    20px;
									   margin-top  :    10px;
									   height      :    60px;
								       width       :   400px;
								       border:  1px solid #ccc; 
								   }



			/* list title. */			
			.listtitlerow          {
									   
									   margin      :   0 auto; 
									   margin-top  :   20px;
									   height      :   42px;
								       width       : 1175px;
								       border      :    1px solid #ccc; 
								   }	
			.listboximgem          {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :   30px;
								       width       :   60px;
								       border:  1px solid #ccc; 
								   }
			.listboxselectall      {
									   position    :  relative;
									   float       :    left; 
									   margin-left :    0px;
									   margin-top  :    4px;
									   height      :   20px;
								       width       :   20px;
								       font-size   :   12px; 
								       border:  1px solid #ccc; 
								   }					   
			.listboximgemtext      {
									   position    :  relative;
									   float       :    left; 
									   margin-left :    0px;
									   margin-top  :    4px;
									   height      :   0px;
								       width       :   35px;
								       text-align  :   center; 
								       font-size   :   14px; 
								       border:  1px solid #ccc; 
								   }

			.listtitlename		   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :  30px;
								       width       :  250px;
								       text-align  :  center; 
								       background-color: #fff;
								       border:  1px solid #ccc; 
								   }
			.listtitlestyle        {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :   30px;
								       width       :  240px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }					   
			.listtitleprice		   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :   30px;
								       width       :  120px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }
			.listtitlequantity	   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :   30px;
								       width       :  180px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }	

			.listtitletotal   	   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :  30px;
								       width       :  170px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }


			/* list row */
			.listcode              {
									   position    :  relative;
									   margin-left :    20px; 
									   clear       :      left;
									   font-size   :   14px; 
									   height      :   20px;
								       width       :  550px;
								       text-align  :      left; 
								       border:  1px solid #ccc; 
								   }

			.listitemrow           {
									   position      :  relative;
									   margin-bottom :    10px;
									   clear         :    left;
									   font-size     :    14px; 
									   height        :    68px;
								       width         :   1175px;
								       text-align    :      left; 
								       border        :  1px solid #eee; 
								   }	


			/* list message part. */					   
			.listmessage           {
									   position      :  relative;
									   margin        :     0 auto; 
									   margin-bottom :    10px;
									   clear         :    left;
									   font-size     :    14px; 
									   height        :    28px;
								       width         :   964px;
								       padding       :    10px;
								       border        :  1px solid #ccc; 
							 	   }
							 	   
			.listmessagetitle      {
									   position      :  relative;
									   margin-left   :   415px; 
									   margin-bottom :     5px;
									   float         :    left;
									   font-size     :    14px; 
									   height        :    68px;
								       width         :    88px;
								       border        :     1px solid #ccc; 
								   }
			.listmessagetitletext  {
									   position      :  relative;
									   margin        :     0 auto; 
									   margin-top    :    20px; 
									   float         :    left;
									   font-size     :    14px; 
									   height        :    38px;
								       width         :    78px;
								       border        :     1px solid #ccc; 
									}
			.listmessagebutton      {
									   position      :  relative;
									   margin-left   :   104px;
									   margin-top    :     -7px; 
									   margin-bottom :     5px; 
									   float         :    left;
									   text-indent   :   4px; 
									   font-size     :    14px; 
									   height        :    20px;
								       width         :   92px;
								       background-color : #fff;
								       border        :     1px solid #ccc; 				
									}


			/* address part. */					   
			.listaddress           {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :   32px;
									   min-height  :   20px;
									   max-height  :   200px; 
								       width       :   820px;
								       text-align  :  center; 
								       border      :  1px solid #ccc; 
								   } 
			.listaddressrow        { 
									   position    :  relative;
									   margin-left :    80px; 
									   margin-bottom :  10px;
									   float       :    left;
									   font-size   :    14px; 
									   height      :    20px;
								       width       :   720px;
								       text-align  :      left; 
								       background-color: #fff;
								       border:  1px solid #ccc; 
								   } 
			.listaddresssetdefault { 
									   position    :  relative;
									   /*
									   margin-left :    80px; 
									   margin-bottom :  10px;*/
									   float       :    right;
									   font-size   :    14px; 
									   height      :    20px;
								       width       :    160px;
								       text-align  :      left; 
								       background-color: #fff;
								       border:  1px solid #ccc; 
								   }	

			/* add address */					   
			.listaddaddressbutton  {
									   position      :  relative;
									   margin-left   :   16px;
									   margin-top    :     4px; 
									   margin-bottom :     5px; 
									   float         :    left;
									   text-indent   :   4px; 
									   font-size     :    14px; 
									   height        :    23px;
								       width         :   92px;
								       background-color : #fff;
								       border        :     1px solid #ccc; 				
									}


			.listaddaddressbox      {
									   position      :  relative;
									   margin-left   :    16px; 
									   margin-bottom :    10px;
									   font-size     :    14px; 
									   height        :    20px;
								       width         :   700px;
								       padding       :     4px;
								       overflow-x    :    none;
								       overflow-y    :    auto;   
								       border        :  1px solid #ccc; 
								       resize        : none;
							 	   }	



			.listname		       {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   10px;
									   margin-top  :    5px;
									   height      :   60px;
								       width       :  250px;
								       text-align  :  center; 
								       background-color: #fff;
								       border:  1px solid #eee; 
								   }
	   		
			.listnametext	       {
									   position    :  relative;
									   margin      :  0 auto; 
									   margin-top  :    -5px;
									   height      :   54px;
								       width       :  244px;
								       text-align  :    left; 
								       padding     :    3px; 
								       border:  1px solid #eee; 
								   }	 								   	   
			.liststyle             {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :    5px;
									   height      :   60px;
								       width       :  240px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }		
			.liststylebox          {
									   position    :  relative;
									   float       :    left; 
									   margin-left :    0px;
									   margin-top  :   10px;
									   height      :   40px;
								       width       :   40px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }	
			.liststyletext         {
									   position    :  relative;
									   float       :    left; 
									   margin-left :     0px;
									   margin-top  :    8px;
									   height      :    34px;
								       width       :   190px;
								       font-size   :    14px; 
								       text-align  :    left; 
								       padding     :     3px; 
								       border:  1px solid #ccc; 
								   }					   				   			   
			.listprice		       {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :   24px;
									   height      :   30px;
								       width       :  120px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }	

			.listquantity	       {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :   20px;
									   height      :   50px;
								       width       :  180px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }			   

			.listtotal   	       {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :   24px;
									   height      :  30px;
								       width       :  170px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }				   


			.listgap		   	   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   20px;
									   margin-top  :   32px;
								       width       :   820px;
								       text-align  :  center; 
								       border      :  1px solid #ccc; 
								   }				   

		


			.listtotalpriceblock   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :   90px;
									   margin-top  :   22px;
									   height      :  60px;
								       width       :  220px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }		
			.listtotaltext   	   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :    0px;
									   margin-top  :    0px;
									   height      :   40px;
								       width       :   45px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }									   			   
			.listtotalprice   	   {
									   position    :  relative;
									   float       :    left; 
									   margin-left :    0px;
									   margin-top  :    0px;
									   height      :   40px;
								       width       :  170px;
								       text-align  :  center; 
								       border:  1px solid #ccc; 
								   }					   
				   



			.text                  {
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
			.midblock      { 
							 margin: 0 auto;
						   } 
			.emptyblock    { 
							   position:relative;
							   clear   :both;
							   height: 200px; 
					           background-color: #FFFFFF; 
					           margin-top: 10px; 
					           margin-left: auto;
					           margin-right: auto;
					           padding: 30px;
					           text-align: center;
				           } 

			.bottomblock   { 
							   position:relative;
							   margin: 0 auto;
							   clear   :both;
							   height:600px; 
					           background-color: #fff; 
					           padding: 30px;
					           border-top    : 1px solid #222; 
				           }
			.backtotop     {
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
							 keyword.addEventListener(     'keydown'    , indexEnterDown  , false );
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
	  					
						<!--
						<span class="countlong unline">199</span>
						  -->
						
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
							
							window.location  =  basePath+'/indexPage?'+'keyword='+encodeURI(encodeURI(keyword.value))+'&page=1';
							
						}
					}
						maccbu.addEventListener( 'click' , macc , false );
					
					
				</script>
					
			</div>
			
		</div>
		
		
		
		
		<div class="core">
		
			<div class="recommendTitle">购物清单</div>

			<div class="listtitlerow">

				<div class="listboximgem">
					<div   class="listboxselectall">
						<input type ="checkbox" id="selectall"/>
					</div>
					<div   class="listboximgemtext">全选</div>
				</div>

				<div class="listtitlename"    >产品名称</div>

				<div class="listtitlestyle"   >款式</div>

				<div class="listtitleprice"   >单价</div>
  
				<div class="listtitlequantity">数量</div>

  				<div class="listtitletotal"   >总价</div>

			</div>
			
			
			<!-- cart productinfor part. -->
			<% 
				System.out.println( "--------cartPage client.-------- " );
				
				Map<String,List<Map<String,String>>>  sellerMap  = null;
				
				if(username!="")  {
					System.out.println( "**************** get sellerMap ****************" );
					sellerMap  =  (Map<String,List<Map<String,String>>>)session.getAttribute("sellerMap"    );
				}
				else              {
					System.out.println( "**************** get sellerMapTemp ****************" );
					sellerMap  =  (Map<String,List<Map<String,String>>>)session.getAttribute("sellerMapTemp");
				}
				
				
				Set<String>         sellerset  =   null;
				
				System.out.println( "sellerMap size ----------------- " + sellerMap.size() );
				
				if(sellerMap!=null) sellerset  =   sellerMap.keySet();
				else                sellerset  =   new HashSet<String>();
				
				Iterator                              selleriter =   sellerset.iterator();
			    
				while( selleriter.hasNext() ) {
				
							 String                   seller     =    (String)selleriter.next();
					List<Map<String,String>>          itemList   =            sellerMap.get(seller);
				
				
			 %>
			
			<div class="listrow"> 
				
				<div class="listcode"> 
					<input type="checkbox" class="productcheck" value=""/> 
					<input type="hidden"   class="productcode"  value=""/>&nbsp;&nbsp;<span> 
						<a class="unline blue" href="<%=basePath%>/msgCenter">联系卖家</a><%=seller%></span> 
				</div> 
				
				<% 
				   
		   	       Iterator  itemiter  =  itemList.iterator(); 
				   
				   while(   itemiter.hasNext()   ) { 
						
						Map<String,String> infoMap = (Map<String,String>)itemiter.next(); 
						
						String productid    = infoMap.get("productid"     ); 
						String longerEdge   = infoMap.get("imgLongerEdge" ); 
						
						String itemname     = infoMap.get("productname"   ); 
						String productprice = infoMap.get("productprice"  ); 
						String quantity     = infoMap.get("quantity"      ); 
						String boximg       = infoMap.get("firstboximg"   ); 
						
				 %>
				
				
				<div class="listitemrow">
					
					<div class="listboximg">
					
					<% if(longerEdge.equals("HEIGHT")) { %>
						<img  height="60" src="<%=basePath%><%=boximg%>" />
					<% } else { %>
						<img  width ="60" src="<%=basePath%><%=boximg%>" />
					<% }  %>
					
					</div>
					
					<div class="listname">
						<div class="listnametext"><%=itemname%></div>
					</div>
					
					<div class="liststyle">
						<div class="liststylebox" ></div>
						<div class="liststyletext">款式款式款式款式款式款式款式款式款式款式款式款式</div>
					</div>
					
					<div class="listprice">￥<span class="price"><%=productprice%></span></div>
					
	  				<form>
						<div class="listquantity">
							<input  type="button" class="decrease" style="height:30px; width:30px;" value="-" />
							<input  type="text"   class="count"    style="height:25px; width:80px;  text-align:center;" value="<%=quantity%>" readonly="true"/>
							<input  type="button" class="increase" style="height:30px; width:30px;" value="+" />
						</div>
					</form>
					
	  				<div class="listtotal" >￥<span class="totalprice"></span></div>
	  				
  					<input type="hidden" class="productid" value="<%=productid%>" />
  					
  				</div>
  				
  				<% } %>
  				
   				<div   class="listmessagebutton">给卖家留言<span class="messagemark">&#9660;</span></div>
   				
  				<input class="listmessage" type="text" />
  				
  			</div>
  			
  		<% } %>
  			
			<div class="listrow"> 
				
				<div class="listitemrow">
				
					<div class="listgap"></div>
					
	  				<div class="listtotalpriceblock">
	  					<div class="listtotaltext">总价 &nbsp;</div> 
		  				<div class="listtotalprice" id="totalprice">
		  					￥<span class="totalpricesum"></span>
		  				</div>
		  			</div>
				
		  		</div>
		  		
		  	</div>
		  	
			<script>
			
				/* init price part. */
				var initcount = function(event) {
					var listquantities = document.getElementsByClassName('listquantity');
					for( var i = 0 ; i < listquantities.length ; i++ ) {
						listquantities[i].getElementsByClassName('count')[0].value = 0;
					}
				}
				//initcount();
				
				var initsprice = function(event) {
					var initsprices = document.getElementsByClassName('listprice');
					for( var i = 0 ; i < initsprices.length ; i++ ) {
						initsprices[i].getElementsByClassName('price')[0].innerHTML = 80;
					}
				}
				//initsprice();
				
				var inittotalprice   =  function(event) {
					var totalprices  =  document.getElementsByClassName('totalprice');
					for( var i = 0 ;  i < totalprices.length ; i++ ) {
						 var count      = Number(totalprices[i].parentNode.parentNode.getElementsByClassName('count')[0].value);
						 var price      = Number(totalprices[i].parentNode.parentNode.getElementsByClassName('listprice')[0].getElementsByClassName('price')[0].innerHTML);
						 var totalprice = count*price;
						 	 totalprices[i].innerHTML = totalprice;
					}
				}
				inittotalprice();
				
				/* count total price. */
				var counttotal = function(event) {
						 var totalpricesum = document.getElementsByClassName('totalpricesum')[0];
						 var totalprices   = document.getElementsByClassName('totalprice');
						 var pricesum      = Number(0);
					for( var i = 0 ; i < totalprices.length ; i++ ) {
	
						     price         = Number(totalprices[i].innerHTML);
	
						     console.log( '' + price );
						     
						 	 pricesum      = pricesum + price;
					}
							 totalpricesum.innerHTML = Number(pricesum);
				}
					counttotal();
	
	
				/* select items block. */
				var selectallbox = document.getElementById("selectall"); 
				
				var selectboxes  = document.getElementsByClassName('productcheck'); 
				
				var selectall    = function(event) { 
					if (    selectallbox.checked   == true  ) {
						for ( var i = 0 ; i < selectboxes.length ; i++ ) 
							selectboxes[i].checked = 'true';
						console.log( '' + selectallbox.value );
					}
					else
					if (    selectallbox.checked   == false ) {
						for ( var i = 0 ; i < selectboxes.length ; i++ ) 
							selectboxes[i].checked =  false;
						console.log( '' + selectallbox.value );
					}
				}
					selectallbox.addEventListener( 'change' , selectall , false ); 
					
					
				var listquantity  = document.getElementsByClassName('listquantity');
	
				var changecount   = function(event) {
	
					var count     = Number(event.target.parentNode.getElementsByClassName('count')[0].value);
					var buyer     = document.getElementById('username').value; 
					var productid = event.target.parentNode.parentNode.parentNode.getElementsByClassName('productid')[0].value;
					
					var newcount ;
	
					switch( event.target.className ) {
						case  'increase'  :     
							/* 8 bits */
							if(String(count).length <= 8)
						    newcount = event.target.parentNode.getElementsByClassName('count')[0].value = Number(count) + 1;
									break; 
						case  'decrease'  : 
							if ( count > 0 ) 
								 newcount = event.target.parentNode.getElementsByClassName('count')[0].value = Number(count) - 1;
							else newcount = Number(0);
									break;
					}

					// count result. 
					var price = Number( event.target.parentNode.parentNode.parentNode.getElementsByClassName('listprice')[0].getElementsByClassName(     'price')[0].innerHTML);
					                    event.target.parentNode.parentNode.parentNode.getElementsByClassName('listtotal')[0].getElementsByClassName('totalprice')[0].innerHTML = price*newcount;
					                    
					                    
					// store count in DB                    
					var cartdata = new FormData();
						cartdata.append( 'newcount'  , newcount  );
						cartdata.append( 'productid' , productid );
						cartdata.append( 'buyer'     , buyer     );
						
					$.ajax( { 
						url         :  'cartCenter/cartUpdate' ,
						data        :   cartdata     	 ,
						type        :  'POST'        	 ,
						processData :   false        	 ,
						contentType :   false          
					});
					
					//  count total                    
						counttotal();
					
				}

				
				
				// increase decrease quantity part.
				var prestring    ;
				var nexstring    ;

				var validpre      = function(event) {
					    prestring = event.target.value;
						console.log( 'prevalue -- ' + prestring );
				}
	
				var validnext     = function(event) {
	
					var nexstring = String(  event.target.value  );
					
					var countnum  = Number(0);
	
					var isnumeric = true;
	
						console.log( '' + charlast );
						console.log( 'nexstring -- ' +  nexstring );
					
					for( var i = 0 ; i < nexstring.length ; i++ ) {
	
					 	 var charlast  = String(nexstring.substring(i,i+1));
	
						if( (charlast!='0')&&(charlast!='1')&&
						    (charlast!='2')&&(charlast!='3')&&
						    (charlast!='4')&&(charlast!='5')&&
						    (charlast!='6')&&(charlast!='7')&&
						    (charlast!='8')&&(charlast!='9') )
							 isnumeric = false;
	
						console.log( '' + isnumeric );
	
						console.log( '' + charlast );
	
					}
	
					if ( ( isnumeric == true )&&( nexstring.length <= 8 ) ) {
					     event.target.value  =        nexstring ;
					     count               = Number(nexstring);
					}
					else {
						 event.target.value  =        prestring ;
						 count               = Number(prestring);
					}
	
						 console.log( 'count -- ' + count );
						 
					/* count result. */
					var singleprice = Number(event.target.parentNode.parentNode.parentNode.getElementsByClassName('listprice')[0].getElementsByClassName('price')[0].innerHTML);
	
											 event.target.parentNode.parentNode.parentNode.getElementsByClassName('listtotal')[0].getElementsByClassName('totalprice')[0].innerHTML = singleprice*count;
	
					counttotal();
	
				}
				
				
				/* add eventlistner. */
				for( var i = 0 ; i < listquantity.length ; i++ ) {
					
					var increase = listquantity[i].getElementsByClassName('increase')[0];
					var decrease = listquantity[i].getElementsByClassName('decrease')[0];
					var count    = listquantity[i].getElementsByClassName(  'count' )[0];
	
						increase.addEventListener( 'mouseup'   , changecount  , false );
						decrease.addEventListener( 'mouseup'   , changecount  , false );
						  count.addEventListener(    'keydown'   , validpre     , false );
						  count.addEventListener(    'keyup'     , validnext    , false );
				}
				
			</script>
			
			
  			<!-- message hide show -->
			<script>

				/* hide messagebox*/
				var  listmessages   = document.getElementsByClassName('listmessage');

				for( var i = 0 ; i < listmessages.length ; i++ ) 
					 listmessages[i].style.display  = 'none';
				
				var   addmessages   = document.getElementsByClassName('listmessagebutton');
				
				var   dismessagebox = function(event) {
					var  messagebox =  event.target.parentNode.getElementsByClassName('listmessage')[0];
					if(  messagebox.style.display == 'block' )
						 messagebox.style.display  = 'none' ;
					else messagebox.style.display  = 'block';
					
					console.log( event.target.className );
				}
				
				for( var i = 0 ; i < addmessages.length ; i++ ) 
					   addmessages[i].addEventListener( 'click' , dismessagebox , false );
				
			</script>
			
			
		  	<!-- add address part -->
		  	<form>

			<div class="listrow" id="address">

				<div class="listitemrow">

						<div class="listgap" id="addrselect">

							<div class="listaddressrow">
								<input type ="radio" name="address" id="defaultaddr" checked="true"/>
								<span  id="defaultaddrtext">送货地址(默认) : 广东省深圳市龙华新区XX花园XX栋XXXX号</span>
							</div>

							<div class="listaddressrow">
								<input type="radio"  name="address" id="otheraddr" />
								<span  id="otheraddrtext">其他地址</span>
							</div>

						</div>



						<div class="listaddress" id="listaddress">
						
							<div class="listaddressrow">
								<input type="radio" name="otheraddr" class="otheraddress" />
								<span  class="addr">广东省深圳市龙华新区XX花园XX栋2222号</span>

								<div class="listaddresssetdefault">
									<input type="button" class="setdefault" value="设为默认" />
									<input type="button" class="deleteaddr" value="删除地址" />
								</div>
							</div>
							
							<div class="listaddressrow">
								<input type="radio" name="otheraddr"class="otheraddress" />
								<span  class="addr">广东省深圳市龙华新区XX花园XX栋1111号</span>

								<div class="listaddresssetdefault">
									<input type="button" class="setdefault" value="设为默认" />
									<input type="button" class="deleteaddr" value="删除地址" />
								</div>
							</div> 
							
						</div>


						<div class="listaddress" id="addaddr">

							<div class="listaddressrow">
								<div class="listaddaddressbutton">添加新地址 : </div>
							</div> 

							<div class="listaddressrow">
								<input class="listaddaddressbox" id="addaddrbox"/>
							</div> 

							<div class="listaddressrow">
								<div class="listaddaddressbutton"><input type="button" class="addaddrbu" id="addaddrbu" value="添加" /></div>
							</div> 

						</div>


					<script>

						// set addr default.

						var defaultaddrtext    =  document.getElementById('defaultaddrtext');
						var setdefaultbu       =  document.getElementsByClassName('setdefault');

						var setdefaultaddr     =  function(event) {
							defaultaddrtext.innerHTML = 
							 '送货地址(默认) : '  + event.target.parentNode.parentNode.getElementsByClassName('addr')[0].innerHTML;
						}

						for( i = 0 ; i < setdefaultbu.length ; i++ ) {
							setdefaultbu[i].addEventListener( 'click' , setdefaultaddr , false );
						}


						// delete addr
						var deleteaddrbu        =  document.getElementsByClassName('deleteaddr'); 

						var deleteaddr          =  function(event) {
							var addr = event.target.parentNode.parentNode;
									   event.target.parentNode.parentNode.parentNode.removeChild(addr);
						}

						for( i = 0 ; i < deleteaddrbu.length ; i++ ) {
							deleteaddrbu[i].addEventListener( 'click' , deleteaddr , false );
						}		



						// add addr
						var addaddrbu           =  document.getElementById('addaddrbu'); 

						var addaddr             =  function(event) {

							var    addaddrbox   =  document.getElementById('addaddrbox');

							var    addrquantity =  document.getElementsByClassName('addr').length; 

							var    listaddress  =  document.getElementById('listaddress'); 

							if(    addrquantity < 4  ) {

									 console.log( 'addrquantity -- ' + addrquantity );

								var  listaddressrow 		  	  =  document.createElement('div'); 
									 listaddressrow.className 	  = 'listaddressrow'; 

								var otheraddress             	  =  document.createElement('input'); 
									otheraddress.type         	  = 'radio'; 
									otheraddress.className     	  = 'otheraddress'; 

								var      addr                 	  =  document.createElement('span'); 
										 addr.className       	  = 'addr'; 
								var      addrtext                 =  String(addaddrbox.value);
										 if(addrtext.length > 10)
											 addr.innerHTML       =  addrtext.substring( 0 , 35) + '...'; 
										 else
										 	 addr.innerHTML       =  addrtext; 

								var     setdefault            	  =  document.createElement('div'); 
										setdefault.className  	  = 'listaddresssetdefault'; 

								var     setdefaultinput           =  document.createElement('input'); 
										setdefaultinput.type      = 'button'     ; 
										setdefaultinput.className = 'setdefault' ; 
										setdefaultinput.value     = '设为默认'   ; 
										setdefaultinput.addEventListener( 'click' , setdefaultaddr , false );

								var     blank                     =  document.createTextNode(' ');		

								var     deleteaddrinput           =  document.createElement('input'); 
										deleteaddrinput.type      = 'button'     ; 
										deleteaddrinput.className = 'deleteaddr' ; 
										deleteaddrinput.value     = '删除地址'   ; 
										deleteaddrinput.addEventListener( 'click' , deleteaddr     , false ); 

										setdefault.appendChild(setdefaultinput); 
										setdefault.appendChild(blank); 
										setdefault.appendChild(deleteaddrinput); 

										listaddressrow.appendChild(otheraddress); 
										listaddressrow.appendChild(addr); 
										listaddressrow.appendChild(setdefault); 

										listaddress.appendChild(listaddressrow); 

							}

						}

							addaddrbu.addEventListener( 'click' , addaddr , false );


					</script>
					
					
	  				<div class="listtotalpriceblock">
	  					<div class="listtotaltext"></div> 
		  				<div class="listtotalprice" >
		  					<span class="totalpricesum">
		  						<input type="submit" style="height:30px; width:169px;" value="提交订单" />
		  					</span>
		  				</div>
		  			</div>
		  			
		  			
		  		</form>
		  		
		  			<!-- address hide show -->
					<script>

						var defaultaddr = document.getElementById('defaultaddr');
						var   otheraddr = document.getElementById('otheraddr');

						var listaddress = document.getElementById('listaddress');
						var  addaddr    = document.getElementById('addaddr');

							listaddress.style.display = 'none';
							    addaddr.style.display = 'none';

							showaddr    = function(event) {
								if( otheraddr.checked == true ) {
									listaddress.style.display = 'block';
									    addaddr.style.display = 'block';
								}
							}
							hideaddr    = function(event) {
								if( defaultaddr.checked == true ) {
									listaddress.style.display = 'none';			
									    addaddr.style.display = 'none';
								}						
							}

							defaultaddr.addEventListener( 'click' , hideaddr , false );	
							  otheraddr.addEventListener( 'click' , showaddr , false ); 

					</script>

		  		</div>

			</div>



			<div class="gap"></div>

			<div class="recommendTitle"></div>
			
		</div>
		
		
		<!-- 
		<div class="wd">
			<div class="recommendTitle">明星单品</div>
			<div class="recommendStore">
				<img  src="img/closet/closet.jpg" />
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
						<img height="30" src="img/icon/market.png">&nbsp;
						<img height="30" src="img/icon/transportation.png">
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
						<img height="30" src="img/icon/market.png">&nbsp;
						<img height="30" src="img/icon/transportation.png">
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
						<img height="30" src="img/icon/market.png">&nbsp;
						<img height="30" src="img/icon/transportation.png">
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
						<img height="30" src="img/icon/market.png">&nbsp;
						<img height="30" src="img/icon/transportation.png">
					</div>
				</div>				
				<div class="boxtitlebasic boxuser"><span class="boxuserquantity">20000000000</span> 用户已购买</div>
			</div>

			<div class="gap"></div>
		</div>


		<script>

			var boxes = document.getElementsByClassName('box');

			var boxeffect = function(event) {
				console.log( ' function !! ' + event.target.className );

				if( (event.target.className == 'box'         )||
					(event.target.className == 'box boxout') ) 
				 	 event.target.className =  'box boxover';
				else 
				if  (event.target.className == 'box boxover') 
				 	 event.target.className =  'box boxout';


				if( (event.target.parentNode.className == 'box'         )||
					(event.target.parentNode.className == 'box boxout') ) 
				 	 event.target.parentNode.className =  'box boxover';
				else 
				if  (event.target.parentNode.className == 'box boxover') 
				 	 event.target.parentNode.className =  'box boxout';


				if( (event.target.parentNode.parentNode.className == 'box'         )||
					(event.target.parentNode.parentNode.className == 'box boxout') ) 
				 	 event.target.parentNode.parentNode.className =  'box boxover';
				else 
				if  (event.target.parentNode.parentNode.className == 'box boxover') 
				 	 event.target.parentNode.parentNode.className =  'box boxout';

				if( (event.target.parentNode.parentNode.parentNode.className == 'box'         )||
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
		
		
		
		
		<div class="emptyblock">
				<a >CONTENT</a> <a>CONTENT</a>
		</div>
		 -->
		 
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

			$('.backtotop').click(function(){
			    $('html, body').animate({scrollTop:0}, 'slow');
			});

			backtotop.addEventListener( 'mouseover' , backtotopeffect , false );
			backtotop.addEventListener( 'mouseout'  , backtotopeffect , false ); 
			//backtotop.addEventListener( 'click'     , topFunction     , false );	

		</script>

		<div class="bottomblock">

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