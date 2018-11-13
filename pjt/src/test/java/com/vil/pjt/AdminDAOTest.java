package com.vil.pjt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;
import com.vil.pjt.persistence.AdminDAO;
import com.vil.pjt.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class AdminDAOTest {
	@Inject
	private AdminDAO dao;
	
	@Inject
	private AdminService service;
	
	//@Test
	public void AdminOrder() throws Exception {
		OrderVO vo = dao.adminOrderSelect(1);
		dao.adminMemberSelect(vo.getMno());
	}
	
	//@Test
	public void testCreateBoardByBatch() throws Exception {
		List<OrderVO> listBoard = new ArrayList<>();
		for (int h = 0; h < 10; h++) {
			for (int i = 0; i < 100; i++) {
				OrderVO vo = new OrderVO();
				vo.setState("state" + i);
				vo.setMno(1);
				vo.setComment("comment" + i);
				vo.setTotalprice(i * 1000);
				listBoard.add(vo);
			}
			
			Map<String, Object>paramMap = new HashMap<String, Object>();
			paramMap.put("list", listBoard);
			dao.createOrderByBatch(paramMap);
		}
	}
	
	int j = 1;
	@Test
	public void testCreateByBatch() throws Exception {
		List<OrderedItemVO> listBoard = new ArrayList<>();
		for (int h = 0; h < 10; h++) {
			for (int i = 0; i < 100; i++) {
				OrderedItemVO vo = new OrderedItemVO();
				vo.setOrder_no(j);
				vo.setItem_no(i);
				vo.setCount(2);
				vo.setTotalprice(i * 1000);
				listBoard.add(vo);
				j++;
			}
			
			Map<String, Object>paramMap = new HashMap<String, Object>();
			paramMap.put("list", listBoard);
			dao.createOrderedItemByBatch(paramMap);
		}
	}
}
