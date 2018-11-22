package com.vil.pjt.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.dto.LoginDTO;
import com.vil.pjt.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void regist(MemberVO member) throws Exception {
		dao.create(member);
	}

	@Override
	public List<MemberVO> listALL() throws Exception {
		return dao.listAll();
	}

	
	@Override
	public int selectMemberID(String id) throws Exception {
		return dao.selectMemberID(id);
	}

	@Override
	public MemberVO getMember(MemberVO vo) throws Exception {
		return dao.getMember(vo);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void edit(MemberVO vo) throws Exception {
		dao.edit(vo);
	}

	@Override
	public void delete(String id) throws Exception {
		dao.delete(id);
	}



	
}
