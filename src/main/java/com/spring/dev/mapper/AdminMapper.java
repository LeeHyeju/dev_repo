package com.spring.dev.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Admin;

@Repository(value = "adminMapper")
public interface AdminMapper {
	
	public List<Admin> getList();

}
