package com.indexCenter;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bean.FirstBoxImg;
import com.buffer.imgbuffer.BoxImgBuffer.LONGEREDGE;
import com.dao.indexDao.IndexDao;
import com.dao.productDao.FirstBoxImgDao;
import com.dao.uuid.UuidUtils;
import com.userCenter.productCenter.ProductPage;
import com.userCenter.productCenter.imgCenter.BoxImgCenter;

@Controller
public class IndexCenter {
	
	@RequestMapping(value={"/indexPage"},method=RequestMethod.GET)
	public ModelAndView indexPage( HttpServletRequest request ,
			                       ModelAndView       mav     ,
			                       HttpSession        session ) throws IOException {
		
		
		
		
		/**************** Basic infor ****************/
		String     basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();  
		String     keyword  = URLDecoder.decode(        request.getParameter( "keyword" ) ,"utf-8");
		Integer    page     = Integer.valueOf   (       request.getParameter( "page"    ) );
        /*********************************************/ 
		
		
		
		
		/**************** Basic infor ****************/
				   session.removeAttribute( "keyword" );
				   session.setAttribute   ( "keyword"  , keyword );
				           
				   session.removeAttribute( "page"    );
				   session.setAttribute   ( "page"     , page    );
		/*********************************************/ 		
		
		
		
		
		String     sc       = "DESC";
		
		System.out.println( "--------IndexPage--------" );
		System.out.println( "keyword -- " + keyword     );
		System.out.println( "page    -- " + page        );
		
		
		
		
		// 1.create main list.
    	/******************** parse keyword ********************/ 
		
		
		
		
		IndexDao.init();
		
		List<String>	         keyList    =  new ArrayList<String>();
		     String[] 	         keywords   =  keyword.split(" ");
		
		for(   int i = 0  ;  i < keywords.length  ;  i++   ) 
			   if(              !keywords[i].equals("")    )
		       keyList.add(  "%"+keywords[i]+"%"           );
		
        /**********************************************************/ 
		
		
		
		
			System.out.println( "----Entering keyword parser----" );
			
			Map<String,Object>  imap            = new HashMap<String,Object>();
			
			// 3.not like function.	
			List<String>        keynolist       = new ArrayList<String>();
								keynolist.add("");
			
			
			
			
			// 4.order by
			String              order           = new String("value");
			
			
			int                 productPerPage  = 16;
			int                 limit           = 0;
			int                 offset          = 0;
			
			
			                    limit           = productPerPage           ;
			                    offset          = productPerPage * (page-1);
			
			
			                    imap.put( "limit"     ,  limit    );
			                    imap.put( "offset"    ,  offset   );
			                    imap.put( "order"     ,  order    );
			                    imap.put( "sc"        ,  sc       );
			                    imap.put( "keylist"   , keyList   );
			                    imap.put( "keynolist" , keynolist );
			
			
			List<Integer>       pageoffList     = new ArrayList<Integer>();
			
			
								imap.put( "pageoffList" , pageoffList );
			
			
	        Integer                   initp     = new Integer(1);
	        
	        if  ( ( page-1 )%10==0 )  initp     = page ;
	        else                      initp     = page - (page-1)%10;
			
	        
			for ( int pg = initp ; pg <= (10+initp) ; pg++ ) 
				  pageoffList.add(productPerPage * (pg-1));
			
			
			// 2.query result.
			
			List<FirstBoxImg> firstBoxImgList = IndexDao.index(imap);
			System.out.println( "size of querying boximg result -- " + firstBoxImgList.size() );
			
			
			
				
	    	/******************** index box ********************/  
			
			List<String>     indexPageproductidList           =  new ArrayList();
			
			List<String>     indexPageFirstboximgList         =  new ArrayList();
			//List<String>     indexPageImgLongerEdgeList       =  new ArrayList();
			
			List<String>     indexPageProductnameList         =  new ArrayList();
			List<String>     indexPageProductpriceList        =  new ArrayList();
			
			
			Iterator         firstboximgList                  =  firstBoxImgList.iterator();
			UUID             productiduuid                    =  null;
			
			
			
			
			while(firstboximgList.hasNext()) {
				
				FirstBoxImg           firstBoxImg    =  (FirstBoxImg)firstboximgList.next          ();
				String                firstboximg    =               firstBoxImg    .getFirstboximg();
				
				System.out.println(  "firstboximg  " +   firstboximg );
				
				
				String                rootPath       =   new String("c:/tomcat/webapps/Spring/WEB-INF");
				
				// 2.2.restore boximg part.
				if(  (firstboximg!=null)&&(new File(rootPath+firstboximg).exists())  ) {
					
					System.out.println( "firstboximg has been recorded to List. " );
					indexPageFirstboximgList.add(firstboximg);
					
					// 1.identify longer edge.
					/*
					if( ProductPage.getLongEdge(basePath, firstboximg).equals(LONGEREDGE.HEIGHT) )
						indexPageImgLongerEdgeList.add("HEIGHT");
					else 
						indexPageImgLongerEdgeList.add("WIDTH" );
					*/
					
				} else {
					
					System.out.println( "firstboximg file not exists... " );
					// set default img Path.
					indexPageFirstboximgList  .add("/img/default/userCenter/productCenter/280_280.jpg");
					
					//indexPageImgLongerEdgeList.add("HEIGHT" );
				}
				
				
				
				
				System.out.println( "converting productid..." );
				
			                  productiduuid  =  UuidUtils.asUuid(firstBoxImg.getProductid() );
			    
			    indexPageproductidList       .add(  productiduuid.toString    () );
			    System.out.println( "           productid -- " + productiduuid.toString  () );
			    
			    
			    indexPageProductnameList     .add(  firstBoxImg.getProductname() );
			    indexPageProductpriceList    .add(  firstBoxImg.getPrice      () );
			    
			}
	    
			
				session.setAttribute( "indexPageproductidList"           , indexPageproductidList         ); 
				
			    session.setAttribute( "indexPageFirstboximgList"         , indexPageFirstboximgList       );
			    //session.setAttribute( "indexPageImgLongerEdgeList"       , indexPageImgLongerEdgeList     ); 
			    
	            session.setAttribute( "indexPageProductnameList"         , indexPageProductnameList       ); 		
	            session.setAttribute( "indexPageProductpriceList"        , indexPageProductpriceList      ); 	
	            
            /**********************************************************/ 
            
            
            
            
    		/******************** index page part. ********************/           
            
    		List<Integer>    indexPagesList                   =  new ArrayList();
							 indexPagesList = IndexDao.indexPages(imap);
							
				             session.setAttribute( "indexPagesList"                   , indexPagesList                 ); 
				             session.setAttribute( "page"                             ,      page                      ); 
				            
		    System.out.println(   "product   count                 -- "  + indexPageproductidList.size()  );
            System.out.println(   "indexPage Storing session finish..."  + "\n"                           );
            
            /**********************************************************/  
            
            
            
        	
    		/******************** Recommand boximg part. ********************/
            
    						   					                   FirstBoxImgDao.init();
    		//UUID                           uuidt                =  UUID.fromString(productid);
    			
    		List<FirstBoxImg>           recfirstboximgList      =  null;   		
    		
    		if(                            firstBoxImgList.size() > 0 ) 				   					                   
    			                        recfirstboximgList      =  FirstBoxImgDao.queryRecommand7ProductsByID(  firstBoxImgList.get(0).getProductid()  );		
    		else 						recfirstboximgList      =  new ArrayList<FirstBoxImg>();
    		
    		
    		Iterator                    recfirstboximgListiter  =  recfirstboximgList.iterator();
    		System.out.println( "1.FirstBoxImg List size -- " + recfirstboximgList.size() );
    		
    		Map<FirstBoxImg,LONGEREDGE> recommandBoxImgMap   =  new  HashMap<FirstBoxImg,LONGEREDGE>();
    		
    		System.out.println( "2.list default img path." );
    		String                      defaultimg           =  new  String("/img/default/userCenter/productCenter/280_280.jpg");
    		
    		for ( int i = 0 ; recfirstboximgListiter.hasNext() ; i++ ) {
    			
    			FirstBoxImg   firstboximg = (FirstBoxImg)recfirstboximgListiter.next();
    			
    			String        rootPath    =  new String("c:/tomcat/webapps/Spring/WEB-INF");
    			
    			File                    imgfile              =  new  File(rootPath+firstboximg.getFirstboximg());
    			
    			System.out.println( "3.test img file exists or not -- " );
    			System.out.println( "number " + i + "  img " + " -- " + basePath + firstboximg.getFirstboximg() );
    			
    			if( imgfile.exists() ) {
    				System.out.println( "number " + i + " img exists. " );
    				System.out.println( "number " + i + " img longer edge -- " + BoxImgCenter.getLongEdge160( basePath , firstboximg.getFirstboximg() ).name() );
    				
    				// set longer edge.
    				switch ( BoxImgCenter.getLongEdge160( basePath , firstboximg.getFirstboximg() ) ) {
    					case HEIGHT : recommandBoxImgMap.put(firstboximg, LONGEREDGE.HEIGHT );
    					case NONE   : recommandBoxImgMap.put(firstboximg, LONGEREDGE.NONE   );
    					default     : recommandBoxImgMap.put(firstboximg, LONGEREDGE.WIDTH  );
    				}
    				
    			} else {
    				System.out.println( "number " + i + "  img not exists." );
    				firstboximg.setPhotoaddr(defaultimg);
    				recommandBoxImgMap.put( firstboximg , LONGEREDGE.HEIGHT );
    			}
    		}
    				session.setAttribute( "recommandBoxImgMap" , recommandBoxImgMap );
    				
    		/****************************************************/ 
    		
    		
    		
    		
		       mav.setViewName("indexCenter/indexPage");
		return mav;
		
		
		
		
	}
	
	
	
	
}



