package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mappers.AdminMapper";
	
	@Override
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".adminLogin", dto);
	}

	@Override
	public List<OrderVO> adminOrderList() throws Exception {
		return session.selectList(namespace + ".adminOrderList");
	}
}