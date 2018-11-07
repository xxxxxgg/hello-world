package com.vil.pjt.domain;

public class OrderedItemVO {
    private Integer no;
    private Integer orderNo; 
    private Integer itemNo;
    private Integer count;
    private Integer totalprice;

    public Integer getNo() {
        return no;
    }
    public void setNo(Integer no) {
        this.no = no;
    }
    public Integer getOrderNo() {
        return orderNo;
    }
    public void setTbOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }
    public Integer getItemNo() {
        return itemNo;
    }
    public void setItemNo(Integer itemNo) {
        this.itemNo = itemNo;
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
		return "OrderedItemVO [no=" + no + ", tbOrderNo=" + orderNo + ", itemNo=" + itemNo + ", count=" + count
				+ ", totalprice=" + totalprice + "]";
	}
}
