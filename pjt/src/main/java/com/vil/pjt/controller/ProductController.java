package com.vil.pjt.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.ProductVO;
import com.vil.pjt.persistence.ProductDAO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	private static final Logger logger =LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductDAO dao;
	
	@RequestMapping(value = "/cate1", method = RequestMethod.GET)
	public void cete1GET(HttpSession session, Model model) throws Exception {
		logger.info("카테고리1 페이지를 보여준다.");
		model.addAttribute("list", dao.listAll());
		session.setAttribute("list", dao.listAll());
		List<ProductVO> list = dao.listAll();
		System.out.println(list.toString());
	}	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(@RequestParam("product_id") int product_id, Model model) throws Exception {
		model.addAttribute(dao.read(product_id));
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String registPOST(ProductVO product, RedirectAttributes rttr) throws Exception {
		logger.info("장바구니에 담는다");
		
		return "redirect:/order/cart";
	}	

}
