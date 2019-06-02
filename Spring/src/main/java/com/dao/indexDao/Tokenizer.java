package com.dao.indexDao;

import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class Tokenizer {
	
	private class TokenInfo {
	    public final Pattern regex;
	    public final int token;

	    public TokenInfo(Pattern regex, int token) {
	      super();
	      this.regex = regex;
	      this.token = token;
	    }
  	}
	
	private LinkedList<TokenInfo> tokenInfos;
	
	public Tokenizer() {
	  tokenInfos = new LinkedList<TokenInfo>();
	}
	
	public void add(String regex, int token) {
		
	    tokenInfos.add( new TokenInfo( Pattern.compile("^("+regex+")") , token ) );
	    
	}
	
	/*
    public boolean isPatternMatching(String line){
        
        Pattern ptn = Pattern.compile("\\d{2}$");
        Matcher mtch = ptn.matcher(line);
        if(mtch.find()){
            return true;
        }
        return false;
    }
    */
    
    // Number identification.
    public static void isStringNumber(String no){
        System.out.println(no.matches("(\\d+)"));
    }
    
    
    public boolean isPatternMatching(String line){
        
        Pattern ptn = Pattern.compile("java", Pattern.CASE_INSENSITIVE);
        Matcher mtch = ptn.matcher(line);
        if(mtch.find()){
            return true;
        }
        
        return false;
        
    }
    
    
    public static void main(String a[]){
    	
    	Tokenizer.isStringNumber("345");
    	Tokenizer.isStringNumber("34we");
    	Tokenizer.isStringNumber("345w12");
    	Tokenizer.isStringNumber("956");
    	
    	
    	Tokenizer tokenizer = new Tokenizer();
        System.out.println("Is 'ddfsa12' ends with min 2 digits? "
                    +tokenizer.isPatternMatching("ddfsa12"));
        System.out.println("Is 'ddfsa12adf1' ends with min 2 digits? "
                    +tokenizer.isPatternMatching("ddfsa12adf1"));
        
    }
	
	
}
