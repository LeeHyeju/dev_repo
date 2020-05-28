package com.spring.dev.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Auth;

@Repository(value = "authMapper")
public interface AuthMapper {

	public List<Auth> getAuth();
	
	public Auth view(String authCd);

	public int insert(Auth auth);
	
	public String update(Auth auth);
	
	public int delete(String authCd);

}
