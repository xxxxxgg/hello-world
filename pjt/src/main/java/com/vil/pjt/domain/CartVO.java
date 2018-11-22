package com.vil.pjt.domain;

public class CartVO {

	private Integer cart_id;

	private String member_id;
	
	private Integer product_id;
	
	private String product_name;
	
	private String mainimg;
	
	private Integer quantity;
	
	private String rental_type;
	
	private Integer price;
	

	public Integer getCart_id() {
		return cart_id;
	}

	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getMainimg() {
		return mainimg;
	}

	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getRental_type() {
		return rental_type;
	}

	public void setRental_type(String rental_type) {
		this.rental_type = rental_type;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", member_id=" + member_id + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", mainimg=" + mainimg + ", quantity=" + quantity
				+ ", rental_type=" + rental_type + ", price=" + price + "]";
	}

	
}
