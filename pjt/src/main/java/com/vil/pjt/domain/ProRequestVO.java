package com.vil.pjt.domain;

public class ProRequestVO {
	
	public Integer request_id;

	public String request_type;
	
	public String request_model;
	
	public String request_phone;
	
	public String request_msg;

	public Integer getRequest_id() {
		return request_id;
	}

	public void setRequest_id(Integer request_id) {
		this.request_id = request_id;
	}

	public String getRequest_type() {
		return request_type;
	}

	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}

	public String getRequest_model() {
		return request_model;
	}

	public void setRequest_model(String request_model) {
		this.request_model = request_model;
	}

	public String getRequest_phone() {
		return request_phone;
	}

	public void setRequest_phone(String request_phone) {
		this.request_phone = request_phone;
	}

	public String getRequest_msg() {
		return request_msg;
	}

	public void setRequest_msg(String request_msgb) {
		this.request_msg = request_msgb;
	}

	@Override
	public String toString() {
		return "ProRequestVO [request_id=" + request_id + ", request_type=" + request_type + ", request_model="
				+ request_model + ", request_phone=" + request_phone + ", request_msg=" + request_msg + "]";
	}
	
	
	
	
}
