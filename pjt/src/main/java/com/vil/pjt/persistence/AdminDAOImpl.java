package com.vil.pjt.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.FaqVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vli.pjt.framework.paging.SearchCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mappers.AdminMapper";
	
	/*
	 * admin Login ***********************************************************************************************************
	 */
	@Override
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".adminLogin", dto);
	}
	/**/
	
	/*
	 * admin Order ************************************************************************************************************
	 */
	@Override
	public OrderVO adminOrderSelect(Integer no) throws Exception {
		return session.selectOne(namespace + ".adminOrderSelect", no);
	}
	@Override
	public List<OrderVO> adminOrderList(SearchCriteria scr) throws Exception {
		return session.selectList(namespace + ".adminOrderList", scr);
	}
	@Override
	public int adminOrderCount(SearchCriteria scr) throws Exception {
		return session.selectOne(namespace + ".adminOrderCount", scr);
	}
	/**/
	
	/*
	 * Admin Item *************************************************************************************************************
	 */
	@Override
	public OrderedItemVO adminOrderedItemSelect(Integer itemNo) throws Exception {
		return session.selectOne(namespace + ".adminOrderedItemSelect", itemNo);
	}
	@Override
	public List<OrderedItemVO> adminOrderedItemList(Integer orderNo) throws Exception {
		return session.selectList(namespace + ".adminOrderedItemList", orderNo);
	}
	/**/
	
	/*
	 * admin Member ***********************************************************************************************************
	 */
	@Override
	public AdminVO adminMemberSelect(Integer no) throws Exception {
		return session.selectOne(namespace + ".adminMemberSelect", no);
	}
	/**/

	/*
	 * batch test
	 */
	@Override
	public void createOrderByBatch(Map<String, Object> map) {
		session.insert(namespace + ".createBoardByBatch", map);
	}

	@Override
	public void createOrderedItemByBatch(Map<String, Object> paramMap) throws Exception {
		session.insert(namespace + ".createBoardByBatch2", paramMap);
	}
	/**/

	/*
	 * admin faq ************************************************************************************************************
	 */
	@Override
	public List<FaqVO> adminFaqList(SearchCriteria scr) throws Exception {
		return session.selectList(namespace + ".adminFaqList", scr);
	}

	@Override
	public int adminFaqCount(SearchCriteria scr) throws Exception {
		return session.selectOne(namespace + ".adminFaqCount", scr);
	}

}