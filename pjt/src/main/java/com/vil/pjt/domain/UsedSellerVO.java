package com.vil.pjt.domain;

public class UsedSellerVO {
	
	private Integer seller_id;
	
	private String seller_name;
	
	private String seller_num;
	
	private String seller_phone;
	
	private String seller_address;
	
	private String seller_msg;

	public Integer getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(Integer seller_id) {
		this.seller_id = seller_id;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_num() {
		return seller_num;
	}

	public void setSeller_num(String seller_num) {
		this.seller_num = seller_num;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public String getSeller_address() {
		return seller_address;
	}

	public void setSeller_address(String seller_address) {
		this.seller_address = seller_address;
	}

	public String getSeller_msg() {
		return seller_msg;
	}

	public void setSeller_msg(String seller_msg) {
		this.seller_msg = seller_msg;
	}

	@Override
	public String toString() {
		return "UsedSellerVO [seller_id=" + seller_id + ", seller_name=" + seller_name + ", seller_num=" + seller_num
				+ ", seller_phone=" + seller_phone + ", seller_address=" + seller_address + ", seller_msg=" + seller_msg
				+ "]";
	}
	
	
	

}
