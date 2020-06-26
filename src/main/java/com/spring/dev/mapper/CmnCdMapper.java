package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchKey;

@Repository(value = "CmnCdMapper")
public interface CmnCdMapper {
	// 게시물 List 조회
	public List<CmnCd> list(@Param("searchKey")SearchKey searchKey, @Param("cri")Criteria cri);
	
	// 게시물 List 개수
	public int listCount(SearchKey searchKey);
	
	// 선택 게시물 subList 조회
	public List<CmnCd> subList(@Param("groCd")String groCd);
	
	// 선택 게시물 subList 개수
	public int subCount(@Param("groCd")String groCd);
	
	// 게시물 등록
	public void insert(CmnCd cmnCd);

	// 게시물 편집
	public void update(SearchKey searchKey);
	
	// 게시물 삭제
	public void delete(SearchKey searchKey);
	
	// 게시물 cdList 조회
	public List<CmnCd> cdList();
}
