<%@ page language    ="java" 
         contentType ="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import      ="java.util.*"
         isELIgnored ="false"%>
<%@ taglib uri   ="http://www.springframework.org/tags/form"
           prefix="form" %>
           
 <!DOCTYPE html>
<html>

	<head>

		<title>数据中心</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<style>
			*          {
							font-family : 微软雅黑;

					   }
			body       {
							margin : 0;
							font-size: 20px;
					   }
			div .gap   {
							clear    : both;
					   }		   
			.datacore  {
							width  : 600px;
							height : 800px;
					   }
		html, body	   {
						  	height : 100%;
					   }


			/* top part */		   					   
			.top       {
							position 		 : absolute;
							margin-left      :   0px;
							margin-top       :   0px;
							z-index          :   2;
							/*height 			 : 10%;*/
							height           :  70px;
							width            : 100%;
							/*width            : 300px;*/
							background-color :  #f6f6f6;
							border-bottom    :   0px solid #999;
					   }
            .toplogo   {
							position         : relative;
							float            : left;
							margin-left      :   0px;
							margin-top       :   0px;
							height           :  70px;
							width            : 200px;							
							border           :   1px solid #222;              				
            		   }					   
			.topcore   {
							position         : relative;
							float            : left;
							margin-left      :    0px;
							margin-top       :    0px;
							height           :   70px;
							width            : 1280px;							
							border           :    1px solid #222;  
					   }		   
			.toptitlecore {
								position         : relative;
								float            :   left;
								margin-left      :    0px;
								margin-top       :    0px;
								height           :   70px;
								width            : 1080px;							
								border           :    1px solid #222;  
						  }	   
			.toptitleset  {
								position         : relative;
								float            :  right;
								margin-left      :    0px;
								margin-top       :    0px;
								height           :   70px;
								width            :  450px;							
								border           :    1px solid #222;  
						    }	
			.datecore       {
								position         : absolute;
								z-index			 :  2;
								margin-left		 : -496px;
								margin-top		 :   49px;
								float            :  left;
								height           :  219px;
								width            :  864px; 
								border-radius    :    5px; 
								background-color :    #f6f6f6; 			
								border           :    1px solid #eee;  
								box-shadow		 :    0px 0px 10px #aaa; 
						    } 

			.dateinitgap    { 
								position         : relative;				
								float            :  left;
								height           :   1px;
								width            :   8px;			
					        } 
			.datebox	    {
								position         : relative;
								margin-top		 :   10px;
								margin-left		 :    2px;
								margin-right	 :    2px; 
								float            :  left;
								height           :  225px;
								width            :  197px;		
								border-radius    :    2px; 		
								background-color :    #f6f6f6; 			
								border           :    1px solid #222;  
					        }
			.dateboxtitle   {
								position         : relative;
								margin-top		 :    1px;
								margin-left		 :    1px;
								float            :   left;
								font-size		 :   14px; 
								text-align		 :   center; 
								height           :   25px;
								width            :  193px;
								border-radius    :    1px; 		
								border           :    1px solid #999;  
						    }   							    		 					        
			.dateboxunit    {
								position         : relative;
								margin-top		 :   1px;
								margin-left		 :   1px;
								float            :  left;
								text-align		 :  center;
								font-size		 :  13px; 
								font-weight		 :   300;								
								height           :  25px;
								width            :  25px;		
								border-radius    :    1px; 		
											
								border           :    1px solid #999;  
						    }

			.unitempty	    {   background-color :    #fefefe;     }	
			.unitweek       {   background-color :    #f6f6f6;  }			
				
			.unitselect     {
								background-color :    #0b334a; 
							}
			.unittext		{
								margin-top       :    2px;		
								cursor           :    pointer;

							}		
			.unitselecttext {
								margin-top       :    3px;
								font-weight		 :    800; 
								color            :    #f6f6f6;
								cursor           :    pointer;
							}	

			.unitcurrent    {
								background-color :    #d7e4e6;
								cursor           :    pointer;
							}				  

			.datearrow      {
								position         : relative;
								margin-top		 :   10px;
								margin-left		 :    2px;
								margin-right	 :    2px;							
								float            :  left;
								height           :   30px;
								width            :   30px;		
								border-radius    :    2px; 		
								background-color :    #eee; 			
								border           :    1px solid #222;  
						    }
			.datearrowicon  {
								height           :   30px;
								width            :   30px;	
								font-size		 :   20px;
							}		    
			.datecencel     {
								position         : relative;
								margin-top		 :   10px;
								margin-left		 :    2px;
								margin-right	 :    2px;							
								float            :  left;
								height           :   20px;
								width            :   20px;		
								border-radius    :    2px; 		
								background-color :    #eee; 			
								border           :    1px solid #222;  
						    }
			.datecencelicon {
								background 	     :  #eee;
								height           :   20px;
								width            :   20px;	
								font-size		 :   16px;
							}								
			.dateboxa       {

						    }			  
	
			.dateboxcontent {

						 	}

			.dateselect   		{
									position         : relative;
									margin-top		 :   10px;
									margin-left		 :    5px;
									margin-right	 :    5px;							
									float            :   left;
									height           :   197px;
									width            :   334px;		
									border-radius    :    2px; 		
									background-color :    #eee; 			
									border           :    1px solid #222;  
							  	}



			.dateselectbase     {
									position         : relative;
									margin-top		 :     5px;
									margin-left		 :     5px;						
									float            :    left;
									border-radius    :     2px; 	
									padding			 :	   2px; 
								}				  	
			.dateselectbar 		{
									font-size        :    16px;
									text-indent      :     7px;
									height           :    37px;
									width            :   318px;		
									background-color :    #eee; 
									border           :     1px solid #222;  
							   }
			.dateselecttextbox {
									font-size        :    14px;
									color            :    #111; 
									text-indent      :     7px;
									height           :    20px;
									width            :   131px;			
									background-color :    #ccc; 		
									border           :     1px solid #222;  
								}				
			.dateselecttextmidbox {
									font-size        :    14px;
									text-indent      :     4px;
									height           :    20px;
									width            :    20px;		
									border           :     0px solid #222;  
								}
			.datecomptitletext  {
									position         : relative;		
									float			 :    left; 		
									margin-left      :     6px; 
									margin-top       :     2px;
									font-size		 :    14px; 
								}	

			.datecomptitle  	{
									position         : relative; 
									margin-top		 :     5px; 
									margin-left		 :     5px; 
									margin-right	 :     5px;						
									float            :    left;
									text-align		 :    left;
									font-size		 :    16px; 
									height           :    25px; 
									width            :   318px; 
									border-radius    :     2px; 
									background-color :    #eee; 
									padding			 :	   2px; 
									border           :     1px solid #222; 
								}


			.toptitlesetbox {

							}			  
            .toptitlebox    { 
								position         : relative;
								margin-top       :    0px;
								margin-left      :    0px;
								float            :   left;
								text-align       :  center;
								height           :   70px;
								width            :  120px;							
								border           :    1px solid #222;  
	            			 }
            .toptitleboxtext {
								position         : relative;
								margin           :  0 auto;
								margin-top       :   20px;
								font-size        :   16px;
								text-align       :  center;
								height           :   24px;
								width            :  100px;							
								border           :    1px solid #222;  
            			  	 }			  



            /* dateselector */
            .dateseletortitle	{
									position         : relative;
									float			 :  left; 
									margin-top       :    0px;
									margin-left      :    0px;								
									font-size        :   14px;
									text-align       :  center;
									height           :   20px;
									width            :  162px;							
									border           :    1px solid #222;  
	            				}
            .dateselector    	{
									position         : relative;
									margin-top       :    0px;
									margin-left      :    0px;
									font-size        :   14px;
									text-align       :  center;
									height           :   20px;
									width            :  100px;							
									border           :    1px solid #222;  
	            				}

			.dsselectbase       {
									position         : relative;
									clear            :    left;
									margin-top		 :     2px;
									margin-left		 :     0px;		
									border-radius    :     2px; 	
									padding			 :	   2px; 
								}		

			.dsselectbar 		{
									font-size        :    16px;
									text-indent      :     7px;
									height           :    37px;
									width            :   338px;		
									border-radius    :     2px; 		
									background-color :    #eee; 		
									padding			 :	   2px; 	
									border           :     1px solid #222;  
							    }

			.dsselecttextbox    {
									font-size        :    14px;
									text-indent      :     7px;
									height           :    20px;
									width            :   161px;		
									border-radius    :     2px; 		
									background-color :    #fefefe; 
									padding			 :	   2px; 	
									border           :     1px solid #222;  
								}				
			.dsselecttextmidbox {
									font-size        :    14px;
									text-indent      :     4px;
									height           :    20px;
									width            :    20px;		
									border-radius    :     2px; 			
									padding			 :	   2px; 	
									border           :     0px solid #222;  
								}


            /* side part */			  
			.side      {
							position 		 : absolute;
							margin-left      :   0px;
							margin-top       :   0%;
							z-index          :   1;
							float            : left ;
							
							width            : 250px;
							height           : 100%;
							border           :   0px solid #222;
							/*
							height           : 300px;
							width            : 300px;
							 */
							background-color : #f3f3f3;
					   }
			.sidecore  {
							position         : relative;
							margin           : 0 auto;
							margin-top       : 90px;
							height           : 500px;
							width            : 220px;							
							border           :   1px solid #222;  
					   }		   
			.sidebox   {
							position         : relative;
							margin           : 0 auto;
							margin-top       : 120px;
							height           : 500px;
							width            : 220px;							
							border           :   1px solid #222;  
					   }
			.sidetitle {
							position         : relative;
							margin           : 0 auto;
							margin-top       :  10px;
							text-align       : center;
							height           :  40px;
							width            : 220px;							
							border           :   1px solid #222;  
					   }		   



			/* main part */		   
		    .main     {
							position 		 : absolute;
							margin-left      :   0%;
							margin-top       :   0%;
							z-index          :   0;
							float            : left ;
							
							width            :  100%;
							height           :  100%;
							/*
							height           : 300px;
							width            : 300px;
							 */
							background-color : #fff;		 
							border           : 0px solid #222;  	
		   			   }
		    .maincore  {
							position         : relative;
							margin-left      : 134px;
							margin-top       :  80px;
							height           : 560px;
							width            : 1070px;							
							border           :   1px solid #eee;  
		    		   }
		    .mainbox1  {
							position         : absolute;
							z-index          : 1;
							float            : left;
							margin-left      :  20px;
							margin-top       :  5px;
							height           : 560px;
							width            : 800px;		
							border           :   1px solid #c11;  		
		    		   }	
		    /* frequency box */		   
		    .mainfrequencycore {
									position         : relative;
									margin           :  0 auto;
									height           : 40px;
									width            : 489px;		
									border           :   1px solid #e66;  		
		    				   }		
		    .frequencybox      {
									position         : relative;
									float            :  left;
									margin-left      :  10px;
									margin-right     :  10px;
									margin-top       :  5px;
									height           : 30px;
									width            : 100px; 
									border-radius    :  2px; 
									background-color :  #f6f6f6;
									border           :   1px solid #333;  
		    				   }	
		    .frequencytext     {
									position         : relative;
									float            :  left;
									margin-left      :  9px; 
									margin-top       :  4px;
									font-size        : 14px;
									text-align       : center;
									height           : 20px;
									width            : 80px;		
									border           :   1px solid #fafafa;  
		    				   }	


		    .maintitledatecore      {
									position         : relative;
									margin-left      :  60px;
									height           : 40px;
									width            : 739px;		
									border           :   1px solid #f6f6f6;  		
		    				   }
		    .maintitledatebox      {
									position         : relative;
									float            :  left;
									margin-left      :  12px;
									margin-right     :  12px;
									margin-top       :  5px;
									height           : 30px;
									width            : 156px; 
									border-radius    :  2px; 
									background-color :  #fefefe;
									border           :   1px solid #f6f6f6;  
		    				   }	
		    .maintitledatetext     {
									position         : relative;
									float            :  left;
									margin-left      :  9px; 
									margin-top       :  4px;
									font-size        : 14px;
									text-align       : center;
									height           : 20px;
									width            : 136px;		
									border           :   1px solid #f6f6f6;  
		    				   }	


		    .mainbox1core  {
							position         : relative;
							height           : 520px;
							width            : 800px;							
							border           :   1px solid #00aaff;  
		    		   }	


		    .mainbox1board     {
									position 		 : absolute;
									margin-left      :   60px;
									margin-top       :   10px;
									z-index          :   1;

									float            : left ;
									
									width            :  726px;
									height           :  427px;

									border-left      : 	  1px solid #111;
									border-bottom    :    1px solid #111;
		    			       }

		    .mainbox1leftboard {
									position 		 : absolute;
									margin-left      :    0px;
									margin-top       :   10px;
									z-index          :   1;

									float            : left ;
									
									width            :   60px;
									height           :  427px;

									border-bottom    : 	  1px solid #111;
		    				   } 	

		    .mainbox1lefttableunit 		{
											z-index          :      1;
											width            :   60px;
											height           :   60px;
											text-align       :    right;
											border-bottom    :    0px solid #666;	
		    							}
		    .mainbox1lefttableunittext  {
		    								float            :    left;
		    								margin-top       :     38px;
		    								margin-right     :      5px; 
											z-index          :      1;
											font-size		 :     14px; 
											width            :     55px;
											height           :     23px;
											text-align       :    right;	    						
		    							}


		    /* down data line. */							
		    .mainbox1downboard  {
									position 		 : absolute;
									margin-left      :   60px;
									margin-top       :  438px;
									z-index          :    1;

									float            : left ;
									
									width            :  738px;
									height           :   50px;
									border-left      : 	  1px solid #111;
									/*border           : 	  1px solid #111;*/
		    				    } 		
		    .mainbox1down       {
									position 		 : absolute;
									margin-left      :   60px;
									margin-top       :  468px;
									z-index          :   1;

									float            : left ;
									
									width            :  604px;
									height           :   50px;

									border           : 	  1px solid #111;
		    				    } 	

		    .mainbox1downunit   {
									float            :  left;
									width            :  120px;
									height           :   50px;
		    					}
		    .mainbox1downunittext {
									width            :  100px;
									height           :   19px;
									text-indent      :    48px;
									font-size        :   12px;
									text-align       :  left; 
									/*border           :    1px solid #222;*/
		    					  }					





		    .unitw {
									float            :  left;
									width            :  120px;
									height           :   60px;
									background-color :  #f3f3f3;
									border-right     :  1px solid #c3c3c3;
									border-bottom    :  1px solid #c3c3c3;
		    					}			   
		    .unitb {
									float            :  left;
									width            :  120px;
									height           :   60px;
									background-color :  #f9f9f9;
									border-right     :  1px solid #c3c3c3;
									border-bottom    :  1px solid #c3c3c3;
		    					}



		    /* graphic core */					
			.mainboxgraphiccore {
									position         : absolute;
									z-index          : 2;
									float            : left;
									margin-left      :  60px;
									margin-top       :  10px;
									height           : 425px;
									width            : 726px;		
									border           :   1px solid #00aaff;  
								}
		    .mainboxgraphicbox  {
									float            :  left;
									text-align       : left;
									width            :  121px;
									height           :  425px;
									border           :    0px solid #005599;
		    					}	

		    .graphic {
									position      : absolute;
									margin        : 0 auto;
									width         : 22px; 
									border-top-left-radius    : 4px; 
									border-top-right-radius   : 4px;
									border-bottom-left-radius : 2px;	
									border-bottom-right-radius   : 2px;								
		    					 }	
		    .graphicin {
									position: relative;
									width         : 20px; 	

									border-top-radius    : 4px;
									border-bottom-radius  : 2px;	
		    					   }	 				 			
			.redin {
									margin-top    : 0px;

									background 	  : -webkit-linear-gradient(top, #e64535 30%, #c10c00);

									border-top    : 1px solid #f88; 
									border-left   : 1px solid #f88; 
									border-right  : 1px solid #f88;  
					     }
			.red   {

							margin-left   :  10px;

							border     	     : 1px solid #911;
							border-bottom    : 1px solid #611; 
					     }	


			.bluein {
									width         : 20px; 

									background 	  : -webkit-linear-gradient(top, #57cbe3 30%, #1ea7c3);

									border-top    : 1px solid #baeaf4; 
									border-left   : 1px solid #baeaf4; 
									border-right  : 1px solid #baeaf4;  
							     }
			.blue   {
										margin-left   :  35px;

										width         : 22px; 
										border     	     : 1px solid #15778b;
										border-bottom    : 1px solid #0d4d59; 
								     }



			.greenin 	  {
										width         : 20px; 

										background 	  : -webkit-linear-gradient(top, #c0ea45 30%, #99cb01);

										border-top    : 1px solid #ecf9c7; 
										border-left   : 1px solid #ecf9c7; 
										border-right  : 1px solid #ecf9c7;  
								      }
			.green   	  {
										margin-left   :  60px;

										border     	     : 1px solid #729800;
										border-bottom    : 1px solid #394d00; 
								       }
					  


			.yellowin {
										width         : 20px; 

										background 	  : -webkit-linear-gradient(top, #fae24a 30%, #e0c301);

										border-top    : 1px solid #fdf7c8; 
										border-left   : 1px solid #fdf7c8; 
										border-right  : 1px solid #fdf7c8;  
								     }
			.yellow  	 {
											margin-left   :  85px;

											width         : 22px; 

											border     	  : 1px solid #a89200;
											border-bottom : 1px solid #5c5000; 
									     }



			/* graphic adjustment! 
			   margin-top + height = 423px;
			 */					     

			.redinset1   {  height       : 100px; }	
			.redset1	 {  margin-top   : 323px;
							height       : 100px; }								     

			.redinset2   {  height       : 150px; }	
			.redset2	 {  margin-top   : 273px;
							height       : 150px; }	

			.redinset3   {  height       : 180px; }	
			.redset3	 {  margin-top   : 243px;
							height       : 180px; }								     

			.redinset4   {  height       : 220px; }	
			.redset4	 {  margin-top   : 203px;
							height       : 220px; }	

			.redinset5   {  height       : 300px; }	
			.redset5	 {  margin-top   : 123px;
							height       : 300px; }								     

			.redinset6   {  height       : 260px; }	
			.redset6	 {  margin-top   : 163px;
							height       : 260px; }	




			.blueinset1   {  height       : 100px; }	
			.blueset1	  {  margin-top   : 323px;
							 height       : 100px; }								     

			.blueinset2   {  height       : 160px; }	
			.blueset2	  {  margin-top   : 263px;
							 height       : 160px; }	

			.blueinset3   {  height       : 190px; }	
			.blueset3	  {  margin-top   : 233px;
						 	 height       : 190px; }								     

			.blueinset4   {  height       : 210px; }	
			.blueset4	  {  margin-top   : 213px;
							 height       : 210px; }	

			.blueinset5   {  height       : 295px; }	
			.blueset5	  {  margin-top   : 128px;
							 height       : 295px; }								     

			.blueinset6   {  height       : 255px; }	
			.blueset6	  {  margin-top   : 168px;
							 height       : 255px; }	




			.greeninset1   {  height       : 100px; }	
			.greenset1	  {  margin-top   : 323px;
							 height       : 100px; }								     

			.greeninset2   {  height       : 160px; }	
			.greenset2	  {  margin-top   : 263px;
							 height       : 160px; }	

			.greeninset3   {  height       : 190px; }	
			.greenset3	  {  margin-top   : 233px;
						 	 height       : 190px; }								     

			.greeninset4   {  height       : 210px; }	
			.greenset4	  {  margin-top   : 213px;
							 height       : 210px; }	

			.greeninset5   {  height       : 295px; }	
			.greenset5	  {  margin-top   : 128px;
							 height       : 295px; }								     

			.greeninset6   {  height       : 255px; }	
			.greenset6	  {  margin-top   : 168px;
							 height       : 255px; }	




			.yellowinset1   {  height       : 100px; }	
			.yellowset1	    {  margin-top   : 323px;
							   height       : 100px; }								     

			.yellowinset2   {  height       : 160px; }	
			.yellowset2	    {  margin-top   : 263px;
							   height       : 160px; }	

			.yellowinset3   {  height       : 190px; }	
			.yellowset3	    {  margin-top   : 233px;
						 	   height       : 190px; }								     

			.yellowinset4   {  height       : 210px; }	
			.yellowset4	    {  margin-top   : 213px;
							   height       : 210px; }	

			.yellowinset5   {  height       : 295px; }	
			.yellowset5	    {  margin-top   : 128px;
							   height       : 295px; }								     

			.yellowinset6   {  height       : 255px; }	
			.yellowset6	    {  margin-top   : 168px;
							   height       : 255px; }	


			.insetsample   {  height       : 30px; }	
			.setsample	   {  
							  margin       : 0 auto;
							  margin-top   : 0px;
							  height       : 30px; }	



		    .datalines     {

							position 		 :   absolute;
							margin-left      :   40px;
							margin-top       :   20px;
							z-index          :   2;
							
							width            :  50px;
							height           :  50px;
							border           :  1px solid #c11;
		    			   }		   

		    .mainbox1table {
		    					margin           :  0px;
								border           :  1px solid #e3e3e3;	    		
								padding          :  0px;		
		    			   }
		    .mainbox1tableunitw {
									float            :  left;
									z-index          :   1;
									width            :  120px;
									height           :   60px;
									background-color :  #e6e6e6;
									border-right     :  1px solid #c3c3c3;
									border-bottom    :  1px solid #c3c3c3;
		    					}			   
		    .mainbox1tableunitb {
									float            :  left;
									z-index          :   1;
									width            :  120px;
									height           :   60px;
									background-color :  #f6f6f6;
									border-right     :  1px solid #c3c3c3;
									border-bottom    :  1px solid #c3c3c3;
		    					}



		    /* main box 2 */		   
		    .mainbox2  {
							position         : absolute;
							z-index          : 1;
							float            : left;
							margin-left      : 840px;
							margin-top       :  20px;
							height           : 520px;
							width            : 200px;							
							border           :   1px solid #222;
		    		     }							
		    .box2title   {
							position         : relative;
							margin           :   0 auto;
							height           : 80px;
							width            : 160px;			
							font-size		 :  16px;	
							padding  		 :  20px;
							text-align		 :  center;						
							border           :   1px solid #c11;
		    		     }		   
		    .box2core    	  {
			    				position         : relative;
								margin           :   0 auto;
								margin-top		 :  20px;
								text-align		 :  center;		
								font-size		 :  16px;		
								height           : 280px;
								width            : 200px;							
								border           :   1px solid #c11;
			    		      }
		    .box2corebar 	  {
			    				position         : relative;
			    				clear            :  left;
								margin-top		 :   8px;
								margin-bottom	 :   8px;		
								font-size		 :  16px;		
								height           : 40px;
								width            : 195px;							
								border           :   1px solid #c11;
		    			 	  }
		    .box2corebarcolor {
			    				position         : relative;
			    				float            : left;
								margin-top		 :   4px;
								margin-left      :   4px;
								margin-right     :   4px; 
								text-align		 :  left;		
								font-size		 :  16px;		
								height           : 30px;
								width            : 30px;							
								border           :   1px solid #c11;
		    				  }			 	 
		    .box2corebartext  {
			    				position         : relative;
			    				float            : left;
								margin-top		 :   8px;
								text-align		 :  left;		
								font-size		 :  15px;		
								height           :  22px;
								width            : 150px;							
								border           :   1px solid #c11;
		    				  }
		    .box2foot    	  {
			    				position         : relative;
								margin           :   0 auto;
								margin-top		 :  20px;		
								font-size		 :  12px;			
								text-align		 :  center;		
								height           :  60px;
								width            : 200px;							
								border           :   1px solid #c11;
			    		   	  }		   


			.dateviewcore   {    		   	  
								position         : relative;
								float            :   left;
								margin-left      :   22px;
								margin-top       :   22px;
								height           :  515px;
								width            :  500px;							
								border           :    1px solid #f6f6f6;  
						  	}
			.dateviewtitle  {
								position         : relative;
								float            :   left;
								margin-left      :   10px;
								margin-top       :   10px;
								height           :   60px;
								width            :  470px;							
								border           :    1px solid #f6f6f6;  
							}		
			.dateviewtitletext {
									position         : relative;
									float            :   left;
									margin-left      :   10px;
									margin-top       :   12px;
									font-size        :   18px;
									height           :   35px;
									width            :  460px;							
									border           :    1px solid #f6f6f6;  
								}	
			.dateviewtitletextitem {
									position         : relative;
									float            :   left;
									margin-left      :   10px;
									margin-top       :    0px;
									font-size        :   18px;
									height           :   35px;
									width            :  100px;							
									border           :    1px solid #f6f6f6;  
								}					
			.dateviewbox    {
								position         : relative;
								float            :   left;
								margin-left      :    10px;
								margin-top       :    0px;
								height           :   60px;
								width            :  320px;				
								border-right     :    1px solid #eee;  
								border-bottom    :    1px solid #eee; 
							}
			.white          {
								background-color : 	  #fdfdfd;
							}	
			.wgrey          {
								background-color : 	  #fafafa;
							}						
			.dateviewtext   {
								position         : relative;
								float            :   left;
								margin-left      :   10px;
								margin-top       :    17px; 
								font-size        :   16px;  
								text-align       :   left;
								height           :   22px;
								width            :  300px;							
								border           :    1px solid #f6f6f6;  
							}	
			.dateviewitem    {	
								position         : relative;
								float            :   left;	

								height           :    20px;
								width            :  145px;	
								border           :    1px solid #f6f6f6;  
							 }				
			.dateviewunitbox    {
								position         : relative;
								float            :   left;
								margin-left      :    0px;
								margin-top       :    0px;
								height           :   60px;
								width            :  150px;							
								border           :    1px solid #f6f6f6;  
							}
			.dateviewunittext   {
								position         : relative;
								float            :   left;
								margin-left      :   10px;
								margin-top       :   17px; 
								font-size        :   16px;  
								text-align       :   left;
								height           :   22px;
								width            :  100px;							
								border           :    1px solid #f6f6f6;  
							}			




			/* realtime overview */
			.realtimecore   {    		   	  
								position         : relative;
								margin           :    0px auto;
								margin-top       :   22px;
								height           :  515px;
								width            : 1100px;							
								border           :    1px solid #eee;  
						  	}


			.realtimetitle1  {
								position         : relative;
								float            :   left;
								margin-left      :    0px;
								margin-top       :    0px;
								height           :  120px;
								width            :  260px;
								border-left      :    1px solid #fff;		
								border-right     :    1px solid #222;  
							    border-top		 :    1px solid #222;
							    border-bottom    :    1px solid #222;
							}

			.realtimetitle  {
								position         : relative;
								float            :   left;
								margin-left      :    0px;
								margin-top       :    0px;
								height           :   60px;
								width            :  259px;
								border-left      :    1px solid #fff;		
								border-right     :    1px solid #222;  
							    border-top		 :    0px solid #222;
							    border-bottom    :    1px solid #222;
							}
			.realtimetitletext {
									position         : relative;
									float            :   left;
									margin-left      :   10px;
									margin-top       :   12px;
									font-size        :   18px;
									height           :   35px;
									width            :  280px;							
									border           :    0px solid #f6f6f6;  
								}	
			.realtimerealtimetitletextitem {
									position         : relative;
									float            :   left;
									margin-left      :   10px;
									margin-top       :    0px;
									font-size        :   18px;
									text-align       :   left;
									height           :   35px;
									width            :  100px;							
									border           :    0px solid #f6f6f6;  
								}	




			.realtimerow    {
								position         : relative;
								clear            :   both;
								height           :   62px;
								width            :  1100px;				
							}


			.realtimebox1    {
								position         : relative;
								float            :   left;
								height           :   60px;
								width            :  260px;			
								border-left      :    1px solid #222; 	
								border-right     :    1px solid #222;  
								border-bottom    :    1px solid #222; 
							}							
			.realtimebox    {
								position         : relative;
								float            :   left;
								height           :   60px;
								width            :   86px;	
								border-right     :    1px solid #222;  
								border-bottom    :    1px solid #222; 
							}



							/*
			.white          {
								background-color : 	  #fdfdfd;
							}	
			.wgrey          {
								background-color : 	  #fafafa;
							}		*/

			.realtimetext   {
								position         : relative;
								float            :   left;
								margin-left      :     8px;
								margin-top       :    17px; 
								font-size        :    16px;  
								text-align       :   left;
								height           :    22px;
								width            :    80px;							
								border           :     1px solid #f6f6f6;  
							}
			.realtimeitem    {	
								position         : relative;
								float            :   left;	
								height           :   20px;
								width            :   80px;	
								border           :    1px solid #eee;  
							 }	
			.realtimeunitbox    {
								position         : relative;
								float            :   left;
								height           :   60px;
								width            :  150px;							
								border           :    1px solid #eee;  
							}
			.realtimeunittext   {
								position         : relative;
								float            :   left;
								margin-left      :   10px;
								margin-top       :   17px; 
								font-size        :   16px;  
								text-align       :   left;
								height           :   22px;
								width            :  100px;							
								border           :    1px solid #f6f6f6;  
							}	



			/* other function. */				
			.backtotop   {
						   position:relative;
						   margin: 0 auto;
						   clear   :both;
						   height:20px; 
						   text-align: center;
				           padding: 10px;
				           background-color: #fcfcfc;
						 }



		</style>

	</head>

	<body>
		
		<div         class="top"  >
			
			<div     class="topcore" id="topcore">

				<div     class="toplogo"></div>

				<div class="toptitlebox" id="storedatatopbox">
					<div class="toptitleboxtext">店铺数据</div>
				</div>

				<div class="toptitlebox" id="realtimetopbox">
					<div class="toptitleboxtext">实时监控</div>
				</div>

				<div class="toptitlebox" id="analysistopbox">
					<div class="toptitleboxtext">行业分析</div>
				</div>

				<div class="toptitlebox" id="behaviourtopbox">
					<div class="toptitleboxtext">访客行为</div>
				</div>

				<div class="toptitlebox" id="settopbox">
					<div class="toptitleboxtext">设置</div>
				</div>

				<div class="toptitleset">


					<!-- date board -->
					<div class="datecore" id="datecore">

						<div class="dateinitgap"></div>

						<div class="datearrow">
							<button class="datearrowicon" id="dateback">&#xFFE9;</button>
						</div>

						<!-- month date box -->
						<div class="datebox">

							<div class="dateboxtitle">
								<div class="unittext">
									<span class="year">2018</span>年
									<span class="month"></span>月
								</div>
							</div>

						</div>

						<!-- month date box -->
						<div class="datebox">

							<div class="dateboxtitle">
								<div class="unittext">
									<span class="year">2018</span>年
									<span class="month"></span>月		
								</div>						
							</div>

						</div>

						<!-- month date box -->
						<div class="datebox">

							<div class="dateboxtitle">
								<div class="unittext">
									<span class="year">2018</span>年
									<span class="month"></span>月		
								</div>						
							</div>

						</div>


						<div class="datearrow">
							<button class="datearrowicon" id="datenext">&#xFFEB;</button>
						</div>

						<div class="dateselect">

							<div class="datecomptitle">
								<div class="datecomptitletext">选择单品</div>
								<div class="datecomptitletext">
									<form>
										<select name = "dropdown" style="width:245px;">
								            <option align = "center"  value = "Maths"   selected>三C数码</option>
								            <option value = "Physics"        				    >Physics</option>
								            <option value = "Computer"      			        >Computer</option>
								        </select> 
								    </form>
								</div>
							</div>

							<div class="datecomptitle">
								<div class="datecomptitletext">选择单品</div>
								<div class="datecomptitletext">
									<form>
										<select name = "dropdown" style="width:245px;">
								            <option align = "center"  value = "Maths"   selected>三C数码</option>
								            <option value = "Physics"        				    >Physics</option>
								            <option value = "Computer"      			        >Computer</option>
								        </select> 
								    </form>
								</div>
							</div>

							<div class="datecomptitle">
								<div class="datecomptitletext">选择单品</div>
								<div class="datecomptitletext">
									<form>
										<select name = "dropdown" style="width:245px;">
								            <option align = "center"  value = "Maths"   selected>三C数码</option>
								            <option value = "Physics"        				    >Physics</option>
								            <option value = "Computer"      			        >Computer</option>
								        </select> 
								    </form>
								</div>
							</div>

							<div class="datecomptitle">
								<!--
								<div class="datecomptitletext">选择单品</div>
								  -->
								<div class="datecomptitletext">
									<form>
										<select name = "dropdown" style="width:245px;">
								            <option align = "center"  value = "Maths"   selected>三C数码</option>
								            <option value = "Physics"        				    >Physics</option>
								            <option value = "Computer"      			        >Computer</option>
								            <option align = "center"  value = "Maths"   selected>三C数码</option>
								            <option value = "Physics"        				    >Physics</option>
								            <option value = "Computer"      			        >Computer</option>
								        </select> 
								        <input type="text" id="indexitem4" />
								    </form>
								</div>
							</div>

							<div class="dateselectbase dateselectbar">
								<span class="dateselectbase dateselecttextbox">2018年&nbsp;07月&nbsp;12日</span> 
								<span class="dateselectbase dateselecttextmidbox"> -- </span> 
								<span class="dateselectbase dateselecttextbox">2018年&nbsp;07月&nbsp;12日</span>
							</div>

						</div>

						<div class="datecencel">
							<div class="datecencelicon" id="datecencel">
								<span style="margin-left:4px;">×</span>
							</div>
						</div>

					</div>
					
					<!-- top bar dateselector -->
					<div class="dsselector">
						<div class="dateseletortitle">选择其他时间范围</div>
						<div class="dsselectbase dsselectbar">
							<span class="dsselectbase dsselecttextbox">2018年&nbsp;07月&nbsp;12日&nbsp;&#9660;&nbsp;</span> 
							<span class="dsselectbase dsselecttextmidbox"> -- </span> 
							<span class="dsselectbase dsselecttextbox">2018年&nbsp;07月&nbsp;12日&nbsp;&#9660;&nbsp;</span>
						</div>	
					</div>

					<script>
						
						/* date selector hide show function. */
						var datecore = document.getElementById('datecore');
							
						var hidedateselector = function(event) {
							datecore.style.display = 'none';
						}

							/* init setting. */
							hidedateselector();

						var showdateselector = function(event) {
							datecore.style.display = 'block';
						}

						var selecttextbox = document.getElementsByClassName('dsselecttextbox');
						var datecencel    = document.getElementsByClassName('datecencel')[0];

						for ( var i = 0 ; i < selecttextbox.length ; i++ ) {
							selecttextbox[i].addEventListener( 'click' , showdateselector , false );
						}

							      datecencel.addEventListener( 'click' , hidedateselector , false );

						var initboxdate = Number(201807);

						var initpdate   = Number(20180709);
						var endpdate    = Number(20180922);

						var clickdate   = null;  
						var initdate    = null;  
						var enddate     = null;	

						var getmdays    = function(yearmonth) {

							var    year   = Number(yearmonth.toString().substring(0,4));
							var    month  = Number(yearmonth.toString().substring(4,6));
							var    days;
							switch(month) {
								case  1  : days = 31;
										   break;
								case  2  : if  ( year%4==0)  days = 29;
										   else              days = 28;
										   break;
								case  3  : days = 31;
										   break;
								case  4  : days = 30;
										   break;			
								case  5  : days = 31;
										   break;
								case  6  : days = 30;
										   break;
								case  7  : days = 31;
										   break;
								case  8  : days = 31;
										   break;			
								case  9  : days = 30;
										   break;
								case 10  : days = 31;
										   break;			
								case 11  : days = 30;
										   break;
								case 12  : days = 31;
										   break;										 							
							}
							return days;
						}

						var init2click  = function(initdate,clickdate,enddate) {

							var clickcurdays   = Number(clickdate.toString().substring(6,8));
							var clickyearmonth = Number(clickdate.toString().substring(0,6)); 

							var inityearmonth  = Number( initdate.toString().substring(0,6)); 
							var initcurdays    = Number( initdate.toString().substring(6,8)); 							
							var initrestdays   = getmdays(inityearmonth) - initcurdays;

							var endyearmonth   = Number(  enddate.toString().substring(0,6)); 

							var days = 0;

							if( clickyearmonth == inityearmonth ) {
								days = clickcurdays - initcurdays;
							} 
							else {
								for ( var m = clickyearmonth ; m < endyearmonth ; m++ ) 
									days = days + getmdays(m);
								days = days + initrestdays + clickcurdays;
							}
							return days;
						}

						var click2end   = function(initdate,clickdate,enddate) {

							var clickyearmonth = Number(clickdate.toString().substring(0,6)); 
							var clickcurdays   = Number(clickdate.toString().substring(6,8));
							var clickrestdays  = getmdays(clickyearmonth) - clickcurdays;

							var inityearmonth  = Number( initdate.toString().substring(0,6)); 
							var initcurdays    = Number( initdate.toString().substring(6,8)); 							
							var initrestdays   = getmdays(inityearmonth) - initcurdays;

							var endyearmonth   = Number(  enddate.toString().substring(0,6)); 
							var endcurdays     = Number(  enddate.toString().substring(6,8));

							var days = 0;

							if( endyearmonth == inityearmonth ) {
								days = endcurdays - clickcurdays;
							}
							else {
								for ( var m = (clickyearmonth+1) ; m < endyearmonth ; m++ ) 
									days = days + getmdays(m);
								days = days + endcurdays + clickrestdays;
							}
							
							return days;
						}

						var parsedate  = function(initdate,clickdate,enddate) {

							var clickyear = new Number(clickdate.toString().substring(0,4));
							if( clickyear%4==0)
								;
							var clickcurdays   = new Number(clickdate.toString().substring(6,8));
							var clickyearmonth = Number(clickdate.toString().substring(0,6)); 

							var inityearmonth  = Number(initdate.toString().substring(0,6)); 
							var initcurdays    = Number(initdate.toString().substring(6,8)); 							
							var initrestdays   = getmdays(inityearmonth) - initcurdays;
							var clickinitdays;

							var endyearmonth   = Number(enddate.toString().substring(0,6)); 
							var endcurdays     = Number(enddate.toString().substring(4,6));

							var initdays       = Number(0);
							var clickendcurmonth;

							console.log( ' initdays      -- ' + days  );
							
							var    days;
							return days;
						}

						/* selector */
						var dateboxunits = document.getElementsByClassName('dateboxunit');

						var detectunit   = function(event) {
							console.log( '' + event.target.className );
						}

						var yearText     = function(event) {
							var    year  = new String(event.parentNode.getElementsByClassName('dateboxtitle')[0].getElementsByClassName('unittext')[0].getElementsByClassName('year')[0].innerHTML);
							return year;
						}

						var monthText    = function(event) {
					   		var month    = event.parentNode.getElementsByClassName('dateboxtitle')[0].getElementsByClassName('unittext')[0].getElementsByClassName('month')[0].innerHTML;
					   			console.log( '' + month );
					   		switch(month) {
					   			case '一'   : month = '01' ;
					   						  break;								   			
					   			case '二'   : month = '02' ;
					   						  break;
					   			case '三'   : month = '03' ;
					   						  break;								   			
					   			case '四'   : month = '04' ;
					   					  	  break;
					   			case '五'   : month = '05' ;
					   						  break;								   			
					   			case '六'   : month = '06' ;
					   						  break;
					   			case '七'   : month = '07' ;
					   						  break;								   			
					   			case '八'   : month = '08' ;
					   						  break;
					   			case '九'   : month = '09' ;
					   						  break;								   			
					   			case '十'   : month = '10' ;
					   						  break;
					   			case '十一' : month = '11' ;
					   						  break;								   			
					   			case '十二' : month = '12' ;
					   						  break;				   						
					   		}
							return new String(month);
						}

						var dayText = function(event) {
							var    day = new String(event.getElementsByClassName('unittext')[0].innerHTML);
							if(    day.length == 1 ) day = '0'.concat(day);
							return day;
						}


						var dateselector = function(event) {

							// 1.loading date.
							var clickyear   =  yearText(event);
							var clickmonth  = monthText(event);
							var clickday    =   dayText(event);
							var clickdate   = new Number(clickyear+clickmonth+clickday);

							// 1.1.init & end already set.
							if( ( initdate != null)&&( enddate != null ) ) {

								     if(   clickdate > enddate  )
									       enddate   = clickdate;
								      //   nature mode.
								else if(   clickdate < initdate ) {
									  //   enddate   = initdate ;
									       initdate  = clickdate;
								}
								else if( ( clickdate > initdate )&&( clickdate < enddate ) ) {
									 // 1.same month same year.
									 if  ( initdate.toString().substring(0,6) ==
										   enddate.toString().substring( 0,6)  ) {
										   if( (clickdate-initdate)>(enddate-clickdate) )
										   	    enddate  = clickdate;
										   else
										   	    initdate = clickdate;
									}
									// 2.different month same year.
									else
									if  ( initdate.toString().substring(0,4) ==
										  enddate.toString().substring( 0,4)  ) {

									 	  var init2clickdays = init2click(initdate,clickdate,enddate);
									 	  var click2enddays  = click2end(initdate ,clickdate,enddate);

									 	  if( init2clickdays > click2enddays ) 
									 	  	  enddate  = clickdate;
									 	  else 
									 	  	  initdate = clickdate;
									}
								}
							}
							// 1.2.init or end non set.
							else {
								if( initdate == null )
									initdate = clickdate;	
								else {
									     if( clickdate > initdate )
										     enddate   = clickdate;
									else if( clickdate < initdate ) {
											 enddate   = initdate ;
											 initdate  = clickdate;
									}
								}
							}	

						}


						var select       = function(event) {

							// 1.unselect
							if(   ( event.target.parentNode.className == 'dateboxunit unitcurrent' ) ||
								  ( event.target.parentNode.className == 'dateboxunit unitempty'   )  ) {

								// 1.identtify non-empty unit.
								if( event.target.parentNode.getElementsByClassName('unittext')[0].innerHTML != '' ) {

									console.log( 'unitext is not empty...' );
									dateselector(event.target.parentNode);
									/*
									// 1.1.2.4. change color
								    event.target.parentNode.className =  'dateboxunit unitselect';
								    event.target.parentNode.getElementsByClassName('unittext')[0].className = 'unitselecttext';
								    */
								}
								// 1.2.empty unit.
								else console.log('Empty unit.!');
								
							}
							// 1.3.select
							else 
							if(   ( event.target.className == 'dateboxunit unitcurrent' ) ||
								  ( event.target.className == 'dateboxunit unitempty'   )  ) {

								// 1.identtify non-empty unit.
								if( event.target.getElementsByClassName('unittext')[0].innerHTML != '' ) {

									console.log( 'unitext is not empty...' );
									dateselector(event.target);

								}
								// 1.2.empty unit.
								else console.log('Empty unit.!');
								
							}
							else if ( event.target.className == 'dateboxunit unitselect' ) {

							}


							// 1.1.2.4. change color
						    event.target.className = 'dateboxunit unitselect';
						    event.target.getElementsByClassName('unittext')[0].className = 'unitselecttext';


							console.log( ' initdate -- ' + initdate );
							console.log( ' enddate  -- ' + enddate  );
						    console.log( '' );

						}



					    var dateboxes = document.getElementsByClassName('datecore')[0].getElementsByClassName('datebox');

					    for ( var i = 0 ; i < dateboxes.length ; i++ ) {

					    	// 1. week boxes 
					    	for( var units = 0 ; units < 7 ; units++ ) {
					    		 var unit     = document.createElement('div');
					    		 	 unit.className     = 'dateboxunit unitweek';
					    		 var unittext = document.createElement('div');
					    		 	 unittext.className = 'unittext';
					    		 var unitday  ;	 
					    		 	 switch(units) {
					    		 	 	case 0 : unitday = '日';
					    		 	 			 break;
					    		 	 	case 1 : unitday = '一';
					    		 	 			 break;
					    		 	 	case 2 : unitday = '二';
					    		 	 			 break;
					    		 	 	case 3 : unitday = '三';
					    		 	 			 break;	
					    		 	 	case 4 : unitday = '四';
					    		 	 			 break;
					    		 	 	case 5 : unitday = '五';
					    		 	 			 break;
					    		 	 	case 6 : unitday = '六';
					    		 	 			 break; 	 			 
					    		 	 }

					    		 var unitdayTextNode = document.createTextNode(unitday);
					    		 	 unittext.appendChild(unitdayTextNode);

					    		 	 unit.appendChild(unittext);
					    		 	 dateboxes[i].appendChild(unit);

					    	}

					    	var initpym    = Number(initpdate.toString().substring(0,4)); 

					    	var initpday   = Number(initpdate.toString().substring(6,8)); 

					    	var endpym     = Number(endpdate.toString().substring(0,6)); 

					    	// 2.day boxes.
					    	for( var units = 0 ; units < 42 ; units++ ) {
					    		 var unit     = document.createElement('div');
					    		 //if()
					    		 	 unit.className     = 'dateboxunit unitempty';

					    		 var unittext = document.createElement('div');
					    		 	 unittext.className = 'unittext';
					    		 	 unit.appendChild(unittext);
					    		 	 dateboxes[i].appendChild(unit);
					    	}

					    }


					    if( ( initboxdate == initpym )||( (initboxdate+1) == initpym )||( (initboxdate+2) == initpym ) ) {
					    	//
					    }
					    else
					    if( ( initboxdate == endpym  )||( (initboxdate+1) == endpym  )||( (initboxdate+2) ==  endpym ) ) { 
					    	//
					    }



/*
						    	dateboxes[0].getElementsByClassName('dateboxtitle').[i]getElementsByClassName('year')[i].innerHTML = String(initpdate.toString().substring(0,4));
*/

						var boxyear   =  Number( initboxdate.toString().substring(0,4) );
						var boxmonth  =  Number( initboxdate.toString().substring(4,6) );

					    for ( var i = 0 ; i < dateboxes.length ; i++ ) {

					    	// init day parse.
							var year      = String(       initboxdate.toString().substring(0,4));
							var month     = String(Number(initboxdate.toString().substring(4,6))+i);
							
							var emptybox  = Number(new Date(year + "-" + month + "-01").getDay());
							// 6 - Saturday
							if( emptybox==0) emptybox=7;

							var monthdays = getmdays(String(Number(initboxdate.toString().substring(0,6))+i));

								console.log( ' monthdays -- ' + monthdays );
							    console.log( ' emptybox  -- ' + emptybox  );

					    	if( boxmonth == 13 ) {
					    	    boxmonth =  1  ;
					    	    boxyear  =  boxyear  + 1;
					    	}

					    	var monthtxt = null;

					    	switch(boxmonth) {
					    		case 1 : monthtxt = '一';
					    				 break;
					    		case 2 : monthtxt = '二';
					    				 break;
					    		case 3 : monthtxt = '三';
					    				 break;
					    		case 4 : monthtxt = '四';
					    				 break;
					    		case 5 : monthtxt = '五';
					    				 break;
					    		case 6 : monthtxt = '六';
					    				 break;
					    		case 7 : monthtxt = '七';
					    				 break;
					    		case 8 : monthtxt = '八';
					    				 break;
					    		case 9 : monthtxt = '九';
					    				 break;
					    		case 10 : monthtxt = '十';
					    				 break;
					    		case 11 : monthtxt = '十一';
					    				 break;
					    		case 12 : monthtxt = '十二';
					    				 break;
					    	}

					    	// load year
				    		dateboxes[i].getElementsByClassName('dateboxtitle')[0].getElementsByClassName('year' )[0].innerHTML = boxyear;

					    	// load month
				    		dateboxes[i].getElementsByClassName('dateboxtitle')[0].getElementsByClassName('month')[0].innerHTML = monthtxt;

							var dateboxunits = dateboxes[i].getElementsByClassName('dateboxunit');    

							for( var box = (7+emptybox) ; box < (7+emptybox+monthdays) ; box++ ) {
								//dateboxunits[i].addEventListener( 'mouseover' , detectunit , false );
								
								dateboxunits[box].addEventListener( 'click'     , select     , false );

								dateboxunits[box].getElementsByClassName('unittext')[0].innerHTML = box-(6+emptybox);
								
							}

							boxmonth = boxmonth + 1;

						}

						console.log( document.body );

					</script>

				</div>

			</div>

		</div>

		<div     class="main" id="graphicdata">

			<div class="maincore">

				<div class="mainbox1">

					<div class="mainfrequencycore">
						<div class="frequencybox">
							<div class="frequencytext">日概况</div>
						</div>
						<div class="frequencybox">
							<div class="frequencytext">周概况</div>
						</div>
						<div class="frequencybox">
							<div class="frequencytext">月概况</div>
						</div>
						<div class="frequencybox">
							<div class="frequencytext">年概况</div>
						</div>
					</div>

					<div class="maintitledatecore">
						<div class="maintitledatebox">
							<div class="maintitledatetext">成交额 : ￥5000</span></div>
						</div>
						<div class="maintitledatebox">
							<div class="maintitledatetext">订单数 : <span>200</span></div>
						</div>
						<div class="maintitledatebox">
							<div class="maintitledatetext">访客数 : <span>2000</span></div>
						</div>
						<div class="maintitledatebox">
							<div class="maintitledatetext">浏览量 : <span>3000</span></div>
						</div>
					</div>

					<div class="mainbox1core">

						<!-- left data -->
						<div class="mainbox1leftboard">

							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">120,000</div>
							</div>
							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">100,000</div>
							</div>
							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">80,000</div>
							</div>
							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">60,000</div>
							</div>
							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">40,000</div>
							</div>
							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">20,000</div>
							</div>
							<div class="mainbox1lefttableunit">
								<div class="mainbox1lefttableunittext">00,000</div>
							</div>		

						</div>


						<!-- graphic core. -->
						<div class="mainboxgraphiccore">


							<div class="mainboxgraphicbox">

								<div class="graphic red redset1">
									<div class="graphicin redin redinset1"></div>
								</div>
								<div class="graphic blue blueset1">
									<div class="graphicin bluein blueinset1"></div>
								</div>
								<div class="graphic green greenset1">
									<div class="graphicin greenin greeninset1"></div>
								</div>
								<div class="graphic yellow yellowset1">
									<div class="graphicin yellowin yellowinset1"></div>
								</div>

							</div>


							<div class="mainboxgraphicbox">

								<div class="graphic red redset2">
									<div class="graphicin redin redinset2"></div>
								</div>
								<div class="graphic blue blueset2">
									<div class="graphicin bluein blueinset2"></div>
								</div>
								<div class="graphic green greenset2">
									<div class="graphicin greenin greeninset2"></div>
								</div>
								<div class="graphic yellow yellowset2">
									<div class="graphicin yellowin yellowinset2"></div>
								</div>

							</div>


							<div class="mainboxgraphicbox">

								<div class="graphic red redset3">
									<div class="graphicin redin redinset3"></div>
								</div>
								<div class="graphic blue blueset3">
									<div class="graphicin bluein blueinset3"></div>
								</div>
								<div class="graphic green greenset3">
									<div class="graphicin greenin greeninset3"></div>
								</div>
								<div class="graphic yellow yellowset3">
									<div class="graphicin yellowin yellowinset3"></div>
								</div>

							</div>



							<div class="mainboxgraphicbox">

								<div class="graphic red redset4">
									<div class="graphicin redin redinset4"></div>
								</div>
								<div class="graphic blue blueset4">
									<div class="graphicin bluein blueinset4"></div>
								</div>
								<div class="graphic green greenset4">
									<div class="graphicin greenin greeninset4"></div>
								</div>
								<div class="graphic yellow yellowset4">
									<div class="graphicin yellowin yellowinset4"></div>
								</div>

							</div>


							<div class="mainboxgraphicbox">

								<div class="graphic red redset5">
									<div class="graphicin redin redinset5"></div>
								</div>
								<div class="graphic blue blueset5">
									<div class="graphicin bluein blueinset5"></div>
								</div>
								<div class="graphic green greenset5">
									<div class="graphicin greenin greeninset5"></div>
								</div>
								<div class="graphic yellow yellowset5">
									<div class="graphicin yellowin yellowinset5"></div>
								</div>

							</div>


							<div class="mainboxgraphicbox">

								<div class="graphic red redset6">
									<div class="graphicin redin redinset6"></div>
								</div>
								<div class="graphic blue blueset6">
									<div class="graphicin bluein blueinset6"></div>
								</div>
								<div class="graphic green greenset6">
									<div class="graphicin greenin greeninset6"></div>
								</div>
								<div class="graphic yellow yellowset6">
									<div class="graphicin yellowin yellowinset6"></div>
								</div>

							</div>

						</div>

						<script>
						</script>

						<!-- core table -->
						<div class="mainbox1board">

							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>							
							<div class="unitw"></div>
							<div class="unitw"></div>

							<div class="gap"></div>
						
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>

							<div class="gap"></div>

							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>							
							<div class="unitw"></div>
							<div class="unitw"></div>

							<div class="gap"></div>
						
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							
							<div class="gap"></div>

							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>							
							<div class="unitw"></div>
							<div class="unitw"></div>

							<div class="gap"></div>
						
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							<div class="unitb"></div>
							
							<div class="gap"></div>

							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>
							<div class="unitw"></div>							
							<div class="unitw"></div>
							<div class="unitw"></div>

						</div>
	 

						<div         class="mainbox1downboard">

							<div     class="mainbox1downunit">
								<div class="mainbox1downunittext">七月</div>
							</div>
							<div     class="mainbox1downunit">
								<div class="mainbox1downunittext">八月</div>
							</div>
							<div     class="mainbox1downunit">
								<div class="mainbox1downunittext">九月</div>
							</div>
							<div     class="mainbox1downunit">
								<div class="mainbox1downunittext">十月</div>
							</div>
							<div     class="mainbox1downunit">
								<div class="mainbox1downunittext">十一月</div>
							</div>	
							<div     class="mainbox1downunit">
								<div class="mainbox1downunittext">十二月</div>
							</div>																											
						</div>

					</div>

				</div>

				<div class="mainbox2">

					<div class="box2title">
						<div style="font-size:14px;">选择热搜词</div>
						<div>
						<select name = "dropdown" style="width:150px;">
				            <option align = "center"  value = "Maths"   selected>Maths</option>
				            <option value = "Physics"        				    >Physics</option>
				            <option value = "Computer"      			        >Computer</option>
				        </select> 
				    </div>

				    <div style="font-size:14px;">
						类目&nbsp;&nbsp;: 三C数码 <br />
										   热搜词&nbsp;: 手机壳</div>
				    </div>

					<div class="box2core">

						<div class="box2corebar">
							<div class="box2corebarcolor">
								<div class="graphic red setsample">
									<div class="graphicin redin insetsample"></div>
								</div>
							</div>
							<div class="box2corebartext">我的店铺</div>
						</div>
						<div class="box2corebar">
							<div class="box2corebarcolor">
								<div class="graphic blue setsample">
									<div class="graphicin bluein insetsample"></div>
								</div>
							</div>
							<div class="box2corebartext">行业平均</div>
						</div>
						<div class="box2corebar">
							<div class="box2corebarcolor">
								<div class="graphic green setsample">
									<div class="graphicin greenin insetsample"></div>
								</div>
							</div>
							<div class="box2corebartext">同类目店铺A</div>
						</div>
						<div class="box2corebar">
							<div class="box2corebarcolor">
								<div class="graphic yellow setsample">
									<div class="graphicin yellowin insetsample"></div>
								</div>
							</div>
							<div class="box2corebartext">同类目店铺B</div>
						</div>
					</div>
					<div class="box2foot">@copyright 2018</div>
				</div>

			</div>


			<div         class="maincore">
				<div     class="dateviewcore">
					<div class="dateviewtitle">
						<div class="dateviewtitletext">
							<div class="dateviewtitletextitem">今日</div><span>2018年7月31日</span>--<span>2018年8月01日</span></div>
						</div>
					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">成交金额(元)  </div>
							<div class="dateviewitem" >: ￥ 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

					<div class="dateviewbox white">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">订单数量  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox white">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">访客数量  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

					<div class="dateviewbox white">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">页面浏览  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox white">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">成交转化率  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; %30.60</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

					<div class="dateviewbox white">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">平均停留时间(秒)  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 30.5</div>
						</div>
					</div>
					<div class="dateviewunitbox white">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">新增访客  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 300,000</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext"><span style="color:#c11;">↑</span></div>
					</div>

				</div>



				<div     class="dateviewcore">
					<div class="dateviewtitle">
						<div class="dateviewtitletext">
							<div class="dateviewtitletextitem">昨日</div><span>2018年7月30日</span>--<span>2018年7月31日</span></div>
						</div>
					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">成交金额  </div>
							<div class="dateviewitem" >: ￥ 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext">元</div>
					</div>

					<div class="dateviewbox white">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">订单数量  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox white">
						<div class="dateviewunittext">个</div>
					</div>

					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">访客数量  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext">位</div>
					</div>

					<div class="dateviewbox white">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">页面浏览  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 90,000,000,000</div>
						</div>
					</div>
					<div class="dateviewunitbox white">
						<div class="dateviewunittext">个</div>
					</div>

					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">成交转化率  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; %30.60</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext">个</div>
					</div>

					<div class="dateviewbox white">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">平均停留时间  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 30.5</div>
						</div>
					</div>
					<div class="dateviewunitbox white">
						<div class="dateviewunittext">秒</div>
					</div>

					<div class="dateviewbox wgrey">
						<div class="dateviewtext">
							<div class="dateviewitem" id="thispayment">新增访客  </div>
							<div class="dateviewitem" >: &nbsp;&nbsp;&nbsp; 300,000</div>
						</div>
					</div>
					<div class="dateviewunitbox wgrey">
						<div class="dateviewunittext">位</div>
					</div>

				</div>

			</div>


		</div>


		


		<!-- main realtime overview -->
		<div     class="main" id="behaviour">

			<div class="maincore">

				<div     class="realtimecore">

					<!-- visit entry. -->
					<div class="realtimetitle1">
						<div class="realtimetitletext">
							<div class="realtimetitletextitem">访客入口</div><span>新用户</span>--<span>2018年8月01日</span>
						</div>
					</div>

					<div class="realtimetitle">
						<div class="realtimetitletext">
							<div class="realtimetitletextitem">访客入口</div><span>新用户</span>--<span>2018年8月01日</span>
						</div>
					</div>
					<div class="realtimetitle">
						<div class="realtimetitletext">
							<div class="realtimetitletextitem">行为</div><span>新用户</span>--<span>2018年8月01日</span>
						</div>
					</div>
					<div class="realtimetitle">
						<div class="realtimetitletext">
							<div class="realtimetitletextitem">转化</div><span>新用户</span>--<span>2018年8月01日</span>
						</div>
					</div>


						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >访问载体</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >新浏览用户</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >新用户</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >转化率</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >浏览深度</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >平均浏览时间</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >目标转化率</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >目标完成度</div>
							</div>
						</div>
						<div class="realtimebox wgrey">
							<div class="realtimetext">
								<div class="realtimeitem" >目标成交额</div>
							</div>
						</div>	


					<!-- title -->
					<div class="realtimerow">

						<div style="height:120px;" class="realtimebox1 wgrey">
							<div style="margin-top:48px;" class="realtimetext" >
								<div class="realtimeitem" ></div>
							</div>
						</div>

						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >70%</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >新浏览用户</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >新用户</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >30.92%</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >3<br /><span>平均</span></div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >80</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >35%</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >55%</div>
							</div>
						</div>
						<div style="height:120px;" class="realtimebox wgrey">
							<div style="margin-top:48px;" class="realtimetext">
								<div class="realtimeitem" >800,000,000</div>
							</div>
						</div>	


					</div>

					<!-- title -->
					<div class="realtimerow">

						<div class="realtimebox1 white">
							<div class="realtimetext">
								<div class="realtimeitem" >1.直接访问</div>
							</div>
						</div>

						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >手机</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >11389(52%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >12099(43%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.8</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >93</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >45%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >82.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >89,099,880</div>
							</div>
						</div>	

					</div>



					<!-- title -->
					<div class="realtimerow">

						<div class="realtimebox1 white">
							<div class="realtimetext">
								<div class="realtimeitem" >2.社交软件</div>
							</div>
						</div>

						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >手机</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >11389(52%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >12099(43%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.8</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >93</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >45%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >82.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >89,099,880</div>
							</div>
						</div>	

					</div>


					<!-- title -->
					<div class="realtimerow">

						<div class="realtimebox1 white">
							<div class="realtimetext">
								<div class="realtimeitem" >3.关联访问</div>
							</div>
						</div>

						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >访问载体</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >新浏览用户</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >新用户</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >转化率</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >浏览深度</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >平均浏览时间</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >目标转化率</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >目标完成度</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >目标成交额</div>
							</div>
						</div>						
					</div>


					<!-- title -->
					<div class="realtimerow">

						<div class="realtimebox1 white">
							<div class="realtimetext">
								<div class="realtimeitem" >4.普通搜索</div>
							</div>
						</div>

						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >手机</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >11389(52%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >12099(43%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.8</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >93</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >45%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >82.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >89,099,880</div>
							</div>
						</div>	

					</div>



					<!-- title -->
					<div class="realtimerow">

						<div class="realtimebox1 white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.活动访问</div>
							</div>
						</div>

						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >手机</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >11389(52%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >12099(43%)</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >5.8</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >93</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >45%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >82.5%</div>
							</div>
						</div>
						<div class="realtimebox white">
							<div class="realtimetext">
								<div class="realtimeitem" >89,099,880</div>
							</div>
						</div>	

					</div>

				</div>	


				</div>

			</div>

		</div>

		<div     class="main" id="realtime">

			<div class="maincore">


					<div     class="realtimecore">

						<!-- visit entry. -->
						<div class="realtimetitle1">
							<div class="realtimetitletext">
								<div class="realtimetitletextitem">访客入口</div><span>新用户</span>--<span>2018年8月01日</span>
							</div>
						</div>

						<div class="realtimetitle">
							<div class="realtimetitletext">
								<div class="realtimetitletextitem">访客入口</div><span>新用户</span>--<span>2018年8月01日</span>
							</div>
						</div>
						<div class="realtimetitle">
							<div class="realtimetitletext">
								<div class="realtimetitletextitem">行为</div><span>新用户</span>--<span>2018年8月01日</span>
							</div>
						</div>
						<div class="realtimetitle">
							<div class="realtimetitletext">
								<div class="realtimetitletextitem">转化</div><span>新用户</span>--<span>2018年8月01日</span>
							</div>
						</div>


							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >访问载体</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >新浏览用户</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >新用户</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >转化率</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >浏览深度</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >平均浏览时间</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >地区</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >目标完成度</div>
								</div>
							</div>
							<div class="realtimebox wgrey">
								<div class="realtimetext">
									<div class="realtimeitem" >目标成交额</div>
								</div>
							</div>	


						<!-- title -->
						<div class="realtimerow">

							<div style="height:120px;" class="realtimebox1 wgrey">
								<div style="margin-top:48px;" class="realtimetext" >
									<div class="realtimeitem" ></div>
								</div>
							</div>

							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >70%</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >新浏览用户</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >新用户</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >30.92%</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >3<br /><span>平均</span></div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >80</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >35%</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >55%</div>
								</div>
							</div>
							<div style="height:120px;" class="realtimebox wgrey">
								<div style="margin-top:48px;" class="realtimetext">
									<div class="realtimeitem" >800,000,000</div>
								</div>
							</div>	


						</div>

						<!-- title -->
						<div class="realtimerow">

							<div class="realtimebox1 white">
								<div class="realtimetext">
									<div class="realtimeitem" >直接访问</div>
								</div>
							</div>

							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >手机</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >11389(52%)</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >12099(43%)</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >5.5%</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >5.8</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >93</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >45%</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >82.5%</div>
								</div>
							</div>
							<div class="realtimebox white">
								<div class="realtimetext">
									<div class="realtimeitem" >89,099,880</div>
								</div>
							</div>	

						</div>


				</div>


			</div>


		</div>

		<!-- show data. -->
		<script>

			var topcore          = document.getElementById('topcore');

			var storedatatopbox  = document.getElementById('storedatatopbox');
			var realtimetopbox   = document.getElementById('realtimetopbox' );
			var analysistopbox   = document.getElementById('analysistopbox' );
			var behaviourtopbox  = document.getElementById('behaviourtopbox');

			var graphicdata      = document.getElementById('graphicdata');
			var realtime         = document.getElementById('realtime');
			var behaviour        = document.getElementById('behaviour');

			var hiderealtime     = function(event) {
				realtime.style.display = 'none';
			}

			var hidestoredata    = function(event) {
				graphicdata.style.display = 'none';
			}

			var hidebehaviour = function(event) {
				behaviour.style.display = 'none';
			}

			var showstoredata    = function(event) {
				hiderealtime();			
				hidebehaviour();
				graphicdata.style.display = 'block';	
			}

			var showrealtime     = function(event) {
				graphicdata.style.display = 'none';
				behaviour.style.display = 'none';
				realtime.style.display = 'block';	
			}

			var showbehaviour    = function(event) {
				graphicdata.style.display = 'none';
				realtime.style.display    = 'none';	
				behaviour.style.display = 'block';
			}

				//hidestoredata();
				hiderealtime();
				hidebehaviour();


			storedatatopbox.addEventListener( 'click' , showstoredata , false );
			realtimetopbox.addEventListener(  'click' , showrealtime  , false );
			behaviourtopbox.addEventListener( 'click' , showbehaviour , false );


		</script>


		<div class="backtotop">返回顶部</div>


	</body>


</html>








