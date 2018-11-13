package com.vil.pjt.domain;

public class OrderedItemVO {
    private Integer no;
    private Integer order_no; 
    private Integer item_no;
    private Integer count;
    private Integer totalprice;

    public Integer getNo() {
        return no;
    }
    public void setNo(Integer no) {
        this.no = no;
    }
    public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}
	public Integer getItem_no() {
		return item_no;
	}
	public void setItem_no(Integer item_no) {
		this.item_no = item_no;
	}
	public Integer getCount() {
        return count;
    }
    public void setCount(Integer count) {
        this.count = count;
    }
    public Integer getTotalprice() {
        return totalprice;
    }
    public void setTotalprice(Integer totalprice) {
        this.totalprice = totalprice;
    }
    
	@Override
	public String toString() {
		return "OrderedItemVO [no=" + no + ", orderNo=" + order_no + ", itemNo=" + item_no + ", count=" + count
				+ ", totalprice=" + totalprice + "]";
	}
}
