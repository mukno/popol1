package com.spring.domain;

import lombok.Data;

@Data
public class paging {

	int countList;//한 page에 게시물 수
	int countPage;//한번에 보이는 페이지 수
	int totalCount;//총 게시물수
	int totalPage;//총 페이지
	int startPage;//countPage의 시작페이지
	int endPage;//countPage의 끝페이지
	int pageNum;//현재 페이지
	
	public paging(int countList,int countPage,int totalCount,int pageNum) {
	
		totalPage=totalCount/countList;
		if(totalCount%countList >0) {
			totalPage=totalPage+1;
		}
		
		startPage=((pageNum-1)/countPage)*countPage+1;
		endPage=startPage+countPage-1;
		
		if(endPage>totalPage) {
			endPage=totalPage;
		}
		
	}

	
	

}
