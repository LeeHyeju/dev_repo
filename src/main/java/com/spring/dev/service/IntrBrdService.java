package com.spring.dev.service;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.dev.common.FileUtils;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.Intr;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.IntrGal;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.mapper.IntrBrdMapper;

@Service
public class IntrBrdService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	IntrBrdMapper mapper;
	
	// 생성관리자
	public List<Intr> list(SearchKey searchKey, Criteria cri) {
		return mapper.list(searchKey, cri);
	}
	
	public int mngmListCount(SearchKey searchKey) {
		return mapper.mngmListCount(searchKey);
	}
	
	public Intr dtlBrd(String brdCd) {
		return mapper.dtlBrd(brdCd);
	}
	
	public void insertBrd(Intr intr) {
		mapper.insertBrd(intr);
	}
	
	public void brdUpdate(Intr intr) {
		mapper.brdUpdate(intr);
	}
	
	public void brdDelete(int brdCd) {
		mapper.brdDelete(brdCd);
	}
	
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

	public List<IntrBrd> getBrdTypeBrd() {
		return mapper.getBrdTypeBrd();
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
	
	public List<IntrFaq> getBrdTypeFaq() {
		return mapper.getBrdTypeFaq();
	}
	
	public void faqInsert(IntrFaq intrFaq) {
		mapper.faqInsert(intrFaq);
	}
	
	// 갤러리
	public List<IntrGal> listGal(Criteria cri, String srch) {
		return mapper.listGal(cri, srch);
	}
	
	public IntrGal galDtl(String brdCd) {
		return mapper.galDtl(brdCd);
	}
	
	public void updateGal(IntrGal intrGal) {
		mapper.updateGal(intrGal);
	}
	
	public void deleteGal(int brdCd) {
		mapper.deleteGal(brdCd);
	}
	
	public List<IntrGal> getBrdTypeGal() {
		return mapper.getBrdTypeGal();
	}
	
	public void galInsert(IntrGal intrGal) {
		mapper.galInsert(intrGal);
	}
	
	public IntrGal getPriBrdTl(String tblNm, String brdCd) {
		return mapper.getPriBrdTl(tblNm, brdCd);
	}
	
	public IntrGal getNextBrdTl(String tblNm, String brdCd) {
		return mapper.getNextBrdTl(tblNm, brdCd);
	}
	
	public void insertGal(IntrGal intrGal, MultipartHttpServletRequest mpRequest) throws Exception {
		mapper.galInsert(intrGal);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(intrGal, "tb_brd_gal", "갤러리테이블", mpRequest); 
		for(int i=0, size = list.size(); i<size; i++){ 
			mapper.insertFile(list.get(i)); 
		}
	}
}
