package com.vil.pjt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public Map<String, Object> adminOrderDetail(Integer no) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		OrderVO vo = dao.adminOrderSelect(no);
		
		param.put("orderinfo", vo);
		//param.put("itemlist", dao.adminItemList());
		param.put("memberinfo", dao.adminMemberSelect(vo.getMno()));
		
		return param;
	}

}
