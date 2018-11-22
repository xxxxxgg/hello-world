package com.vil.pjt.dto;

public class AdminLoginDTO {
	private String id;
	private String pw;
	private boolean cookie;
	
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
	public boolean isCookie() {
		return cookie;
	}
	public void setCookie(boolean cookie) {
		this.cookie = cookie;
	}
	
	@Override
	public String toString() {
		return "AdminLoginDTO [id=" + id + ", pw=" + pw + ", cookie=" + cookie + "]";
	}
}
