package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.mapper.IntrBrdMapper;

@Service
public class IntrBrdService {
	@Autowired
	IntrBrdMapper mapper;
	
	public List<IntrBrd> postList(SearchKey searchKey, Criteria cri) {
		return mapper.postList(searchKey, cri);
	}
	
	public int postListCount(SearchKey searchKey) {
		return mapper.postListCount(searchKey);
	}
	
	public List<IntrBrd> notiList() {
		return mapper.notiList();
	}
	
	public void brdHit(String tblNm, String brdCd, int hit) {
		mapper.brdHit(tblNm, brdCd, hit);
	}
	
	public IntrBrd dtl(String brdCd) {
		return mapper.dtl(brdCd);
	}
	
	public void update(IntrBrd intrBrd) {
		mapper.update(intrBrd);
	}
	
	public void delete(String brdCd) {
		mapper.delete(brdCd);
	}
	
	
	
	
	
	
	
//	public List<IntrBrd> top10(SearchCriteria scri) {
//		return mapper.top10(scri);
//	}
//	
//	public List<IntrFaq> getFaq(SearchCriteria scri) {
//		return mapper.getFaq(scri);
//	}
	
	public int listCount2(IntrBrd intrBrd) {
		return mapper.listCount2(intrBrd);
	}
	
	public int listCount3() {
		return mapper.listCount3();
	}
	
	public IntrFaq dtl2(String brdCd, int hit) {
		mapper.boardHit(brdCd, hit);
		return mapper.dtl2(brdCd);
	}
	
	public void insert(IntrBrd intrBrd) {
		mapper.insert(intrBrd);
	}
	
	public void insert2(IntrFaq intrFaq) {
		mapper.insert2(intrFaq);
	}
	
	public int boardCdMax() {
		return mapper.boardCdMax();
	}
	
	public int brdCdMax() {
		return mapper.brdCdMax();
	}
	

	
	public void delete2(int brdCd) {
		mapper.delete2(brdCd);
	}
	
	public void update2(IntrFaq intrFaq) {
		mapper.update2(intrFaq);
	}
	
	public void boardHit(String brdCd, int hit) {
		mapper.boardHit(brdCd, hit);
	}
}
