/**
 * 강부경이 하고있슴
 */
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

import com.vil.pjt.service.SearchService;

@Controller
@RequestMapping("/")
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	//@Inject
	//private SearchService service;
	
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
}
