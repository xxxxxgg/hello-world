package com.vil.pjt;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.vil.pjt.domain.Criteria;
import com.vil.pjt.domain.ProductVO;
import com.vil.pjt.domain.SearchCriteria;
import com.vil.pjt.persistence.ProductDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProductTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductTest.class);
	
	@Inject
	private ProductDAO dao;
	
	//@Test
	public void testReadAll() throws Exception{
		logger.info(dao.listAll().toString());
	}
	
	//@Test
	public void testRead() throws Exception{
		logger.info(dao.read(2).toString());
	}
	
	//@Test
	public void testCat() throws Exception{
		logger.info(dao.listCat().toString());
	}
	
	//@Test
	public void listCat() throws Exception{
		logger.info(dao.cat("반려동물").toString());
	}
	
	//@Test
	public void countCat() throws Exception{
		String cat = "반려동물";
		logger.info("count: " + dao.countCat(cat));
	}
	
	//@Test
	public void testListPage() throws Exception{
		int page = 1;
		List<ProductVO> list = dao.listPage(page);
		
		for(ProductVO productVO: list){
			logger.info(productVO.getProduct_id() + ":" + productVO.getProduct_name());
		}
	}
	
	//@Test
		public void testListCriteria()throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(16);
		
		List<ProductVO> list = dao.listCriteria(cri);
		
		for(ProductVO productVO : list){
			logger.info(productVO.getProduct_id() + ":" + productVO.getProduct_name());
		}
		
	}
		
		//@Test
		public void testListcat()throws Exception{
		Criteria cri = new Criteria();
		cri.setCategory("반려동물");
		cri.setPage(2);
		cri.setPerPageNum(16);
		
		List<ProductVO> list = dao.catList(cri);
		
		for(ProductVO productVO : list){
			logger.info(productVO.getProduct_id() + ":" + productVO.getProduct_name());
		}
		
	}
		
		//@Test
		public void testDynamic() throws Exception{
			SearchCriteria cri = new SearchCriteria();
			cri.setPage(1);
			cri.setKeyword("유모차");
			
			logger.info("=================================");
			
			List<ProductVO> list = dao.listSearch(cri);
			
			for(ProductVO productVO : list){
				logger.info(productVO.getProduct_id() + ":" + productVO.getProduct_name());
			}
			
			logger.info("==================================");
			
			logger.info("COUNT : " + dao.listSearchCount(cri));
		}
		
		//@Test
		public void testURI2()throws Exception{
			UriComponents uriComponents = 
					UriComponentsBuilder.newInstance()
					.path("/{module}/{page}")
					.queryParam("product_id", 12)
					.queryParam("perPageNum", 16)
					.build()
					.expand("product", "listCri")
					.encode();
			
			logger.info("/product/listCri?product_id=12&perPageNum=16");
			logger.info(uriComponents.toString());
		}
					
		@Test
		public void countlist() throws Exception{
			String keyword = "유모차";
			logger.info("count: " + dao.SearchCount(keyword));
		}

}
