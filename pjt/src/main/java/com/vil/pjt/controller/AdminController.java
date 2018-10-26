package com.vil.pjt.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vil.pjt.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public void adminLoginGET(@ModelAttribute("dto") AdminLoginDTO dto) {
		logger.info("adminLoginGET.......................zz");
	}
	@RequestMapping(value = "/adminLoginPost", method = RequestMethod.POST)
	public void adminLoginPOST(AdminLoginDTO dto, HttpSession session, Model model) throws Exception {
		logger.info("adminLoginPOST.......................zz");
		
		AdminVO vo = service.adminLogin(dto);
		
		if(vo == null) {
			return;
		}
		
		model.addAttribute("adminVO", vo);
	}
}
