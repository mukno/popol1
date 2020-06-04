package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {
	private int comment_num;
	private int comment_board;       
    private String comment_id;       
    private Date comment_date;       
    private int comment_parent;      
    private String comment_content;  
    private int comment_level; 


}
