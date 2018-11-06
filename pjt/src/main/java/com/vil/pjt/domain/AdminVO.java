package com.vil.pjt.domain;

import java.util.Date;

public class AdminVO {
	private Integer no;
	private String id;
	private String pw;
	private String name;
	private Date regdate;
	private Date updatedate;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "AdminVO [no=" + no + ", id=" + id + ", pw=" + pw + ", name=" + name + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
}
