package com.vil.pjt.domain;

public class Dropdown {
	private String selected;
	private String option;
	public String getSelected() {
		return selected;
	}
	public void setSelected(String selected) {
		this.selected = selected;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	@Override
	public String toString() {
		return "Dropdown [selected=" + selected + ", option=" + option + "]";
	}
	
	
}
