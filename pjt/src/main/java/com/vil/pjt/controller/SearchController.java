/**
 * 강부경이 하고있슴
 */
package com.vil.pjt.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/search")
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String index(Locale locale) {
		logger.info("Welcome index! The client locale is {}.-----------------------------", locale);
		
		return "index";
	}
}
