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
	
	public List<IntrBrd> search(String srch, Criteria cri) {
		return mapper.search(srch, cri);
	}
}
