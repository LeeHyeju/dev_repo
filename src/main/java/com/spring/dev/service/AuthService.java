package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Auth;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.AuthMapper;

@Service
public class AuthService {
	
	@Autowired
	AuthMapper mapper;
	
	public List<Auth> getAuth(SearchCriteria cri) {
		return mapper.getAuth(cri);
	}
	public Auth view(String authCd) {
		return mapper.view(authCd);
	}
	
	public int insert(Auth auth) {
		return mapper.insert(auth);
	}
	
	public void update(Auth auth) {
		mapper.update(auth);
	}

	public void delete(String authCd) {
		mapper.delete(authCd);
	}	
	
	public int listCount(String searchType, String keyword) {
		return mapper.listCount(searchType, keyword);
	}
}
