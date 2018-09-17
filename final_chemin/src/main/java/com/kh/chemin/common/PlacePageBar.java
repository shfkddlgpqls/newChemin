package com.kh.chemin.common;

public class PlacePageBar {
	public static String getPagePlace(int cPage, int numPerPage, int totalContents)
	   {
		 String pageBar="";
	      int pageBarSize=5;
	      
	      int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      pageBar+="<div class='pagination'>";
	    
	      
	      if(pageNo==1)
	      {
	    	  pageBar+="<li><a  href='javascript:fn_paging_ad_qna("+pageNo+")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
	      }
	      else
	      {
	    	  pageBar+= "<li><a  href='javascript:fn_paging_ad_qna("+(pageNo-1)+")'aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
	      }
	      
	      while(!(pageNo>pageEnd || pageNo>totalPage))
	      {
	         if(cPage==pageNo)
	         {
	        	 pageBar+="<li><a  href='javascript:fn_paging_ad_qna("+cPage+")'>"+pageNo+"</a></li>";
	         }
	         else
	         {
	        	 pageBar+= "<li><a  href='javascript:fn_paging_ad_qna("+pageNo+")' aria-label='Previous'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
	         }
	         pageNo++;
	      }
	      if(pageNo>totalPage)
	      {
	    	  pageBar+="<li><a  href='javascript:fn_paging_ad_qna("+totalPage+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
	      }
	      else
	      {
	    	  pageBar+="<li><a class='active-item' href='javascript:fn_paging_ad_qna("+pageNo+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
	      }
	
	      pageBar+="</div>";
	      
	      pageBar+="<script>";
	      pageBar+="function fn_paging_ad_qna(cPage,numPerPage){";
	      pageBar+="fn_status(cPage);";
	      pageBar+="}";
	      pageBar+="</script>";
	      
	      return pageBar;
	   }
	
	public static String getPageReview(int cPage, int numPerPage, int totalContents)
	   {
		 String pageBar="";
	      int pageBarSize=5;
	      
	      int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      pageBar+="<div class='pagination'>";
	    
	      
	      if(pageNo==1)
	      {
	    	  pageBar+="<li><a  href='javascript:fn_paging_ad_qna("+pageNo+")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
	      }
	      else
	      {
	    	  pageBar+= "<li><a  href='javascript:fn_paging_ad_qna("+(pageNo-1)+")'aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
	      }
	      
	      while(!(pageNo>pageEnd || pageNo>totalPage))
	      {
	         if(cPage==pageNo)
	         {
	        	 pageBar+="<li><a  href='javascript:fn_paging_ad_qna("+cPage+")'>"+pageNo+"</a></li>";
	         }
	         else
	         {
	        	 pageBar+= "<li><a  href='javascript:fn_paging_ad_qna("+pageNo+")' aria-label='Previous'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
	         }
	         pageNo++;
	      }
	      if(pageNo>totalPage)
	      {
	    	  pageBar+="<li><a  href='javascript:fn_paging_ad_qna("+totalPage+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
	      }
	      else
	      {
	    	  pageBar+="<li><a class='active-item' href='javascript:fn_paging_ad_qna("+pageNo+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
	      }
	
	      pageBar+="</div>";
	      
	      pageBar+="<script>";
	      pageBar+="function fn_paging_ad_qna(cPage,numPerPage){";
	      pageBar+="fn_reviewList(cPage);";
	      pageBar+="}";
	      pageBar+="</script>";
	      
	      return pageBar;
	   }
	
}
