package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.FaqVO;
import com.vli.pjt.framework.paging.SearchCriteria;

@Repository
public class CSCenterDAOimpl implements CSCenterDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mappers.csMapper";
	
	@Override
	public List<FaqVO> FaqList(SearchCriteria pcr) throws Exception {
		return session.selectList(namespace + ".FaqList", pcr);
	}

	@Override
	public int FaqCount(SearchCriteria pcr) throws Exception {
		return session.selectOne(namespace + ".FaqCount", pcr);
	}

}
