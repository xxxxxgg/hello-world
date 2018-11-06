package com.vil.pjt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vil.pjt.persistence.AdminDAO;

@Service
public class AdminServiceImple implements AdminService {
	@Inject
	private AdminDAO dao;
	
	@Override
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception {
		return dao.adminLogin(dto);
	}

	@Override
	public List<OrderVO> adminOrderList() throws Exception {
		return dao.adminOrderList();
	}

}
