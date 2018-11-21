package com.vil.pjt.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.vil.pjt.domain.FaqVO;
import com.vil.pjt.service.AdminService;

@RestController
@RequestMapping("/admin")
public class AdminRESTController {
	@Inject
	private AdminService service;

	@RequestMapping(value = "/faq/new", method = RequestMethod.POST)
	public ResponseEntity<String> registerFaq(@RequestBody FaqVO vo) {
		ResponseEntity<String> entity = null;

		try {
			service.addFaq(vo);
			entity = new ResponseEntity<>("faq add Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
/*	@ResponseBody
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<FaqVO>> listReplyAll(@PathVariable("bno") Integer bno) {
		ResponseEntity<List<FaqVO>> entity = null;
		System.out.println("dfdfdfdfd");
		try {
			entity = new ResponseEntity<>(service.listReplyAll(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}*/	
	/*@RequestMapping(value = "/{fno}/{pageNum}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listReplyPage(@PathVariable("fno") Integer fno, @ModelAttribute("pcr") SearchCriteria pcr) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Map<String, Object> map = new HashMap<>();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setPcr(pcr);
			pageMaker.setTotalCount(service.adminFaqCount(pcr));
			
			//cri.setPageNum(pageNum);
			List<FaqVO> faqlist = service.adminFaqList(pcr);
			
			map.put("faqlist", faqlist);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}*/
	@RequestMapping(value = "/faq/{no}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> modifyReply(@PathVariable("no") Integer no, @RequestBody FaqVO vo) {
		ResponseEntity<String> entity = null;

		try {
			vo.setNo(no);
			service.modifyFaq(vo);
			entity = new ResponseEntity<String>("faq modify Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/faq/{no}", method = RequestMethod.DELETE )
	public ResponseEntity<String> removeReply(@PathVariable("no") Integer no) {
		ResponseEntity<String> entity = null;

		try {
			service.removeFaq(no);
			entity = new ResponseEntity<String>("faq remove Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
