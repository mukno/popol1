package com.spring.domain;

import lombok.Data;

@Data
public class OrderRecodeVO {
	private String userId;
	private int order_count;
	private String order_time;
	private String deliver_time;
	private String deliver_address;
	
	

}
