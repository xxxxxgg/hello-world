package com.vil.pjt.service;

import java.util.List;
import java.util.Map;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.FaqVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vli.pjt.framework.paging.SearchCriteria;

public interface AdminService {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
	
	/*
	 * admin order
	 */
	public List<OrderVO> adminOrderList(SearchCriteria scr) throws Exception;
	public Map<String, Object> adminOrderDetail(Integer no) throws Exception;
	public int adminOrderCount(SearchCriteria scr) throws Exception;
	
	/*
	 * admin faq
	 */
	public FaqVO adminFaqDetail(Integer fno) throws Exception;
	public List<FaqVO> adminFaqList(SearchCriteria scr) throws Exception;
	public int adminFaqCount(SearchCriteria scr) throws Exception;

	public void addFaq(FaqVO vo) throws Exception;
	public void modifyFaq(FaqVO vo) throws Exception;
	public void removeFaq(Integer fno) throws Exception;

}
