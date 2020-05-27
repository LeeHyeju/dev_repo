package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Auth;
import com.spring.dev.mapper.AuthMapper;

@Service
public class AuthService {
	
	@Autowired
	AuthMapper mapper;
	
	public List<Auth> getAuth() {
		return mapper.getAuth();
	}

}
