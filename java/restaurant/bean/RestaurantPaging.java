package restaurant.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class RestaurantPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	private String searchOption;
	private String searchText;
	private String vegan;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총 페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) 
			endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<a id='paging' class='pagination-previous' href='/LineUp/restaurant/restaurantList?pg="+(startPage-1)+"&searchOption="+searchOption+"&searchText="+searchText+"&vegan="+vegan+"'>Previous</a>");
			pagingHTML.append("<ul class='pagination-list'>");
			pagingHTML.append("<li><a id='paging' class='pagination-link' aria-label='Goto page 1' href='/LineUp/restaurant/restaurantList?pg=1'>1</a></li>");
			pagingHTML.append("<li><span id='paging' class='pagination-ellipsis'>&hellip;</span></li>");
		
		}else {
			pagingHTML.append("<ul class='pagination-list'>");
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage)
				pagingHTML.append("<li><a id='currentPaging' class='pagination-link is-current' aria-label='Goto page \"+i+\"' href='/LineUp/restaurant/restaurantList?pg="+i+"&searchOption="+searchOption+"&searchText="+searchText+"&vegan="+vegan+" ' >"+i+"</a></li>");
			else 
				pagingHTML.append("<li><a id='paging' href='/LineUp/restaurant/restaurantList?pg="+i+"&searchOption="+searchOption+"&searchText="+searchText+"&vegan="+vegan+" '>"+i+"</a></li>");
		}
		
		if(endPage < totalP) {
			pagingHTML.append("<li><span class='pagination-ellipsis'>&hellip;</span></li>");
		//	pagingHTML.append("[<li><a id='paging' href='/LineUp/restaurant/restaurantList?pg="+(endPage+1)+"&searchOption="+searchOption+"&searchText="+searchText+"&vegan="+vegan+"'>Next</a>]");
			pagingHTML.append("<li><a class='pagination-link' aria-label='Goto page "+totalP+"' href='/LineUp/restaurant/restaurantList?pg="+totalP+"'>"+totalP+"</a></li>");
			pagingHTML.append("</ul>");
			pagingHTML.append("<a class='pagination-next' href='/LineUp/restaurant/restaurantList?pg="+(endPage+1)+"&searchOption="+searchOption+"&searchText="+searchText+"&vegan="+vegan+"'>Next page</a>");
		}else {
			pagingHTML.append("</ul>");
			pagingHTML.append("<span class='pagination-next' style='width:101px; height:50px; border:none;'></span>");
		}
	}
	//Map 으로 받은것 
	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총 페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) 
			endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<span id='paging' class='pagination-previous' onclick='restaurantSearchList("+(startPage-1)+searchOption+searchText+vegan+")'>이전</span>");
			pagingHTML.append("<ul class='pagination-list'>");
			pagingHTML.append("<li><a id='paging' class='pagination-link' aria-label='Goto page 1' href='/LineUp/restaurant/restaurantList?pg=1'>1</a></li>");
			pagingHTML.append("<li><span id='paging' class='pagination-ellipsis'>&hellip;</span></li>");
		
		}else {
			pagingHTML.append("<ul class='pagination-list'>");
		}

		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage)
				pagingHTML.append("<li><span id='currentPaging' class='pagination-link is-current' aria-label='Goto page "+i+"' onclick='restaurantSearchList("+i+searchOption+searchText+vegan+")'>"+i+"</span></li>");
			else 
				pagingHTML.append("<li><span id='paging' class='pagination-link' aria-label='Goto page "+i+"' onclick='restaurantSearchList("+i+searchOption+searchText+vegan+")'>"+i+"</span></li>");
		}
		
		if(endPage < totalP) {
			pagingHTML.append("<li><span class='pagination-ellipsis'>&hellip;</span></li>");
			pagingHTML.append("<li><a class='pagination-link' aria-label='Goto page "+totalP+"' href='/LineUp/restaurant/restaurantList?pg="+totalP+"&searchOption="+searchOption+"&searchText="+searchText+"&vegan="+vegan+"'>"+totalP+"</a></li>");
			pagingHTML.append("</ul>");
			pagingHTML.append("<li><span  id='paging' class='pagination-next' onclick='restaurantSearchList("+(endPage+1)+searchOption+searchText+vegan+")'>Next</span>");
			
		}else {
			pagingHTML.append("</ul>");
			pagingHTML.append("<span class='pagination-next' style='width:101px; height:50px; border:none;'></span>");
		}
	}
}
























