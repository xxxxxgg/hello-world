package com.vil.pjt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vil.pjt.domain.FaqVO;
import com.vil.pjt.persistence.CSCenterDAO;
import com.vli.pjt.framework.paging.SearchCriteria;

@Service
public class CSCenterServiceimpl implements CSCenterService {
	@Inject
	CSCenterDAO dao;
	
	@Override
	public List<FaqVO> FaqList(SearchCriteria pcr) throws Exception {
		return dao.FaqList(pcr);
	}

	@Override
	public int FaqCount(SearchCriteria pcr) throws Exception {
		return dao.FaqCount(pcr);
	}

}
