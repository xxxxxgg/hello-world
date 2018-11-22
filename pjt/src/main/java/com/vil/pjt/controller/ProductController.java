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
import com.vil.pjt.domain.ProRequestVO;
import com.vil.pjt.domain.ProductVO;
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
	
/*	//카테고리 페이지
	@RequestMapping(value = "/cate1", method = RequestMethod.GET)
	public void cete1GET(HttpSession session, Model model) throws Exception {
		logger.info("카테고리1 페이지를 보여준다.");
		model.addAttribute("list", dao.listAll());
		session.setAttribute("list", dao.listAll());
		List<ProductVO> list = dao.listAll();
		System.out.println(list.toString());
	}	*/
	
	
	
	//상품페이지
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
	
	
	
	//장바구니	
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
	public String cartPOST(String btn, int[] chk_arr, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("장바구니 삭제");
		
		session.setAttribute("chk_arr", chk_arr);
		
		if (btn.equals("delete")) { 	//삭제버튼 눌렀을 때
			
			Object obj = session.getAttribute("login");
			MemberVO member = (MemberVO) obj;
			
			List<CartVO> cartList = new ArrayList<CartVO> ();
			cartList = cartDao.listAll(member.getId());
			
			for(int item : chk_arr) {
				cartDao.delete(item);
			}
			return "redirect:/product/cart";
		} 
		else {							//주문버튼 눌렀을 때
			Object obj = session.getAttribute("login");
			MemberVO member = (MemberVO) obj;

			List<CartVO> cartList = new ArrayList<CartVO> ();
			cartList = cartDao.listAll(member.getId()); //카트리스트
			
			List<CartVO> cartTOorder = new ArrayList<CartVO> ();
			
			for(int item : chk_arr) {
				cartTOorder.add(cartDao.read(item));
				System.out.println("카트 다오 리드 : " + cartDao.read(item));
			}
			session.setAttribute("cartTOorder", cartTOorder);
			
			return "redirect:/order/order";
		}
	}	
	
	
	
	
	//제품신청
	@RequestMapping(value = "/sell", method = RequestMethod.GET)
	public void sellGET() throws Exception {
		logger.info("제품신청 페이지를 보여줌");
	}
	
	@RequestMapping(value = "/sell", method = RequestMethod.POST)
	public String sellPOST(String sellType, String sellModel, String sellPhone, String sellMsg) throws Exception {
		logger.info("제품신청 제출");

		ProRequestVO req = new ProRequestVO();
		req.setRequest_model(sellModel);
		req.setRequest_msg(sellMsg);
		req.setRequest_phone(sellPhone);
		req.setRequest_type(sellType);
		
		dao.requestCreate(req);
		
		return "redirect:/product/sellsuccess";
	}	
	
	@RequestMapping(value = "/sellsuccess", method = RequestMethod.GET)
	public void sellsuccessGET() throws Exception {
		logger.info("제품신청 완료");
	}
	
	
	
	//노티켓
	@RequestMapping(value = "/noTicket", method = RequestMethod.GET)
	public void noTicketGET() throws Exception {
		logger.info("노티켓 페이지를 보여줌");
	}
	
	
	
	
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
	
}
