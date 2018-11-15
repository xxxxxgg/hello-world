package com.vil.pjt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "alogin";
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav) throws Exception {
		logger.info("AdminLoginInterceptor post handle..........zz");
		
		HttpSession session = req.getSession();
		ModelMap modelMap = mav.getModelMap();
		Object adminVO = modelMap.get("adminVO");
		
		if(adminVO != null) {
			logger.info("new admin login success");
			session.setAttribute(LOGIN, adminVO);
			res.sendRedirect("/admin");
		}
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		logger.info("AdminLoginInterceptor pre handle..........zz");
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear admin login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
}
