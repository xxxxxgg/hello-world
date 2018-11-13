package com.vil.pjt.persistence;

import java.util.List;
import java.util.Map;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vli.pjt.framework.paging.SearchCriteria;

public interface AdminDAO {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
	
	public OrderVO adminOrderSelect(Integer no) throws Exception;
	public List<OrderVO> adminOrderList(SearchCriteria scr) throws Exception;
	public int adminOrderCount(SearchCriteria scr) throws Exception;
	
	public OrderedItemVO adminOrderedItemSelect(Integer itemNo) throws Exception;
	public List<OrderedItemVO> adminOrderedItemList(Integer orderNo) throws Exception;
	
	public AdminVO adminMemberSelect(Integer no) throws Exception;
	
	public void createOrderByBatch(Map<String, Object> paramMap) throws Exception;
	public void createOrderedItemByBatch(Map<String, Object> paramMap) throws Exception;
}
