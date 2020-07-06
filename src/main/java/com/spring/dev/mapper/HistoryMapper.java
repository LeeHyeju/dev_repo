package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.History;
import com.spring.dev.domain.SearchCriteria;

@Repository(value = "HistoryMapper")
public interface HistoryMapper {
	
	public List<History> getHistoryList(@Param("cri")SearchCriteria cri);
	
	public int listCount(@Param("searchType")String searchType, @Param("keyword") String keyword);

	public History viewHistory(History history);
	
	public int insertHistory(History history);
}
