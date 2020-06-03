package com.spring.dev.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;

@Repository(value = "CmnCdMapper")
public interface CmnCdMapper {
	// 게시물 목록 조회
	public List<CmnCd> getCmnCd(Criteria cri);
	
	// 게시물 등록
	public int insert(CmnCd cmnCd);
	
	// 게시물 총 갯수
	public int listCount();
}
