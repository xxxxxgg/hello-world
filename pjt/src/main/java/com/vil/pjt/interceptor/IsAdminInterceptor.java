package com.vil.pjt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class IsAdminInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "alogin";
	private static final Logger logger = LoggerFactory.getLogger(IsAdminInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav) throws Exception {
		logger.info("IsAdminInterceptor post handle..........zz");
	}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		logger.info("IsAdminInterceptor pre handle..........zz");
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute(LOGIN) == null) {
			logger.info("current admin is not logined");
			res.sendRedirect("/admin/adminLogin");
			return false;
		}
		return true;
	}
}
