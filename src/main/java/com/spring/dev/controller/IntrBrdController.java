package com.spring.dev.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.service.AdminService;
import com.spring.dev.service.IntrBrdService;

@Controller
@RequestMapping("/intrBrd")
public class IntrBrdController {
	private static final Logger logger = LoggerFactory.getLogger(CmnCdController.class);
	
	@Autowired
	IntrBrdService service;
	
	@Autowired
	AdminService adminService;	
	
	/**************************** 공 통 게 시 판 ************************************************/
	// 공통 게시판 페이지
    @RequestMapping(value = {"/intr_brd"})
	public String listBrd() {
    	logger.info("IntrBrdController intr_brd");
		return "intrBrd/intr_brd.page";
	}

    /**************************** 공 통 게 시 판 (공지) *******************************************/
    // 게시판 페이지 & 검색 (List 세팅)
    @RequestMapping(value = {"/intr_brd_noti"})
	public String listNoti(Model model, SearchKey searchKey, Criteria cri) {
    	logger.info("IntrBrdController intr_brd_noti");
    	int count = service.postListCount(searchKey);

    	// List 세팅
    	model.addAttribute("postList", service.postList(searchKey, cri));
    	model.addAttribute("postListCount", count);
    	model.addAttribute("notiList", service.notiList());
    	model.addAttribute("notiChk", searchKey.isNotiChk());
    	model.addAttribute("perPageNum", cri.getPerPageNum());
		
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		
		return "intrBrd/intr_brd_noti.page";
	}
	
    // 게시판 상세 페이지
    @RequestMapping(value = {"/intr_brd_noti_dtl"})
    public String dtlNoti(Model model, String brdCd, int hit, String regId) {
    	logger.info("IntrBrdController intr_brd_noti_dtl");
    	String tblNm = "tb_intr_brd_noti";
    	
    	// 조회수 증가
    	service.brdHit(tblNm, brdCd, hit);
    	
    	// dtl 세팅
    	IntrBrd dtl = service.dtl(brdCd);
    	List<IntrBrd> type = service.getBrdType();
    	type.remove(dtl.getBrdType()-1);
    	model.addAttribute("dtl", dtl);
    	model.addAttribute("type", type);
    	
    	// authCd 가져오기
    	model.addAttribute("authCd", adminService.selectAuthCd(regId));
    	
    	return "intrBrd/intr_brd_noti_dtl.page";
    }
    
    // 게시판 저장
    @RequestMapping(value = {"/save"})
    public String updateNoti(IntrBrd intrBrd) {
    	logger.info("IntrBrdController save");
    	service.update(intrBrd);
    	return "redirect:/intrBrd/intr_brd_noti";
    }
    
    // 게시판 삭제
    @RequestMapping(value = {"/del"})
   	public String deleteNoti(String brdCd) {
       	logger.info("IntrBrdController del");
       	service.delete(brdCd);
   		return "redirect:/intrBrd/intr_brd_noti";
   	}
    
    // 게시판 등록 페이지
    @RequestMapping(value = {"/intr_brd_noti_reg"})
    public String regNoti(Model model, String regId) {
    	logger.info("IntrBrdController intr_brd_noti_reg");
    	
    	// authCd 가져오기
    	model.addAttribute("authCd", adminService.selectAuthCd(regId));
    	
    	return "intrBrd/intr_brd_noti_reg.page";
    }

    // 게시판 등록
    @RequestMapping(value = {"/insert"})
    public String insertNoti(IntrBrd intrBrd) {
    	logger.info("IntrBrdController insert>>>>>>>>{}",intrBrd);
    	
    	String tblNm = "tb_intr_brd_noti";
    	intrBrd.setBrdCd(service.brdCdMax(tblNm)+1);
    	
    	service.insert(intrBrd);
    	return "redirect:/intrBrd/intr_brd_noti";
    }
	
    /**************************** 공 통 게 시 판 (FAQ) *******************************************/
    // FAQ 페이지 & 검색 (List 세팅)
    @RequestMapping(value = {"/intr_brd_faq"})
	public String listFaq(Model model, String srch, Criteria cri) {
    	logger.info("IntrBrdController intr_brd_faq");
    	String tblNm = "tb_brd_faq";
    	int count = service.listCount(tblNm, srch);
    	
    	model.addAttribute("faqList", service.listFaq(cri, srch));
    	model.addAttribute("top10List", service.top10(cri));
    	model.addAttribute("count", count);
    	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		
		return "intrBrd/intr_brd_faq.page";
	}
    
    // FAQ 등록 페이지
    @RequestMapping(value = {"/intr_brd_faq_reg"})
    public String regFaq() {
    	logger.info("IntrBrdController intr_brd_faq_reg");
    	return "intrBrd/intr_brd_faq_reg.page";
    }
    
    // FAQ 저장
    @RequestMapping(value = {"/faqSave"})
    public String updateFaq(IntrFaq intrFaq) {
    	logger.info("IntrBrdController faqSave");
    	service.faqUpdate(intrFaq);
    	return "redirect:/intrBrd/intr_brd_faq";
    }
    
    // FAQ 삭제
    @RequestMapping(value = {"/faqDel"})
   	public String deleteFaq(int brdCd) {
       	logger.info("IntrBrdController faqDel");
       	service.faqDelete(brdCd);
   		return "redirect:/intrBrd/intr_brd_faq";
   	}
    
    // FAQ 상세 페이지
    @RequestMapping(value = {"/intr_brd_faq_dtl"})
    public String dtlFaq(Model model, String brdCd, int hit) {
    	logger.info("IntrBrdController intr_brd_faq_dtl");
    	String tblNm = "tb_brd_faq";
    	
    	// 조회수 증가
    	service.brdHit(tblNm, brdCd, hit);
    	model.addAttribute("dtl", service.faqDtl(brdCd));
    	
    	return "intrBrd/intr_brd_faq_dtl.page";
    }
    
    // FAQ 등록
    @RequestMapping(value = {"/faqInsert"})
	public String insertFaq(Model model, IntrFaq intrFaq) {
    	logger.info("IntrBrdController intr_brd_brd_insert");
    	String tblNm = "tb_brd_faq";
    	intrFaq.setBrdCd(service.brdCdMax(tblNm)+1);
    	
    	service.faqInsert(intrFaq);
		return "redirect:/intrBrd/intr_brd_faq";
	}
    
    /**************************** 공 통 게 시 판 (Gallery) *******************************************/
    // 갤러리 페이지
    @RequestMapping(value = {"/intr_brd_gal"})
	public String listGal() {
    	logger.info("IntrBrdController intr_brd_gal");
		return "intrBrd/intr_brd_gal.page";
	}
}
