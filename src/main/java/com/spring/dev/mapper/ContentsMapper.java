package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Contents;
import com.spring.dev.domain.SearchCriteria;

@Repository(value = "contentsMapper")
public interface ContentsMapper {
	
	public List<Contents> getContentsByContCd(@Param("cri")SearchCriteria cri);
	
	public int listCount(@Param("searchType")String searchType, @Param("keyword") String keyword);

	public Contents viewContents(String contIdx);
	
	public int insertContents(Contents contents);
	
	public int contCdcheck(String contCd);
	
	public void contentsUpdate(Contents contents);

	public void contentsDelete(String contIdx);
}
