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
	private String userId;
	private String updatedate;
	private int hits;
	private int board_group;
	
	private int replyCnt;
	private String board_content;
}
