package com.vil.pjt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.OrderListVO;
import com.vil.pjt.persistence.OrderDAO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderDAO dao;

	@RequestMapping(value = "/mypageOrderList", method = RequestMethod.GET)
	public void mypageOrderListGET(HttpSession session, Model model) throws Exception {
		logger.info("주문내역 페이지를 보여준다.");	

		Object obj = session.getAttribute("login");
		MemberVO vo = (MemberVO) obj; //로그인되어있는 정보
		
		List<OrderListVO> orderList = dao.orderList(vo.getId());
		System.out.println("오더리스트" + orderList.toString());
		model.addAttribute("orderList", orderList); //주문번호가 들어가 있는 리스트
		session.setAttribute("orderList", orderList);
	}	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public void cartGET() throws Exception {
		logger.info("장바구니 페이지를 보여준다.");	
	}	
}
