package com.spring.domain;

import ch.qos.logback.core.net.SyslogOutputStream;
import lombok.Data;

@Data
public class paging {

	private int countList;//�� page�� �Խù� ��
	private int countPage;//�ѹ��� ���̴� ������ ��
	private int totalCount;//�� �Խù���
	private int totalPage;//�� ������
	private int startPage;//countPage�� ����������
	private int endPage;//countPage�� ��������
	private int pageNum;//���� ������
	private boolean prev;//���� ��ư
	private boolean next;//���� ��ư
	
	
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
		
		prev=startPage>1;//start�������� 1�̸� prev�� false
		next=endPage<totalPage;//endPage�� totalPage�� ������ false
		
		
		
		
		
	}

	
	

}
