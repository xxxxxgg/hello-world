package com.vil.pjt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.PageMaker;
import com.vil.pjt.domain.TicketVO;
import com.vil.pjt.domain.UsedSellerVO;
import com.vil.pjt.dto.LoginDTO;
import com.vil.pjt.persistence.MemberDAO;
import com.vil.pjt.persistence.ProductDAO;
import com.vil.pjt.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
	
	@Inject
	private MemberDAO dao;
	
	@Inject
	private ProductDAO Pdao;
	
	//회원가입
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(MemberVO member, Model Model) throws Exception {
		logger.info("회원가입 페이지를 보여준다.");
	}		
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(MemberVO member, RedirectAttributes rttr) throws Exception {
		logger.info("실제로 회원가입을 한다");
		logger.info(member.toString());
		
		service.regist(member);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/member/success";
	}	
	
	
	@RequestMapping(value="/checkUserID")
	@ResponseBody
	public int idCheck(String id) throws Exception {
		System.out.println("아이디체크");   
		System.out.println("스트링 아이디 : " + id);
		int checkResult = service.selectMemberID(id);
		return checkResult;
	}
	
	
	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public void home(Model Model) throws Exception {
		logger.info("회원가입 완료페이지를 보여줌");
	}	
	@RequestMapping(value = "/success", method = RequestMethod.POST)
	public String homePOST() throws Exception {
		logger.info("메인페이지로");
		return "/index";
	}
	
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		logger.info("로그인 페이지를 보여준다.");
	}	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		logger.info("로그인 POST");
		
		MemberVO vo = service.login(dto);	
		if (vo == null) {
			return;
		}
		model.addAttribute("memberVO", vo);
	}
	
	@RequestMapping(value = "/loginWrong", method = RequestMethod.GET)
	public void loginWrongGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		logger.info("로그인 wrong 페이지를 보여준다."); //로그인정보가 옳지 않을 때
	}	
	@RequestMapping(value = "/loginWarning", method = RequestMethod.GET)
	public void loginWarningGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		logger.info("로그인 warning 페이지를 보여준다."); //로그인이 필요할 때
	}	
	
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("로그아웃 보여준다.");
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			MemberVO vo = (MemberVO) obj;
			session.removeAttribute("login");
			session.invalidate();
		}
		return "member/logout";
	}	
	
	
	//마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypageGET(@ModelAttribute("dto") LoginDTO dto, Model model) throws Exception {
		logger.info("마이페이지를 보여준다.");	
	}	
	@RequestMapping(value = "/mypageEdit", method = RequestMethod.GET)
	public void mypageEditGET(@ModelAttribute("dto") LoginDTO dto, Model model) throws Exception {
		logger.info("회원정보수정을 보여준다.");	
	}	
	@RequestMapping(value = "/mypageEdit", method = RequestMethod.POST)
	public String mypageEditPOST(MemberVO member, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
		logger.info("실제로 회원정보수정을 한다");

		Object obj = session.getAttribute("login");
		
		MemberVO vo = (MemberVO) obj; //로그인되어있는 정보
		member.setId(vo.getId()); //폼에서 받은 정보 = member
		
		service.edit(member);
		session.setAttribute("login", member);
				
		return "redirect:/member/mypage";
	}
	@RequestMapping(value = "/mypageWithdraw", method = RequestMethod.GET)
	public void mypageWithdrawGET() throws Exception {
		logger.info("탈퇴 화면을 보여준다.");	
	}
	@RequestMapping(value = "/mypageWithdraw", method = RequestMethod.POST)
	public String mypageWithdrawPOST(MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("실제로 탈퇴를 한다.");
		
		Object obj = session.getAttribute("login");
		
		MemberVO vo = (MemberVO) obj;
		String id = vo.getId();
		if(obj != null) {
			session.removeAttribute("login");
			session.invalidate();
		}
		
		service.delete(id);
		
		return "redirect:/member/successWithdraw";
	}	
	@RequestMapping(value = "/successWithdraw", method = RequestMethod.GET)
	public void successWithdraw() throws Exception {
		logger.info("탈퇴완료 완료페이지를 보여줌");
	}	
	
	
	//이용권
	@RequestMapping(value = "/mypageTicket", method = RequestMethod.GET)
	public void mypageTicketGET( HttpSession session) throws Exception {
		logger.info("이용권 화면을 보여준다.");	
		Object obj = session.getAttribute("login"); 
		MemberVO member = (MemberVO) obj;
		
		List<TicketVO> ticketList = new ArrayList<TicketVO>();
		ticketList = dao.ticketRead(member.getId());
	
		session.setAttribute("ticketList", ticketList);
	}
	@RequestMapping(value = "/mypageTicket", method = RequestMethod.POST)
	public String mypageTicketPOST(String ticket_type, HttpSession session) throws Exception {
		
		//티켓 VO 만들기
		TicketVO ticket = new TicketVO();
		
		Object obj = session.getAttribute("login"); 
		MemberVO member = (MemberVO) obj;
		
		ticket.setMember_id(member.getId());
		
		if (ticket_type.equals("gold")) {
			ticket.setRental_type("gold");
			ticket.setCount(5);
		} 
		else if (ticket_type.equals("silver")) {
			ticket.setRental_type("silver");
			ticket.setCount(3);
		} 
		else if (ticket_type.equals("bronze")) {
			ticket.setRental_type("bronze");
			ticket.setCount(1);
		} 
		
		//티켓 VO DB에 넣기
		dao.ticketCreate(ticket);
		
		List<TicketVO> ticketList = new ArrayList<TicketVO>();
		ticketList = dao.ticketRead(member.getId());
	
		session.setAttribute("ticketList", ticketList);
		
		return "redirect:/member/mypageTicket";
	}	
	
	
	//중고업자 등록하기
	@RequestMapping(value = "/usedSellerRegister", method = RequestMethod.GET)
	public void usedSellerRegisterGET() throws Exception {
		logger.info("중고업자등록 페이지를 보여준다.");	
		
	}	
	
	@RequestMapping(value = "/usedSellerRegister", method = RequestMethod.POST)
	public String usedSellerRegisterPOST(HttpSession session, String id, String usedSellerNum, String usedSellerPhone, String usedSellerAddress, String usedSellerMsg) throws Exception {
		
		logger.info("실제로 중고업자등록하기");
		
		UsedSellerVO seller = new UsedSellerVO();
		seller.setSeller_address(usedSellerAddress);
		seller.setSeller_msg(usedSellerMsg);
		seller.setSeller_name(id);
		seller.setSeller_num(usedSellerNum);
		seller.setSeller_phone(usedSellerPhone);
		dao.sellerCreate(seller);	
		
		List<UsedSellerVO> sellerList = dao.sellerList();
		session.setAttribute("sellerList", sellerList);

		
		return "/member/usedSeller";
	}	
	
	@RequestMapping(value="/usedSellerCheck")
	@ResponseBody
	public int usedSellerCheck(String id) throws Exception {
		System.out.println("중고업체 체크");   
		System.out.println("스트링 아이디 : " + id);
		int checkResult = dao.sellerRead(id);
		System.out.println("체크결과 : " + checkResult);
		return checkResult;
	}
	

	@RequestMapping(value = "/usedSeller", method = RequestMethod.GET)
	public void usedSeller(HttpSession session) throws Exception {
		logger.info("제휴업체페이지");
		
		List<UsedSellerVO> sellerList = dao.sellerList();
		session.setAttribute("sellerList", sellerList);
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
		
		return "member/list";
	}	

}
