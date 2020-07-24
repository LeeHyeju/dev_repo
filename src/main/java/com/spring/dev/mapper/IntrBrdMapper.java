package com.spring.dev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.Intr;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.IntrGal;
import com.spring.dev.domain.SearchKey;

@Repository(value = "IntrBrdMapper")
public interface IntrBrdMapper {
	// 생성관리자 List 조회
	public List<Intr> list(@Param("searchKey")SearchKey searchKey, @Param("cri")Criteria cri);
	
	// 생성관리자 List 개수
	public int mngmListCount(SearchKey searchKey);
	
	// 생성관리자 상세 페이지
	public Intr dtlBrd(String brdCd);
	
	// 생성관리자 등록
	public void insertBrd(Intr intr);
	
	// 생성관리자 업데이트
	public void brdUpdate(Intr intr);
	
	// 생성관리자 삭제
	public void brdDelete(int brdCd);
	
	// 게시물 List 조회
	public List<IntrBrd> postList(@Param("searchKey")SearchKey searchKey, @Param("cri")Criteria cri);
	
	// 게시물 List 개수
	public int postListCount(SearchKey searchKey);
	
	// 공지&필독 게시물 List 조회
	public List<IntrBrd> notiList();
	
	// 게시물 조회수
	public void brdHit(@Param("tblNm")String tblNm, @Param("brdCd")String brdCd, @Param("hit")int hit);
	
	// 상세 게시물
	public IntrBrd dtl(String brdCd);
	
	// 게시물 등록
	public void insert(IntrBrd intrBrd);
	
	// 게시물 업데이트
	public void update(IntrBrd intrBrd);

	// 게시물 삭제
	public void delete(String brdCd);
	
	// brdCd Max
	public int brdCdMax(@Param("tblNm")String tblNm);
	
	// 게시물 유형 List 조회
	public List<IntrBrd> getBrdTypeBrd();
	
	// FAQ List 조회
	public List<IntrFaq> listFaq(@Param("cri")Criteria cri, @Param("srch")String srch);
	
	// FAQ top10 조회
	public List<IntrFaq> top10(Criteria cri);
	
	// FAQ List 개수
	public int listCount(@Param("tblNm")String tblNm, @Param("srch")String srch);
	
	// FAQ 업데이트
	public void faqUpdate(IntrFaq intrFaq);
	
	// FAQ 삭제
	public void faqDelete(int brdCd);
	
	// FAQ 상세 페이지
	public IntrFaq faqDtl(String brdCd);

	// 게시물 유형 List 조회
	public List<IntrFaq> getBrdTypeFaq();
	
	// FAQ 등록
	public void faqInsert(IntrFaq intrFaq);
	
	// 갤러리 List 조회
	public List<IntrGal> listGal(@Param("cri")Criteria cri, @Param("srch")String srch);
	
	// 갤러리 상세 페이지
	public IntrGal galDtl(String brdCd);
	
	// 갤러리 업데이트
	public void updateGal(IntrGal intrGal);
	
	// 갤러리 삭제
	public void deleteGal(int brdCd);
	
	// 갤러리 유형 List 조회
	public List<IntrGal> getBrdTypeGal();
	
	// 갤러리 등록
	public void galInsert(IntrGal intrGal);
	
	// 이전글 가져오기
	public IntrGal getPriBrdTl(@Param("tblNm")String tblNm, @Param("brdCd")String brdCd);
	
	// 다음글 가져오기
	public IntrGal getNextBrdTl(@Param("tblNm")String tblNm, @Param("brdCd")String brdCd);
	
	// 파일 등록
	public void insertFile(Map<String, Object> map) throws Exception;
}
