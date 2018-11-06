package com.vil.pjt.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.vil.pjt.mapper.MemberMapper";
	
	@Override
	public void create(MemberVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public List<MemberVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public int selectMemberID(String id) throws Exception {
		int result = (session.selectOne(namespace + ".selectMemberID", id));
		System.out.println("결과 : " + result);
		return result;
	}

	@Override
	public MemberVO getMember(MemberVO vo) throws Exception {
		return (MemberVO)session.selectOne(namespace + ".getMember", vo);
}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void edit(MemberVO vo) throws Exception {
		session.update(namespace + ".update", vo);	
	}

	@Override
	public void delete(String id) throws Exception {
		session.delete(namespace + ".delete", id);
	}





}
