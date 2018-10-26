package com.vil.pjt.persistence;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.dto.AdminLoginDTO;

public interface AdminDAO {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
}
