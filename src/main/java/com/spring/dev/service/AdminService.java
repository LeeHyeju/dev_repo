package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Admin;
import com.spring.dev.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper mapper;
	
	public List<Admin> getList() {
		return mapper.getList();
	}



}
