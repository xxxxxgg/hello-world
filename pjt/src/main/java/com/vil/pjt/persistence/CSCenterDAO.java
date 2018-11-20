package com.vil.pjt.persistence;

import java.util.List;

import com.vil.pjt.domain.FaqVO;
import com.vli.pjt.framework.paging.SearchCriteria;

public interface CSCenterDAO {

	public List<FaqVO> FaqList(SearchCriteria pcr) throws Exception;
	public int FaqCount(SearchCriteria pcr) throws Exception;

}
