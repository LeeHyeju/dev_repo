package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Auth;
import com.spring.dev.domain.SearchCriteria;

@Repository(value = "authMapper")
public interface AuthMapper {

	public List<Auth> getAuth(@Param("cri")SearchCriteria cri);
	
	public Auth view(String authCd);

	public int insert(Auth auth);
	
	public void update(Auth auth);
	
	public void delete(String authCd);
	
	public int listCount(@Param("searchType")String searchType, @Param("keyword") String keyword);


}
