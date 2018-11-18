package com.vil.pjt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.FaqVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vil.pjt.persistence.AdminDAO;
import com.vli.pjt.framework.paging.SearchCriteria;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO dao;
	
	@Override
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception {
		return dao.adminLogin(dto);
	}

	/*
	 * admin order ******************************************************************************************
	 */
	@Override
	public List<OrderVO> adminOrderList(SearchCriteria scr) throws Exception {
		return dao.adminOrderList(scr);
	}
	@Transactional
	@Override
	public Map<String, Object> adminOrderDetail(Integer orderNo) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		OrderVO vo = dao.adminOrderSelect(orderNo);
		List<OrderedItemVO> vo2 = dao.adminOrderedItemList(orderNo);
		param.put("orderinfo", vo);
		param.put("ordereditemList", vo2);
		param.put("memberinfo", dao.adminMemberSelect(vo.getMno()));
		
		return param;
	}
	@Override
	public int adminOrderCount(SearchCriteria scr) throws Exception {
		return dao.adminOrderCount(scr);
	}

	/*
	 * admin faq **********************************************************************************************************
	 */
	@Override
	public List<FaqVO> adminFaqList(SearchCriteria scr) throws Exception {
		return dao.adminFaqList(scr);
	}

	@Override
	public int adminFaqCount(SearchCriteria scr) throws Exception {
		return dao.adminFaqCount(scr);
	}



}
