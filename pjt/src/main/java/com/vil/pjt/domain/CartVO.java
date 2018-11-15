package com.vil.pjt.domain;

public class CartVO {

	private Integer product_id;
	
	private String product_name;
	
	private Integer quantity;
	
	private String rental_type;
	
	private Integer price;

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
		return "CartVO [product_id=" + product_id + ", product_name=" + product_name + ", quantity=" + quantity
				+ ", rental_type=" + rental_type + ", price=" + price + "]";
	}
	
}
