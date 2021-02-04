package com.spring.domain;

import ch.qos.logback.core.net.SyslogOutputStream;
import lombok.Data;

@Data
public class paging {

	private int countList;//한 page에 게시물 수
	private int countPage;//한번에 보이는 페이지 수
	private int totalCount;//총 게시물수
	private int totalPage;//총 페이지
	private int startPage;//countPage의 시작페이지
	private int endPage;//countPage의 끝페이지
	private int pageNum;//현재 페이지
	private boolean prev;//이전 버튼
	private boolean next;//다음 버튼
	
	
	public paging(int countList,int countPage,int totalCount,int pageNum) {
		this.pageNum=pageNum;
		
		totalPage=totalCount/countList;
		if(totalCount%countList >0) {
			totalPage=totalPage+1;
		}
		
		startPage=((pageNum-1)/countPage)*countPage+1;
		endPage=startPage+countPage-1;
		
		if(endPage>totalPage) {
			endPage=totalPage;
		}
		
		prev=startPage>1;//start페이지가 1이면 prev가 false
		next=endPage<totalPage;//endPage가 totalPage와 같으면 false
		
		
		
		
		
	}

	
	

}
