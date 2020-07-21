package com.spring.dev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Benner;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.SearchKey;

@Repository(value = "BennerMapper")
public interface BennerMapper {
	// 베너 List 조회
	public List<Benner> list(@Param("searchKey")SearchKey searchKey, @Param("cri")Criteria cri);
	
	// 베너 List 개수
	public int count(SearchKey searchKey);
	
	// 베너 상세 조회
	public Benner dtl(String brdCd);
	
	// 베너 저장
	public void update(Benner benner);
	
	// 베너 삭제
	public void delete(String brdCd);
	
	// 등록
	public void insert(Benner benner);
}
