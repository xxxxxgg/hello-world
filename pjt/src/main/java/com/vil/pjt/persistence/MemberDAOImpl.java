package com.vil.pjt.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.TicketVO;
import com.vil.pjt.domain.UsedSellerVO;
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

	
	
	///이용권
	@Override
	public void ticketCreate(TicketVO vo) throws Exception {
		session.insert(namespace + ".ticketCreate", vo);
	}
	@Override
	public List<TicketVO> ticketRead(String member_id) throws Exception {
		return session.selectList(namespace + ".ticketRead", member_id);
	}
	@Override
	public void ticketEdit(TicketVO vo) throws Exception {
		session.update(namespace + ".ticketEdit", vo);
	}
	@Override
	public void ticketDelete(int ticket_id) throws Exception {
		session.delete(namespace + ".ticketDelete", ticket_id);
	}
	@Override
	public int ticketMin(String member_id) throws Exception {
		return session.selectOne(namespace + ".ticketMin", member_id);
	}
	@Override
	public TicketVO ticketReadOne(int ticket_id) throws Exception {
		return session.selectOne(namespace + ".ticketReadOne", ticket_id);
	}
	@Override
	public int ticketCount(String member_id) throws Exception {
		return session.selectOne(namespace + ".ticketCount", member_id);
	}
	@Override
	public int ticketRemain(String member_id) throws Exception {
		return session.selectOne(namespace + ".ticketRemain", member_id);
	}
	
	
	
	//중고업자
	@Override
	public void sellerCreate(UsedSellerVO vo) throws Exception {
		session.insert(namespace + ".sellerCreate", vo);
	}
	@Override
	public int sellerRead(String seller_name) throws Exception {
		return session.selectOne(namespace + ".sellerRead", seller_name);
	}
	@Override
	public List<UsedSellerVO> sellerList() throws Exception {
		return session.selectList(namespace + ".sellerList");
	}





}
