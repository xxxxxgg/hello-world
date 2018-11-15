package com.vil.pjt.domain;

import java.util.Date;

public class MemberVO {

	private String id;
	private String password;
	private String name;
	private String gender;
	private Date birth;
	private String mail;
	private String phone;
	private String address;
	private Date regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		Date now = new Date();
		this.regdate = now;
	}
	
	@Override
	public String toString() {
		return "MemberVO id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birth="
				+ birth + ", mail=" + mail + ", phone=" + phone + ", address=" + address + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
