package com.vil.pjt.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vil.pjt.HomeController;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminLogin(Locale locale) {
		logger.info("Welcome Admin login home! The client locale is {}.-----------------------------", locale);
		
		return "admin/adminLogin";
	}
	
	@RequestMapping(value = "/doAdminLogin", method = RequestMethod.GET)
	public String doAdminLogin(Locale locale, Model model) {
		System.out.println("doAdmin.......................zz");
		
		return "admin/adminLogin";
	}
	@RequestMapping(value = "/doAdminLogin2", method = RequestMethod.GET)
	public String doAdminLogin2(Locale locale, Model model) {
		System.out.println("doAdmin2.......................zz");
		model.addAttribute("result", "doAdminLogin2 result");
		return "admin/adminLogin";
	}
}
