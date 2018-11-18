package com.vil.pjt.domain;

import java.util.Date;

public class FaqVO {
	private Integer no;
	private String title;
	private String content;
	private Date regdate;

	public Integer getBno() {
		return no;
	}
	public void setBno(Integer no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + "]";
	}

}
