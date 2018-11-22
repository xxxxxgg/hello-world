package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.OrderListVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;

public interface OrderDAO {
	
	public void creatOrder(OrderVO vo) throws Exception;
	public void creatOrderedItem(OrderedItemVO vo) throws Exception;

	public Integer getOrder() throws Exception;
	
	public void updateOrder(OrderVO vo) throws Exception;
	
	
	public OrderListVO read(Integer order_id) throws Exception;
	
	public List<OrderListVO> orderList(String member_id) throws Exception;
	
	
	
	
}
