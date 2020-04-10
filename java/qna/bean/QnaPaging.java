package qna.bean;

import java.util.Map;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class QnaPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총 페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) 
			endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<a id='paging' class='pagination-previous' href='/LineUp/home/qna?pg="+(startPage-1)+"'>Previous</a>");
			pagingHTML.append("<ul class='pagination-list'>");
			pagingHTML.append("<li><a id='paging' class='pagination-link' aria-label='Goto page 1' href='/LineUp/home/qna?pg=1'>1</a></li>");
			pagingHTML.append("<li><span id='paging' class='pagination-ellipsis'>&hellip;</span></li>");
		}else {
			pagingHTML.append("<ul class='pagination-list'>");
		}
		
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage)
				pagingHTML.append("<li><a id='currentPaging' class='pagination-link is-current' aria-label='Goto page "+i+"' href='/LineUp/home/qna?pg="+i+"' >"+i+"</a></li>");
			else 
				pagingHTML.append("<li><a id='paging'class='pagination-link' aria-label='Goto page "+i+"' href='/LineUp/home/qna?pg="+i+"'>"+i+"</a></li>");
		}
		
		if(endPage < totalP) {
			pagingHTML.append("<li><span class='pagination-ellipsis'>&hellip;</span></li>");
			pagingHTML.append("<li><a class='pagination-link' aria-label='Goto page "+totalP+"' href='/LineUp/home/qna?pg="+totalP+"'>"+totalP+"</a></li>");
			pagingHTML.append("</ul>");
			pagingHTML.append("<a class='pagination-next' href='/LineUp/home/qna?pg="+(endPage+1)+"'>Next page</a>");
		}else {
			pagingHTML.append("</ul>");
			pagingHTML.append("<span class='pagination-next' style='width:101px; height:50px; border:none;'></span>");
		}
	}
	
	
	
	//Map 으로 받은것 
	public void makeSearchPagingHTML(Map<String,Object> map) {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총 페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) 
			endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<a id='paging' class='pagination-previous' href='/LineUp/home/qna?pg="+(startPage-1)+"&step=2&category="+map.get("category")+"&search="+map.get("search")+"'>Previous</a>");
			pagingHTML.append("<ul class='pagination-list'>");
			pagingHTML.append("<li><a id='paging' class='pagination-link' aria-label='Goto page 1' href='/LineUp/home/qna?pg=1&step=2&category="+map.get("category")+"&search="+map.get("search")+"'>1</a></li>");
			pagingHTML.append("<li><span id='paging' class='pagination-ellipsis'>&hellip;</span></li>");
		}else {
			pagingHTML.append("<ul class='pagination-list'>");
		}
		
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage)
				pagingHTML.append("<li><a id='currentPaging' class='pagination-link is-current' aria-label='Goto page "+i+"' href='/LineUp/home/qna?pg="+i+"&step=2&category="+map.get("category")+"&search="+map.get("search")+" ' >"+i+"</a></li>");
			else 
				pagingHTML.append("<li><a id='paging'class='pagination-link' aria-label='Goto page "+i+"' href='/LineUp/home/qna?pg="+i+"&step=2&category="+map.get("category")+"&search="+map.get("search")+"'>"+i+"</a></li>");
		}
		
		if(endPage < totalP) {
			pagingHTML.append("<li><span class='pagination-ellipsis'>&hellip;</span></li>");
			pagingHTML.append("<li><a class='pagination-link' aria-label='Goto page "+totalP+"' href='/LineUp/home/qna?pg="+totalP+"&step=2&category="+map.get("category")+"&search="+map.get("search")+"'>"+totalP+"</a></li>");
			pagingHTML.append("</ul>");
			pagingHTML.append("<a class='pagination-next' href='/LineUp/home/qna?pg="+(endPage+1)+"&step=2&category="+map.get("category")+"&search="+map.get("search")+"'>Next page</a>");
		}else {
			pagingHTML.append("</ul>");
			pagingHTML.append("<span class='pagination-next' style='width:101px; height:50px; border:none;'></span>");
		}
	
	}
}
