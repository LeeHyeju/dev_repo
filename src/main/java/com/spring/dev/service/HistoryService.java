package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Contents;
import com.spring.dev.domain.History;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.HistoryMapper;

@Service
public class HistoryService {
	
	@Autowired
	HistoryMapper mapper;
	
	public List<History> getHistoryList(SearchCriteria cri) {
		return mapper.getHistoryList(cri);
	}
 
	public int listCount(String searchType, String keyword) {
		return mapper.listCount(searchType, keyword);
	}
	
	public History viewHistory(History history) {
		return mapper.viewHistory(history);
	}
	
	public int insertHistory(History history) {
		return mapper.insertHistory(history);
	}
}
