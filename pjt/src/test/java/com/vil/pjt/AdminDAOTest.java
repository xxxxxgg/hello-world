package com.vil.pjt;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.persistence.AdminDAO;
import com.vil.pjt.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class AdminDAOTest {
	@Inject
	private AdminDAO dao;
	
	@Inject
	private AdminService service;
	
	@Test
	public void AdminOrder() throws Exception {
		OrderVO vo = dao.adminOrderSelect(1);
		dao.adminMemberSelect(vo.getMno());
	}
}
