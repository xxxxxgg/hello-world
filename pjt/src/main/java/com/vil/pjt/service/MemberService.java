package com.vil.pjt.service;

import java.util.List;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.dto.LoginDTO;

public interface MemberService {
	
	public void regist(MemberVO member) throws Exception;
	
	public List<MemberVO> listALL() throws Exception;
	
	public int selectMemberID(String id) throws Exception;

	public MemberVO getMember(MemberVO vo) throws Exception;
	
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public void edit(MemberVO vo) throws Exception;
	
	public void delete(String id) throws Exception;
	
}
