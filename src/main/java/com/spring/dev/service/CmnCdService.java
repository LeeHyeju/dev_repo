package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.CmnCdMapper;

@Service
public class CmnCdService {
	@Autowired
	CmnCdMapper mapper;
	
	public List<CmnCd> getCmnCd(SearchCriteria scri) {
		return mapper.getCmnCd(scri);
	}
	
	public int listCount() {
		return mapper.listCount();
	}
	
	public int listCount2(CmnCd cmnCd) {
		return mapper.listCount2(cmnCd);
	}

	public int insert(CmnCd cmnCd) {
		return mapper.insert(cmnCd);
	}
	
	public List<CmnCd> search(CmnCd cmnCd, Criteria cri) {
		return mapper.search(cmnCd, cri);
	}
	
	public List<CmnCd> click(String groCd, Criteria cri) {
		return mapper.click(groCd, cri);
	}
}