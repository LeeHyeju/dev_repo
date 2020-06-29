package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchCriteria;

@Repository(value = "adminMapper")
public interface AdminMapper {
	
	public List<Admin> getList(@Param("cri")SearchCriteria cri);
	
	public Admin view(String admId);

	public int insert(Admin admin);
	
	public void update(Admin admin);

	public void delete(String admId);

	public Admin login(Admin admin);

	public int idCheck(String admId);
	
	public int listCount(@Param("searchType")String searchType, @Param("keyword") String keyword);
	
	public int checkPw(@Param("admId")String admId, @Param("pw")String pw);

}
