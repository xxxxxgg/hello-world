package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.ProductVO;

public interface ProductDAO {
	
	public ProductVO read(Integer product_id) throws Exception;

	public List<ProductVO> listAll() throws Exception;
}
