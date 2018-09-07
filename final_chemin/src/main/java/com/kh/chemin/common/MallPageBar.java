package com.kh.chemin.common;

public class MallPageBar {
	public static String getPage(int cPage, int numPerPage, int totalContents, String url)
	   {
	      String pageBar="";
	      int pageBarSize=5;
	      
	      int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      pageBar+="<div class='pagination flex-m flex-w p-t-26'>";
	      
	      if(pageNo==1)
	      {
	    	  pageBar+="<a class='item-pagination flex-c-m trans-0-4'><</a>";
	      }
	      else
	      {
	    	  pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")' class='item-pagination flex-c-m trans-0-4'><</a>";
	      }
	      
	      while(!(pageNo>pageEnd || pageNo>totalPage))
	      {
	         if(cPage==pageNo)
	         {
	        	 pageBar+="<a class='item-pagination flex-c-m trans-0-4 active-pagination'>"+pageNo+"</a>";
	         }
	         else
	         {
	        	 pageBar+="<a class='item-pagination flex-c-m trans-0-4' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
	         }
	         pageNo++;
	      }
	      if(pageNo>totalPage)
	      {
	    	  pageBar+="<a class='item-pagination flex-c-m trans-0-4'>></a>";
	      }
	      else
	      {
	    	  pageBar+="<a href='javascript:fn_paging("+pageNo+")' class='item-pagination flex-c-m trans-0-4'>></a>";
	      }
	      pageBar+="</div>";
	      
	      pageBar+="<script>";
	      pageBar+="function fn_paging(cPage,numPerPage){";
	      pageBar+="location.href='"+url+"?cPage='+cPage;";
	      pageBar+="}";
	      pageBar+="</script>";
	      
	      return pageBar;
	   }
	
	
	
	public static String getPageMall(int cPage, int numPerPage, int totalContents)
	   {
	      String pageBar="";
	      int pageBarSize=5;
	      
	      int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      pageBar+="<div class='pagination flex-m flex-w p-t-26'>";
	      
	      if(pageNo==1)
	      {
	    	  pageBar+="<a class='item-pagination flex-c-m trans-0-4'><</a>";
	      }
	      else
	      {
	    	  pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")' class='item-pagination flex-c-m trans-0-4'><</a>";
	      }
	      
	      while(!(pageNo>pageEnd || pageNo>totalPage))
	      {
	         if(cPage==pageNo)
	         {
	        	 pageBar+="<a class='item-pagination flex-c-m trans-0-4 active-pagination'>"+pageNo+"</a>";
	         }
	         else
	         {
	        	 pageBar+="<a class='item-pagination flex-c-m trans-0-4' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
	         }
	         pageNo++;
	      }
	      if(pageNo>totalPage)
	      {
	    	  pageBar+="<a class='item-pagination flex-c-m trans-0-4'>></a>";
	      }
	      else
	      {
	    	  pageBar+="<a href='javascript:fn_paging("+pageNo+")' class='item-pagination flex-c-m trans-0-4'>></a>";
	      }
	      pageBar+="</div>";
	      
	      pageBar+="<script>";
	      pageBar+="function fn_paging(cPage,numPerPage){";
	      pageBar+="list_ck(cPage);";
	      pageBar+="}";
	      pageBar+="</script>";
	      
	      return pageBar;
	   }
}

