package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {
	private int comment_num;
	private int comment_board;       
    private String comment_id;       
    private Date comment_date;       
    private String comment_content;  


}
