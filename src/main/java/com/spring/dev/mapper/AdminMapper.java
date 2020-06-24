package com.spring.dev.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Admin;

@Repository(value = "adminMapper")
public interface AdminMapper {
	
	public List<Admin> getList();
	
	public Admin view(String admId);

	public int insert(Admin admin);
	
	public void update(Admin admin);

	public void delete(String admId);

	public Admin login(Admin admin);

	public int idCheck(String admId);

}
