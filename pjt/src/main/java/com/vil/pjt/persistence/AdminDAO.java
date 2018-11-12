package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vli.pjt.framework.paging.SearchCriteria;

public interface AdminDAO {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
	public OrderVO adminOrderSelect(Integer no) throws Exception;
	public List<OrderVO> adminOrderList(SearchCriteria scr) throws Exception;
	public AdminVO adminMemberSelect(Integer no) throws Exception;
	public int adminOrderCount(SearchCriteria scr) throws Exception;
}
