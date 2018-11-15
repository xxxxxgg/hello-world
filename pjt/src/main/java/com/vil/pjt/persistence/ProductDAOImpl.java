package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.vil.pjt.mapper.ProductMapper";
	
	@Override
	public ProductVO read(Integer product_id) throws Exception {
		return session.selectOne(namespace + ".read", product_id);
	}

	@Override
	public List<ProductVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

}
