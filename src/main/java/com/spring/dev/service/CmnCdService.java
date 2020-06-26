package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.mapper.CmnCdMapper;

@Service
public class CmnCdService {
	@Autowired
	CmnCdMapper mapper;
	
	public List<CmnCd> list(SearchKey searchKey, Criteria cri) {
		return mapper.list(searchKey, cri);
	}
	
	public int listCount(SearchKey searchKey) {
		return mapper.listCount(searchKey);
	}

	public List<CmnCd> subList(String groCd) {
		return mapper.subList(groCd);
	}
	
	public int subCount(String groCd) {
		return mapper.subCount(groCd);
	}
	
	public void insert(CmnCd cmnCd) {
		mapper.insert(cmnCd);
	}
	
	public void update(SearchKey searchKey) {
		mapper.update(searchKey);
	}
	
	public void delete(SearchKey searchKey) {
		mapper.delete(searchKey);
	}
	
	public List<CmnCd> cdList() {
		return mapper.cdList();
	}
}