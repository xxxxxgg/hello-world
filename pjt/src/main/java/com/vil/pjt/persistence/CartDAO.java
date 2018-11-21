package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.CartVO;

public interface CartDAO {
	
	public void create(CartVO vo) throws Exception;
	
	public void update(CartVO vo) throws Exception;
	
	public void delete(Integer cart_id) throws Exception;
	
	public List<CartVO> listAll(String member_id) throws Exception;

}
