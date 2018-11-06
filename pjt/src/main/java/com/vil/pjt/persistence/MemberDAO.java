package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.dto.LoginDTO;

public interface MemberDAO {
	
	public void create(MemberVO vo) throws Exception;
	
	public List<MemberVO> listAll() throws Exception;
	
	//아이디 중복체크
	public int selectMemberID(String id) throws Exception ;
	
	@SuppressWarnings("unckecked")
	public MemberVO getMember(MemberVO vo) throws Exception;
	
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public void edit(MemberVO vo) throws Exception;

	public void delete(String id) throws Exception;
	 
}
