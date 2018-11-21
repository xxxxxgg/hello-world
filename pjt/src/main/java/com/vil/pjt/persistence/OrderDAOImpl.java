package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.OrderListVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mapper.OrderMapper";

	
	@Override
	public void creatOrder(OrderVO vo) throws Exception {
		session.insert(namespace + ".creatOrder", vo);
	}
	@Override
	public void creatOrderedItem(OrderedItemVO vo) throws Exception {
		session.insert(namespace + ".creatOrderedItem", vo);
	}

	@Override
	public Integer getOrder() throws Exception {
		return session.selectOne(namespace + ".getOrder");
	}
	
	@Override
	public OrderListVO read(Integer order_id) throws Exception {
		return session.selectOne(namespace + ".orerList", order_id);
	}
	
	@Override
	public List<OrderListVO> orderList(String member_id) throws Exception {
		return session.selectList(namespace + ".orerList", member_id);
	}
	@Override
	public void updateOrder(OrderVO vo) throws Exception {
		session.update(namespace + ".updateOrder", vo);
	}



}
