package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class BoardVO {

	private int bno;
	private String title;
	private String writer;
	private Date updatedate;
	private int hits;
	
	private int replyCnt;
	private String board_content;
}
