package com.vil.pjt.domain;

import java.util.Date;

public class OrderListVO {
	
	private String member_id;
	
	private int order_id;
	
	private int ordered_item_id;
	
	private String product_name;
	
	private int quantity;
	
	private int price;
	
	private String rental_type;
	
	private Date startdate;
	
	private Date enddate;
	
	private int total_price;
	
	private String state;
	
	private Date orderdate;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getOrdered_item_id() {
		return ordered_item_id;
	}

	public void setOrdered_item_id(int ordered_item_id) {
		this.ordered_item_id = ordered_item_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRental_type() {
		return rental_type;
	}

	public void setRental_type(String rental_type) {
		this.rental_type = rental_type;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "OrderListVO [member_id=" + member_id + ", order_id=" + order_id + ", ordered_item_id=" + ordered_item_id
				+ ", product_name=" + product_name + ", quantity=" + quantity + ", price=" + price + ", rental_type="
				+ rental_type + ", startdate=" + startdate + ", enddate=" + enddate + ", total_price=" + total_price
				+ ", state=" + state + ", orderdate=" + orderdate + "]";
	}
	
}
