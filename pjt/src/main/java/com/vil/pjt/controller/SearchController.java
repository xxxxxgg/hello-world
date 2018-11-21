package com.vil.pjt.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vil.pjt.persistence.ProductDAO;
import com.vil.pjt.service.SearchService;

@Controller
@RequestMapping("")
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	//@Inject
	//private SearchService service;
	@Inject
	private ProductDAO dao;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(Locale locale) {
		logger.info("Welcome index! The client locale is {}.-----------------------------", locale);
		
		return "index";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@ModelAttribute("keyword") String keyword, Model model) {
		logger.info(keyword);
		model.addAttribute("keyword", keyword);
		return "searchList";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(HttpServletRequest httpServletRequest, Model model)throws Exception{
		String keyword = httpServletRequest.getParameter("keyword");
		int count;
		count = dao.SearchCount(keyword);
		model.addAttribute("catCount", count);

		model.addAttribute("keyword", keyword);
		model.addAttribute("list",dao.SearchList(keyword));
		
		return "product/list";
	}
}
