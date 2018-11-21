package com.vil.pjt.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	
	private String category;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 16;
	}
	
	public void setPage(int page){
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 16;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	// method for MyBatis SQL Mapper -
	public int getPageStart(){
		return (this.page - 1)*perPageNum;
	}
	
	//method for MyBatis SQL Mapper
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", category=" + category + "]";
	}

//	@Override
//	public String toString() {
//		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
//	}
	
	
	
	
	
	
}
