package com.vil.pjt.domain;

public class ProductVO {
	
	private Integer product_id;
	
	private String product_name;
	
	private String category;
	
	private Integer priceforweek;
	
	private Integer priceformonth;
	
	private Integer pricefornew;
	
	private String mainimg;
	
	private String detailimg;
	
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getPriceforweek() {
		return priceforweek;
	}

	public void setPriceforweek(Integer priceforweek) {
		this.priceforweek = priceforweek;
	}

	public Integer getPriceformonth() {
		return priceformonth;
	}

	public void setPriceformonth(Integer priceformonth) {
		this.priceformonth = priceformonth;
	}

	public Integer getPricefornew() {
		return pricefornew;
	}

	public void setPricefornew(Integer pricefornew) {
		this.pricefornew = pricefornew;
	}

	public String getMainimg() {
		return mainimg;
	}

	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}

	public String getDetailimg() {
		return detailimg;
	}

	public void setDetailimg(String detailimg) {
		this.detailimg = detailimg;
	}

	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", category=" + category
				+ ", priceforweek=" + priceforweek + ", priceformonth=" + priceformonth + ", pricefornew=" + pricefornew
				+ ", mainimg=" + mainimg + ", detailimg=" + detailimg + "]";
	}

	
}
