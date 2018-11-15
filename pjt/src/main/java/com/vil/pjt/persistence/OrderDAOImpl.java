package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.OrderListVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mapper.OrderMapper";

	@Override
	public List<OrderListVO> orderList(String member_id) throws Exception {
		return session.selectList(namespace + ".orerList", member_id);
	}

}
