package com.jh.trip.common;

import java.util.Map;

public class PlanPageBar {

	public static String getPageBar(int cPage, int numPerpage, int totalData, String url, Map plan) {
		String pageBar="";
		Boolean a = true;
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=10;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize-1;

		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}
		
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(pageNo){";
		if(plan.size()==4) {
			pageBar+="location.href='"+url+"?mainTema="+plan.get("mainTema")+"&subTema="+plan.get("subTema")+"&area="+plan.get("area")+"&sigungu="+plan.get("sigungu")+"&cPage='+pageNo";		
		}else if(plan.size()==2 && plan.containsKey("mainTema")){
			pageBar+="location.href='"+url+"?mainTema="+plan.get("mainTema")+"&subTema1="+plan.get("subTema")+"&cPage='+pageNo";
		}else if(plan.size()==2 && plan.containsKey("area")) {
			pageBar+="location.href='"+url+"?area="+plan.get("area")+"&sigungu1="+plan.get("sigungu")+"&cPage='+pageNo";
		}else if(plan.size()==1) {
			pageBar+="location.href='"+url+"?keyword="+plan.get("keyword")+"&cPage='+pageNo";
		}
		pageBar+="}";
		pageBar+="</script>";
		
		
		return pageBar;
	}

}
