package com.vil.pjt.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vil.pjt.domain.CartVO;
import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.OrderListVO;
import com.vil.pjt.domain.OrderVO;
import com.vil.pjt.domain.OrderedItemVO;
import com.vil.pjt.domain.PageMaker;
import com.vil.pjt.persistence.CartDAO;
import com.vil.pjt.persistence.OrderDAO;
import com.vil.pjt.persistence.ProductDAO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderDAO dao;
	
	@Inject
	private CartDAO cartDao;
	
	@Inject
	private ProductDAO Pdao;

	@RequestMapping(value = "/mypageOrderList", method = RequestMethod.GET)
	public void mypageOrderListGET(HttpSession session, Model model) throws Exception {
		logger.info("주문내역 페이지를 보여준다.");	

		Object obj = session.getAttribute("login");
		MemberVO vo = (MemberVO) obj; //로그인되어있는 정보
		
		List<OrderListVO> orderList= new ArrayList<OrderListVO>(); 
		orderList = dao.orderList(vo.getId());
		
		System.out.println("오더리스트 : " + orderList);
		session.setAttribute("orderList2", orderList);
	}	
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public void home() throws Exception {
		
		logger.info("주문페이지를 보여줌"); 
		
	}	
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderPOST(int[] chk_arr, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("실제로 주문을 한다");
		
		Object obj = session.getAttribute("login");
		MemberVO vo = (MemberVO) obj; //로그인되어있는 정보
		
		//오더 테이블에 삽입
		OrderVO order = new OrderVO();
		order.setMember_id(vo.getId());
		
		order.setState("결제완료");
		order.setOrderdate(new Date());
		dao.creatOrder(order);
		
		//오더드 아이템에 삽입
		Object obj2 = session.getAttribute("cartlist");
		List<CartVO> cartlist = (List<CartVO>) obj2;
		
		int getorder = dao.getOrder(); //오더넘버
		
		//현재날짜
		Date today = new Date();
				
		//한달후 날짜
		Calendar cal1 = Calendar.getInstance();
		cal1.add(Calendar.MONTH, +1);
		Date mon=cal1.getTime();
		session.setAttribute("mon", mon);
		
		//일주일 후 날짜
		Calendar cal2 = Calendar.getInstance();
		cal2.add(Calendar.DATE, +7);
		Date week=cal2.getTime();
		session.setAttribute("week", week);
		
		
		

		   
		
		int total = 0;
		for (CartVO item : cartlist) {
			OrderedItemVO orderItem = new OrderedItemVO();
			orderItem.setItem_no(item.getProduct_id());
			orderItem.setCount(item.getQuantity());
			orderItem.setTotalprice(item.getPrice());
			orderItem.setRentaltype(item.getRental_type());
			orderItem.setStartdate(today);
			if(orderItem.getRentaltype().equals("1주")) {
				orderItem.setEnddate(week);
			} else {
				orderItem.setEnddate(mon);
			}
			orderItem.setOrder_no(getorder);
			dao.creatOrderedItem(orderItem);
			total += item.getPrice();
		}
		
		//주문총액 수정
		order.setTotalprice(total);
		order.setNo((Integer)getorder);
		dao.updateOrder(order);
		
		
		//오더리스트에 저장 
		List<OrderListVO> orderList= new ArrayList<OrderListVO>(); 
		orderList = dao.orderList(vo.getId());
		
		System.out.println("오더리스트 : " + orderList);
		session.setAttribute("orderList2", orderList);
		
		return "redirect:/order/success";
	}
	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public void orderSussesGET(Model Model) throws Exception {
		logger.info("성공 페이지를 보여줌");
	}	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(HttpServletRequest httpServletRequest, @ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		String keyword = httpServletRequest.getParameter("keyword");
		int count;
		
		cri.setKeyword(keyword);
		count = Pdao.SearchCount(cri);
		
		model.addAttribute("catCount", count);	//몇개 검색
		
		model.addAttribute("keyword", keyword);	//검색 키워드
		
		
		model.addAttribute("list",Pdao.SearchList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(Pdao.SearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("test: " + cri.toString());
		
		return "order/list";
	}
}
