package com.vil.pjt.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.ProductVO;
import com.vil.pjt.domain.SearchCriteria;

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
	public int SearchCount(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".SearchCtn", cri);
	}

	@Override
	public List<ProductVO> SearchList(Criteria cri) throws Exception {
		return session.selectList(namespace + ".SearchList", cri);
	}

//	@Override
//	public List<ProductVO> catList(String category, Criteria cri) throws Exception {
//		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("category", category);
//		paramMap.put("cri", cri);
//		
//		list.add(paramMap);
//		
//		
//		return session.selectList(namespace + ".SelCatList", list);
//	}

	
}
