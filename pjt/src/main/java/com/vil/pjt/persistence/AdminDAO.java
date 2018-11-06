package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;

public interface AdminDAO {
	public AdminVO adminLogin(AdminLoginDTO dto) throws Exception;
	public List<OrderVO> adminOrderList() throws Exception;
}
