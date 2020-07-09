package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.mapper.IntrBrdMapper;

@Service
public class IntrBrdService {
	@Autowired
	IntrBrdMapper mapper;
	
	// 게시판
	public List<IntrBrd> postList(SearchKey searchKey, Criteria cri) {
		return mapper.postList(searchKey, cri);
	}
	
	public int postListCount(SearchKey searchKey) {
		return mapper.postListCount(searchKey);
	}
	
	public List<IntrBrd> notiList() {
		return mapper.notiList();
	}
	
	public void brdHit(String tblNm, String brdCd, int hit) {
		mapper.brdHit(tblNm, brdCd, hit);
	}
	
	public IntrBrd dtl(String brdCd) {
		return mapper.dtl(brdCd);
	}
	
	public void insert(IntrBrd intrBrd) {
		mapper.insert(intrBrd);
	}
	
	public void update(IntrBrd intrBrd) {
		mapper.update(intrBrd);
	}
	
	public void delete(String brdCd) {
		mapper.delete(brdCd);
	}
	
	public int brdCdMax(String tblNm) {
		return mapper.brdCdMax(tblNm);
	}

	public List<IntrBrd> getBrdType() {
		return mapper.getBrdType();
	}
	
	// FAQ
	public List<IntrFaq> listFaq(Criteria cri, String srch) {
		return mapper.listFaq(cri, srch);
	}

	public List<IntrFaq> top10(Criteria cri) {
		return mapper.top10(cri);
	}
	
	public int listCount(String tblNm, String srch) {
		return mapper.listCount(tblNm, srch);
	}
	
	public void faqUpdate(IntrFaq intrFaq) {
		mapper.faqUpdate(intrFaq);
	}
	
	public void faqDelete(int brdCd) {
		mapper.faqDelete(brdCd);
	}
	
	public IntrFaq faqDtl(String brdCd) {
		return mapper.faqDtl(brdCd);
	}
	
	public void faqInsert(IntrFaq intrFaq) {
		mapper.faqInsert(intrFaq);
	}
}
