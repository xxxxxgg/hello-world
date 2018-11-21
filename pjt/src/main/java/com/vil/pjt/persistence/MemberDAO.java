package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.MemberVO;
import com.vil.pjt.domain.TicketVO;
import com.vil.pjt.domain.UsedSellerVO;
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
	
	
	//이용권
	public void ticketCreate (TicketVO vo) throws Exception;				//이용권구매
	public List<TicketVO> ticketRead(String member_id) throws Exception;	//티켓리스트
	public TicketVO ticketReadOne(int ticket_id) throws Exception;			//티켓 하나만
	public int ticketMin(String member_id) throws Exception;				//가장 오래된 티켓
	public void ticketEdit(TicketVO vo) throws Exception;					//이용횟수 차감
	public void ticketDelete(int ticket_id) throws Exception;				//만료된 티켓
	public int ticketCount(String member_id) throws Exception;				//티켓 갯수(없는지 확인)
	public int ticketRemain(String member_id) throws Exception;				//티켓 잔여횟수 
	
	
	//중고업자연동
	public void sellerCreate(UsedSellerVO vo) throws Exception;
	
	public int sellerRead(String seller_name) throws Exception;
	public List<UsedSellerVO> sellerList() throws Exception;
	
}
