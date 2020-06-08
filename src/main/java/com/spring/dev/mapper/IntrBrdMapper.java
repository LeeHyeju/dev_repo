package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;

@Repository(value = "IntrBrdMapper")
public interface IntrBrdMapper {

	// 게시물 목록 조회
	public List<IntrBrd> getBrd(Criteria cri);
	
	// 게시물 총 갯수
	public int listCount();
	
	// 게시물 총 갯수
	public int listCount2(IntrBrd intrBrd);
	
	// 게시물 검색
	public List<IntrBrd> search(@Param("intrBrd")IntrBrd intrBrd, @Param("cri")Criteria cri);
	
	// 상세 게시물
	public IntrBrd dtl(String boardCd);
	
	// 게시물 등록
	public void insert(IntrBrd intrBrd);
	
	// boardCd Max
	public int boardCdMax();
	
	// 게시물 삭제
	public void delete(int boardCd);
}
