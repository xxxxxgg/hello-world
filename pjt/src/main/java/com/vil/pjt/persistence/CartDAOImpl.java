package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mapper.CartMapper";
	
	@Override
	public void create(CartVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(CartVO vo) throws Exception {
		session.update(namespace + ".update", vo); 
	}

	@Override
	public void delete(Integer cart_id) throws Exception {	//카트번호로 지우기
		session.delete(namespace + ".delete", cart_id); 
	}

	@Override
	public List<CartVO> listAll(String member_id) throws Exception {
		return session.selectList(namespace + ".listAll", member_id);
	}



}
