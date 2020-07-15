package com.spring.dev.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.CustOpn;

@Repository(value = "CustOpnMapper")
public interface CustOpnMapper {

	// 고객문의 List 조회
	public List<CustOpn> list(@Param("custOpn")CustOpn custOpn, @Param("cri")Criteria cri);
	
	// 고객문의 List 개수
	public int listCount(CustOpn custOpn);
	
	// 고객문의 상세 조회
	public CustOpn dtl(String regNo);
	
	// 고객문의 업데이트
	public void update(CustOpn custOpn);
	
	// 고객문의 삭제
	public void delete(String regNo);

	// 고객문의 접수번호 max 조회
	public String regNoMax();
	
	// 고객문의 등록
	public void insert(CustOpn custOpn);
}
