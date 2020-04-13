package com.spring.domain;

import lombok.Data;

@Data
public class ShopVO {
	
	private String userId;
	private int item_number;
	private int item_amount;
	private String item_name;
	private int item_price;
	private int item_turn;
	private int order_count;
	
	
	
}
