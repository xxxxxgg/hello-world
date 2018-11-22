package com.vil.pjt.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vil.pjt.domain.CartVO;
import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.PageMaker;
import com.vil.pjt.domain.ProductVO;
import com.vil.pjt.domain.SearchCriteria;
import com.vil.pjt.persistence.CartDAO;
import com.vil.pjt.persistence.ProductDAO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	private static final Logger logger =LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductDAO dao;
	
	@Inject
	private CartDAO cartDao;
		
	@RequestMapping(value="/category", method={RequestMethod.GET, RequestMethod.POST})
	public void category(@RequestParam("category") String category, @ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		String pageTitle;
		//String sortTpye = httpServletRequest.getParameter("sortType");
		int count;
		pageTitle = category.replace("\"","");
		count = dao.countCat(pageTitle);
		model.addAttribute(dao.cat(category));
		model.addAttribute("PageTitle", pageTitle);
		model.addAttribute("catCount", count);
		
		
		cri.setCategory(pageTitle);

			
		model.addAttribute("list", dao.catList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(dao.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("test: " + cri.toString());

		
	}
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(HttpServletRequest httpServletRequest, @ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		String keyword = httpServletRequest.getParameter("keyword");
		int count;
		
		cri.setKeyword(keyword);
		count = dao.SearchCount(cri);
		
		model.addAttribute("catCount", count);	//몇개 검색
		
		model.addAttribute("keyword", keyword);	//검색 키워드
		
		
		model.addAttribute("list",dao.SearchList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(dao.SearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("test: " + cri.toString());
		
		return "product/list";
	}

	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(@RequestParam("product_id") int product_id, Model model) throws Exception {
		model.addAttribute(dao.read(product_id));
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String registPOST(@RequestParam("product_id") int product_id, CartVO cart, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		logger.info("장바구니에 상품을 담는다");
		cart.setProduct_id(product_id);
		
		int proId = cart.getProduct_id();
		if(cart.getRental_type().equals("1주")){
			cart.setPrice(dao.read(product_id).getPriceforweek()*cart.getQuantity());
		}
		if(cart.getRental_type().equals("1개월")){
			cart.setPrice(dao.read(product_id).getPriceformonth()*cart.getQuantity());
		}
		if(cart.getRental_type().equals("새상품(1개월)")){
			cart.setPrice(dao.read(product_id).getPriceformonth()*cart.getQuantity());
		}
		
		
		if(session.getAttribute("login") == null){ 	//로그인 안했을 때
			cart.setMember_id("");
		} 
		else { 										//로그인되어있을 때
			Object obj = session.getAttribute("login");
			MemberVO member = (MemberVO) obj; 		
			cart.setMember_id(member.getId());
		}
		cartDao.create(cart);

		return "redirect:/product/cart";
	}	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public void cartGET(HttpSession session) throws Exception {
		logger.info("장바구니 페이지를 보여준다.");	
		
		List<CartVO> cartlist = new ArrayList<CartVO>();
		if(session.getAttribute("login") != null){	//로그인되어있을 때
			Object obj = session.getAttribute("login");
			MemberVO member = (MemberVO) obj;
			cartlist = cartDao.listAll(member.getId());					
		} else {									///로그인 안했을 때
			cartlist = cartDao.listAll("");		
		}
		session.setAttribute("cartlist", cartlist);
	}	
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartPOST(int[] chk_arr, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("장바구니 삭제");
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO) obj;
		
		List<CartVO> cartList = new ArrayList<CartVO> ();
		cartList = cartDao.listAll(member.getId());
		
		for(int item : chk_arr) {
			cartDao.delete(item);
		}
		return "redirect:/product/cart";
	}	
	
	
	@RequestMapping(value = "/sell", method = RequestMethod.GET)
	public void orderSussesGET() throws Exception {
		logger.info("중고판매관 페이지를 보여줌");
	}
	
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
			logger.info("show list Page with Criteria........");
			
			cri.setCategory("반려동물");
			int count = dao.countAll();
			model.addAttribute("list", dao.listCriteria(cri));
			model.addAttribute("count", count);
	}
	
	@RequestMapping(value = "/listAll", method=RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("show all list........");
		int count = dao.countAll();
		model.addAttribute("list", dao.listAll());
		model.addAttribute("count", count);
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list", dao.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(dao.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
}
