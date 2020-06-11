package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;

@Repository(value = "CmnCdMapper")
public interface CmnCdMapper {
	// 게시물 목록 조회
	public List<CmnCd> getCmnCd(@Param("cmnCd")CmnCd cmnCd, @Param("cri")Criteria cri);
	
	// 게시물 등록
	public int insert(CmnCd cmnCd);
	
	// 게시물 총 갯수
	public int listCount();
	
	// 게시물 총 갯수
	public int listCount2(CmnCd cmnCd);
	
	// 게시물 검색
	public List<CmnCd> search(@Param("cmnCd")CmnCd cmnCd, @Param("cri")Criteria cri);
	
	// 게시물 행 선택
	public List<CmnCd> click(@Param("groCd")String groCd, @Param("cri")Criteria cri);
	
	// 게시물 편집
	public void update(CmnCd cmnCd);
}
