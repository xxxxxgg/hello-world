package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.ProductVO;
import com.vil.pjt.domain.SearchCriteria;

public interface ProductDAO {
	
	public ProductVO read(Integer product_id) throws Exception;

	public List<ProductVO> listAll() throws Exception;
	
	public List<ProductVO> cat(String category)throws Exception;
	
	public List<ProductVO> listCat() throws Exception;
	
	public int countCat(String category) throws Exception;
	
	public int countAll() throws Exception;
	
	public List<ProductVO> listPage(int page)throws Exception;
	
	public List<ProductVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri)throws Exception;
	
	public List<ProductVO> catList(Criteria cri)throws Exception;
	
	public List<ProductVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public int SearchCount(String keyword)throws Exception;
	
	public List<ProductVO> SearchList(String keyword)throws Exception;
	
}
