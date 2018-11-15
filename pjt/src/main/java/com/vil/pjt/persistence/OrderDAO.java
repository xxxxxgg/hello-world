package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.OrderListVO;

public interface OrderDAO {
	
	public List<OrderListVO> orderList(String member_id) throws Exception;
	
}
