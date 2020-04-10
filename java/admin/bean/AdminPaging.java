package admin.bean;

import lombok.Data;

@Data
public class AdminPaging {

	private int currentPage; 
	private int pageBlock; 
	private int pageSize; 
	private int totalA; 
	private StringBuffer pagingHTML;
	
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		//전체넘버링값
		int totalP = (totalA + pageSize - 1) / pageSize;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalP) {
				endPage = totalP;
		}
		
		if (startPage > pageBlock) {
			pagingHTML.append("[<span id='paging' onclick='boardSearch(" + (startPage - 1) + ")'>이전</span>]");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage) {
				pagingHTML.append("<span id='currentPaging'><a class='pagination-link is-current' style='background-color:#2ecc71; border-color:#fff' href='/LineUp/admin/memberManage?page="+i+"'>"+i+"</a></span>");
			} else {
				pagingHTML.append("<span id='paging'><a class='pagination-link' href='/LineUp/admin/memberManage?page="+i+"'>"+i+"</a></span>");
			}
		}
		if (endPage < totalP) {
			pagingHTML.append("<span id='paging' <a class='pagination-next' href='/LineUp/admin/memberManage?page="+startPage+"'>다음</a></span>");
		}
		
	}
	
}
