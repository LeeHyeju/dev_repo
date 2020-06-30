package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Contents;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.ContentsMapper;

@Service
public class ContentsService {
	
	@Autowired
	ContentsMapper mapper;

	public List<Contents> getContentsByContCd(SearchCriteria cri) {
		return mapper.getContentsByContCd(cri);
	}

	public int listCount(String searchType, String keyword) {
		return mapper.listCount(searchType, keyword);
	}
	
	public Contents viewContents(String contIdx) {
		return mapper.viewContents(contIdx);
	}
	
	public int insertContents(Contents contents) {
		return mapper.insertContents(contents);
	}

	public int contCdcheck(String contCd) {
		return mapper.contCdcheck(contCd);
	}
	
	public void contentsUpdate(Contents contents) {
		mapper.contentsUpdate(contents);
	}

	public void contentsDelete(String contIdx) {
		mapper.contentsDelete(contIdx);
	}
}
