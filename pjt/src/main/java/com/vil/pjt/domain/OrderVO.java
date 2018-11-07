package com.vil.pjt.domain;

import java.util.Date;

public class OrderVO {
	private Integer no;
	private String state;
	private Integer mno;
	private Date orderdate;
	private String comment;
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
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}

	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", state=" + state + ", mno=" + mno + ", orderdate=" + orderdate + ", comment="
				+ comment + ", totalprice=" + totalprice + "]";
	}
}
