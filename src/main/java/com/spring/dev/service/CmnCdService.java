package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.mapper.CmnCdMapper;

@Service
public class CmnCdService {
	@Autowired
	CmnCdMapper mapper;
	
	public List<CmnCd> getCmnCd(Criteria cri) {
		return mapper.getCmnCd(cri);
	}
	
	public int insert(CmnCd cmnCd) {
		return mapper.insert(cmnCd);
	}
	
	public int listCount() {
		return mapper.listCount();
	}
}