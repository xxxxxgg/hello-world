package com.vil.pjt.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.ProRequestVO;
import com.vil.pjt.domain.ProductVO;
import com.vil.pjt.domain.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.vil.pjt.mapper.ProductMapper";
	
	@Override
	public void requestCreate(ProRequestVO vo) throws Exception {
		session.insert(namespace + ".requestCreate", vo);
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public ProductVO read(Integer product_id) throws Exception {
		return session.selectOne(namespace + ".read", product_id);
	}

	@Override
	public List<ProductVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<ProductVO> cat(String category) throws Exception {
		return session.selectList(namespace+".SelCat", category);
	}

	@Override
	public List<ProductVO> listCat() throws Exception {
		return session.selectList(namespace+".catList");
	}

	@Override
	public int countCat(String category) throws Exception {
		return session.selectOne(namespace+".countCat", category);
	}

	@Override
	public List<ProductVO> listPage(int page) throws Exception {
		if (page <= 0){
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<ProductVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countAll() throws Exception {
		return session.selectOne(namespace+".countAll");
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<ProductVO> catList(Criteria cri) throws Exception {
		return session.selectList(namespace + ".SelCatList", cri);
	}

	@Override
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public int SearchCount(String keyword) throws Exception {
		return session.selectOne(namespace + ".SearchCtn", keyword);
	}

	@Override
	public List<ProductVO> SearchList(String keyword) throws Exception {
		return session.selectList(namespace + ".SearchList", keyword);
	}

}
