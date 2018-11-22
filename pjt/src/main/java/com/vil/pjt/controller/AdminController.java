package com.vil.pjt.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vil.pjt.domain.AdminVO;
import com.vil.pjt.domain.Criteria;
import com.vil.pjt.dto.AdminLoginDTO;
import com.vil.pjt.persistence.ProductDAO;
import com.vil.pjt.service.AdminService;
import com.vli.pjt.framework.paging.PageMaker;
import com.vli.pjt.framework.paging.SearchCriteria;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private AdminService service;
	
	@Inject
	private ProductDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminGET(@ModelAttribute("alogin") AdminVO vo) {
		logger.info("adminGET.......................zz");
		
		return "/admin/adminMain";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String adminLoginGET() {
		logger.info("adminLoginGET.......................zz");
		
		return "/admin/adminLogin";
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
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String adminOrderGET(@ModelAttribute("pcr") SearchCriteria pcr, Model model) throws Exception {
		logger.info("adminOrderGET.......................zz");
		
		//model.addAttribute("orderList", service.adminOrderList());
		model.addAttribute("orderList", service.adminOrderList(pcr));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPcr(pcr);
		pageMaker.setTotalCount(service.adminOrderCount(pcr));
		
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/order/adminOrder";
	}
	@RequestMapping(value = "/order/detail", method = RequestMethod.GET)
	public String adminOrderDetailGET(@RequestParam("ono") Integer orderNo, Model model) throws Exception { // tb_order.no
		logger.info("adminOrderGET.......................zz");
		
		Map<String, Object> param = service.adminOrderDetail(orderNo);
		
		//model.addAttribute("orderDetail", service.adminOrderRead());
		
		model.addAttribute("orderinfo", param.get("orderinfo"));
		model.addAttribute("ordereditemList", param.get("ordereditemList"));
		model.addAttribute("memberinfo", param.get("memberinfo"));

		return "/admin/order/adminOrderDetail";
	}
	@RequestMapping(value = "/order/q", method = RequestMethod.POST)
	public String adminOrderUpdatePOST(@RequestParam("ono") Integer orderNo, Model model) throws Exception { // tb_order.no
		logger.info("adminOrderGET.......................zz");
		
		Map<String, Object> param = service.adminOrderDetail(orderNo);
		
		//model.addAttribute("orderDetail", service.adminOrderRead());
		
		model.addAttribute("orderinfo", param.get("orderinfo"));
		model.addAttribute("ordereditemList", param.get("ordereditemList"));
		model.addAttribute("memberinfo", param.get("memberinfo"));

		return "/admin/order/adminOrderDetail";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String adminMemberGET(@ModelAttribute("pcr") SearchCriteria pcr, Model model) throws Exception {
		logger.info("adminOrderGET.......................zz");
		
		return "/admin/adminMember";
	}
	
}