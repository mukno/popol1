package com.spring.domain;

import lombok.Data;

@Data
public class paging {

	int countList;//�� page�� �Խù� ��
	int countPage;//�ѹ��� ���̴� ������ ��
	int totalCount;//�� �Խù���
	int totalPage;//�� ������
	int startPage;//countPage�� ����������
	int endPage;//countPage�� ��������
	int pageNum;//���� ������
	
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
