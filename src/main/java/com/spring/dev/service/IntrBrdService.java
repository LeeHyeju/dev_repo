package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.IntrBrdMapper;

@Service
public class IntrBrdService {
	@Autowired
	IntrBrdMapper mapper;
	
	public List<IntrBrd> getBrd(SearchCriteria scri) {
		return mapper.getBrd(scri);
	}
	
	public List<IntrBrd> top10(SearchCriteria scri) {
		return mapper.top10(scri);
	}
	
	public List<IntrFaq> getFaq(SearchCriteria scri) {
		return mapper.getFaq(scri);
	}
	
	public int listCount() {
		return mapper.listCount();
	}
	
	public int listCount2(IntrBrd intrBrd) {
		return mapper.listCount2(intrBrd);
	}
	
	public int listCount3() {
		return mapper.listCount3();
	}
	
	public List<IntrBrd> search(IntrBrd intrBrd, Criteria cri) {
		return mapper.search(intrBrd, cri);
	}
	
	public IntrBrd dtl(String boardCd) {
		return mapper.dtl(boardCd);
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
	
	public void delete(int boardCd) {
		mapper.delete(boardCd);
	}
	
	public void update(IntrBrd intrBrd) {
		mapper.update(intrBrd);
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
