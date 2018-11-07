package com.vil.pjt.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vil.pjt.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminGET(@ModelAttribute("alogin") AdminVO vo) {
		logger.info("adminGET.......................zz");
		
		return "/admin/adminMain";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public void adminLoginGET() {
		logger.info("adminLoginGET.......................zz");
	}
	@RequestMapping(value = "/adminLoginPost", method = RequestMethod.POST)
	public void adminLoginPOST(AdminLoginDTO dto, Model model) throws Exception {
		logger.info("adminLoginPOST.......................zz");
		
		AdminVO vo = service.adminLogin(dto);
		
		if(vo == null) {
			return;
		}
		
		model.addAttribute("adminVO", vo);
	}
	
	@RequestMapping(value = "/adminOrder", method = RequestMethod.GET)
	public void adminOrderGET(Model model) throws Exception {
		logger.info("adminOrderGET.......................zz");
		
		List<OrderVO> vo = service.adminOrderList();
		
		model.addAttribute("orderList",vo);
	}
}
