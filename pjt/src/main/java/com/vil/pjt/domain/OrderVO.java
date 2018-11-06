package com.vil.pjt.domain;

public class OrderVO {
	private Integer no;
	private String state;
	private Integer cno;
	private String orderdate;
	private String comment;
	private Integer orderedItemNo;
	private Integer totalprice;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getOrderedItemNo() {
		return orderedItemNo;
	}
	public void setOrderedItemNo(Integer orderedItemNo) {
		this.orderedItemNo = orderedItemNo;
	}
	public Integer getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}
	
	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", state=" + state + ", cno=" + cno + ", orderdate=" + orderdate + ", comment="
				+ comment + ", orderedItemNo=" + orderedItemNo + ", totalprice=" + totalprice + "]";
	}
}
