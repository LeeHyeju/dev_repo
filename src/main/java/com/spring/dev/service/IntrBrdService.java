package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.IntrBrdMapper;

@Service
public class IntrBrdService {
	@Autowired
	IntrBrdMapper mapper;
	
	public List<IntrBrd> getBrd(SearchCriteria scri) {
		return mapper.getBrd(scri);
	}
	
	public int listCount() {
		return mapper.listCount();
	}
	
	public int listCount2(IntrBrd intrBrd) {
		return mapper.listCount2(intrBrd);
	}
	
	public List<IntrBrd> search(IntrBrd intrBrd, Criteria cri) {
		return mapper.search(intrBrd, cri);
	}
	
	public IntrBrd dtl(String boardCd) {
		return mapper.dtl(boardCd);
	}
	
	public void insert(IntrBrd intrBrd) {
		mapper.insert(intrBrd);
	}
	
	public int boardCdMax() {
		return mapper.boardCdMax();
	}
	
	public void delete(int boardCd) {
		mapper.delete(boardCd);
	}
}
