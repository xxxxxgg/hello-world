package com.vil.pjt.service;

import java.util.List;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;

public interface AdminService {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
	public List<OrderVO> adminOrderList() throws Exception;
}
