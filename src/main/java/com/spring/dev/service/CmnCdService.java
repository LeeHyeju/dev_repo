package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.CmnCd;
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
	
	public int listCount2() {
		return mapper.listCount2();
	}

	public int insert(CmnCd cmnCd) {
		return mapper.insert(cmnCd);
	}
	
	public List<CmnCd> search(CmnCd cmnCd) {
		return mapper.search(cmnCd);
	}
}