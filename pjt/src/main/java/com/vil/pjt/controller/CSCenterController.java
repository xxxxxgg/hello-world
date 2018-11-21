package com.vil.pjt.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vil.pjt.domain.JsonVO;
import com.vil.pjt.service.CSCenterService;
import com.vli.pjt.framework.paging.PageMaker;
import com.vli.pjt.framework.paging.SearchCriteria;

@Controller
@RequestMapping("/cscenter")
public class CSCenterController {
	@Inject
	private CSCenterService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CSCenterController.class);

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(@ModelAttribute("pcr") SearchCriteria pcr, Model model, Locale locale) throws Exception {
		logger.info("Welcome cscenter! The client locale is {}.-----------------------------", locale);
		
		model.addAttribute("faqlist", service.FaqList(pcr));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPcr(pcr);
		pageMaker.setTotalCount(service.FaqCount(pcr));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/cscenter/csmain";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public void faq(@ModelAttribute("pcr") SearchCriteria pcr, Model model) throws Exception {
		logger.info("cscenter faq -------------------------------------------");
		
		model.addAttribute("faqlist", service.FaqList(pcr));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPcr(pcr);
		pageMaker.setTotalCount(service.FaqCount(pcr));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public void ajaxtest() {
		
	}
	
	@RequestMapping(value = "/doA", method = RequestMethod.GET)
	public String doA(Locale locale, Model model) {
		
		System.out.println("doA.............");
		
		return "home";
	}
	
	@RequestMapping(value = "/doB", method = RequestMethod.GET)
	public String doB(Locale locale, Model model) {
		
		System.out.println("doB.............");
		model.addAttribute("result", "DOB RESULT");
		
		return "home";
	}
}
