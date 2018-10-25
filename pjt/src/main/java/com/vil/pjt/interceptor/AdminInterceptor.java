package com.vil.pjt.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav) throws Exception {
		System.out.println("post handle..........zz");
		
		Object result = mav.getModel().get("result");
		
		if(result != null) {
			req.getSession().setAttribute("result", result);
			res.sendRedirect("/admin/doAdminLogin");
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		System.out.println("pre handle..........zz");
		
		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		
		System.out.println("Bean: " + method.getBean());
		System.out.println("Method: " + methodObj);
		
		return true;
	}
}
