package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Benner;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.mapper.BennerMapper;

@Service
public class BennerService {
	@Autowired
	BennerMapper mapper;
	
	// 베너
	public List<Benner> list(SearchKey searchKey, Criteria cri) {
		return mapper.list(searchKey, cri);
	}
	
	public int count(SearchKey searchKey) {
		return mapper.count(searchKey);
	}
	
	public Benner dtl(String brdCd) {
		return mapper.dtl(brdCd);
	}
	
	public void update(Benner benner) {
		mapper.update(benner);
	}
	
	public void delete(String brdCd) {
		mapper.delete(brdCd);
	}
	
	public void insert(Benner benner) {
		mapper.insert(benner);
	}
}
