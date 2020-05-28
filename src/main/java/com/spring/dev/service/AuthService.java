package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Auth;
import com.spring.dev.mapper.AuthMapper;

@Service
public class AuthService {
	
	@Autowired
	AuthMapper mapper;
	
	public List<Auth> getAuth() {
		return mapper.getAuth();
	}
	public Auth view(String authCd) {
		return mapper.view(authCd);
	}
	
	public int insert(Auth auth) {
		return mapper.insert(auth);
	}
	
	public String update(Auth auth) {
		return mapper.update(auth);
	}

	public int delete(String authCd) {
		return mapper.delete(authCd);
	}	
	
}
