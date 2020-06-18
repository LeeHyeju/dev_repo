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

	public Admin view(String admId) {
		return mapper.view(admId);
	}
	
	public int insert(Admin admin) {
		return mapper.insert(admin);
	}
	
	public void update(Admin admin) {
		mapper.update(admin);
	}

	public void delete(String admId) {
		mapper.delete(admId);
	}	
	
	public Admin login(Admin admin) {
		return mapper.login(admin);
	}
	
	public int idCheck(String admId) {
		return mapper.idCheck(admId);
	}
}
