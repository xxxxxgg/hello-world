package com.vil.pjt.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vil.pjt.domain.AdminVO;
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

}
