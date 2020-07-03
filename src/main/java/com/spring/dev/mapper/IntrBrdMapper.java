package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.SearchKey;

@Repository(value = "IntrBrdMapper")
public interface IntrBrdMapper {
	// 게시물 List 조회
	public List<IntrBrd> postList(@Param("searchKey")SearchKey searchKey, @Param("cri")Criteria cri);
	
	// 게시물 List 개수
	public int postListCount(SearchKey searchKey);
	
	// 공지&필독 게시물 List 조회
	public List<IntrBrd> notiList();
	
	// 게시물 조회수
	public void brdHit(@Param("tblNm")String tblNm, @Param("brdCd")String brdCd, @Param("hit")int hit);
	
	
	
	
	
	// 게시물 List top10 조회
	public List<IntrBrd> top10(Criteria cri);
	
	// 게시물 목록 조회
	public List<IntrFaq> getFaq(Criteria cri);
	
	// 게시물 총 갯수
	public int listCount2(IntrBrd intrBrd);
	
	// 게시물 총 갯수
	public int listCount3();

	// 게시물 검색
	public List<IntrBrd> search(@Param("intrBrd")IntrBrd intrBrd, @Param("cri")Criteria cri);
	
	// 상세 게시물
	public IntrBrd dtl(String boardCd);
	
	// 상세 게시물
	public IntrFaq dtl2(String brdCd);
	
	// 게시물 등록
	public void insert(IntrBrd intrBrd);
	
	// boardCd Max
	public int boardCdMax();
	
	// 게시물 등록
	public void insert2(IntrFaq intrFaq);
	
	// boardCd Max
	public int brdCdMax();
	
	// 게시물 삭제
	public void delete(int boardCd);
	
	// 게시물 업데이트
	public void update(IntrBrd intrBrd);
	
	// 게시물 삭제
	public void delete2(int brdCd);
	
	// 게시물 업데이트
	public void update2(IntrFaq intrFaq);
	
	// 게시물 조회수
	public void boardHit(@Param("brdCd")String brdCd, @Param("hit")int hit);
}
