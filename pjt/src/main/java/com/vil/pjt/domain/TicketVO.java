package com.vil.pjt.domain;

public class TicketVO {
	
	private Integer ticket_id;
	
	private String member_id;
	
	private String rental_type;
	
	private Integer count;

	public Integer getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(Integer ticket_id) {
		this.ticket_id = ticket_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getRental_type() {
		return rental_type;
	}

	public void setRental_type(String rental_type) {
		this.rental_type = rental_type;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "TicketVO [ticket_id=" + ticket_id + ", member_id=" + member_id + ", rental_type=" + rental_type
				+ ", count=" + count + "]";
	}
	
	
	
}
