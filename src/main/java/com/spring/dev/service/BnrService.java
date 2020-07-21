package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Bnr;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.mapper.BnrMapper;

@Service
public class BnrService {
	@Autowired
	BnrMapper mapper;
	
	// 베너
	public List<Bnr> list(SearchKey searchKey, Criteria cri) {
		return mapper.list(searchKey, cri);
	}
	
	public int count(SearchKey searchKey) {
		return mapper.count(searchKey);
	}
	
	public Bnr dtl(String brdCd) {
		return mapper.dtl(brdCd);
	}
	
	public void update(Bnr benner) {
		mapper.update(benner);
	}
	
	public void delete(String brdCd) {
		mapper.delete(brdCd);
	}
	
	public void insert(Bnr benner) {
		mapper.insert(benner);
	}
}
