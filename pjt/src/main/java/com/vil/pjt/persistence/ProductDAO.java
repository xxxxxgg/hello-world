package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.ProRequestVO;
import com.vil.pjt.domain.ProductVO;

public interface ProductDAO {
	
	public ProductVO read(Integer product_id) throws Exception;

	public List<ProductVO> listAll() throws Exception;
	
	//상품 신청
	public void requestCreate(ProRequestVO vo) throws Exception;
}
