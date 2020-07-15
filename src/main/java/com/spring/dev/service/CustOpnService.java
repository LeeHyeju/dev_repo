package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.CustOpn;
import com.spring.dev.mapper.CustOpnMapper;

@Service
public class CustOpnService {
	@Autowired
	CustOpnMapper mapper;
	
	// 고객문의
	public List<CustOpn> list(CustOpn custOpn, Criteria cri) {
		return mapper.list(custOpn, cri);
	}
	
	public int listCount(CustOpn custOpn) {
		return mapper.listCount(custOpn);
	}

	public CustOpn dtl(String regNo) {
		return mapper.dtl(regNo);
	}
	
	public void update(CustOpn custOpn) {
		mapper.update(custOpn);
	}
	
	public void delete(String regNo) {
		mapper.delete(regNo);
	}
	
	public String regNoMax() {
		return mapper.regNoMax();
	}
	
	public void insert(CustOpn custOpn) {
		mapper.insert(custOpn);
	}
}
