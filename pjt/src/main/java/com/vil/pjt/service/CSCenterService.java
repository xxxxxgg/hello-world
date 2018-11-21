package com.vil.pjt.service;

import java.util.List;

import com.vil.pjt.domain.FaqVO;
import com.vli.pjt.framework.paging.SearchCriteria;

public interface CSCenterService  {

	public List<FaqVO> FaqList(SearchCriteria pcr) throws Exception;
	public int FaqCount(SearchCriteria pcr) throws Exception;

}
