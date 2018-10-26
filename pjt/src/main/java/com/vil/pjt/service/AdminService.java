package com.vil.pjt.service;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.dto.AdminLoginDTO;

public interface AdminService {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
}
