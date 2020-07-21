package com.spring.dev.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.Intr;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.IntrFaq;
import com.spring.dev.domain.IntrGal;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.service.AdminService;
import com.spring.dev.service.CmnCdService;
import com.spring.dev.service.IntrBrdService;

@Controller
@RequestMapping("/intrBrd")
public class IntrBrdController {
	private static final Logger logger = LoggerFactory.getLogger(IntrBrdController.class);
	
	@Autowired
	IntrBrdService service;
	
	@Autowired
	AdminService adminService;	
	
	@Autowired
	CmnCdService cmnCdService;	
	
	/**************************** 공 통 게 시 판 ************************************************/
	// 공통 게시판 페이지 & 검색
    @RequestMapping(value = {"/intr_brd"})
	public String listBrd(Model model, SearchKey searchKey, Criteria cri) {
    	logger.info("IntrBrdController intr_brd");
    	int count = service.mngmListCount(searchKey);

    	// List 세팅
    	model.addAttribute("list", service.list(searchKey, cri));
    	model.addAttribute("count", count);
		
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		
		return "intrBrd/intr_brd.page";
	}
    
    // 공통 게시판 상세 페이지
    @RequestMapping(value = {"/intr_brd_dtl"})
	public String dtlBrd(Model model, String brdCd) {
    	logger.info("IntrBrdController intr_brd_dtl");
    	
    	// 유형 세팅
    	Intr dtl = service.dtlBrd(brdCd);
    	
    	// 공통코드 세팅
    	String cmnCd = "C0002";
    	List<CmnCd> cmnCdList = cmnCdService.getCmnCd(cmnCd);
    	model.addAttribute("cmnCd", cmnCdList);

    	// dtl 세팅
    	model.addAttribute("dtl", dtl);
    	
		return "intrBrd/intr_brd_dtl.page";
	}
    
    // 공통 게시판 저장
    @RequestMapping(value = {"/brdSave"})
    public String brdUpdate(Intr intr) {
    	logger.info("IntrBrdController brdSave");
    	service.brdUpdate(intr);
    	return "redirect:/intrBrd/intr_brd";
    }
    
    // 공통 게시판 삭제
    @RequestMapping(value = {"/brdDel"})
   	public String brdDelete(int brdCd) {
       	logger.info("IntrBrdController brdDel");
       	service.brdDelete(brdCd);
   		return "redirect:/intrBrd/intr_brd";
   	}
    
    // 공통 게시판 등록 페이지
    @RequestMapping(value = {"/intr_brd_reg"})
	public String regBrd(Model model) {
    	logger.info("IntrBrdController intr_brd_reg");
    	
    	// 공통코드 세팅
    	String cmnCd = "C0002";
    	model.addAttribute("type", cmnCdService.getCmnCd(cmnCd));
    	
		return "intrBrd/intr_brd_reg.page";
	}
	
	// 공통 게시판 등록
    @RequestMapping(value = {"/insertBrd"})
    public String insertBrd(Intr intr) {
    	logger.info("IntrBrdController insertBrd");
    	String tblNm = "tb_brd_manage";
    	intr.setBrdCd(service.brdCdMax(tblNm)+1);
    	
    	service.insertBrd(intr);
    	
    	return "redirect:/intrBrd/intr_brd";
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
    	
    	// 유형 세팅
    	IntrBrd dtl = service.dtl(brdCd);
    	List<IntrBrd> type = service.getBrdTypeBrd();
    	type.remove(dtl.getBrdType()-1);
    	model.addAttribute("type", type);

    	// dtl 세팅
    	model.addAttribute("dtl", dtl);
    	
    	// authCd 가져오기
    	model.addAttribute("authCd", adminService.selectAuthCd(regId));
    	
    	// 이전글 다음글 가져오기
    	model.addAttribute("pri", service.getPriBrdTl(tblNm, brdCd));
    	model.addAttribute("next", service.getNextBrdTl(tblNm, brdCd));
    	
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
    	
    	// 공통코드 세팅
    	model.addAttribute("type", cmnCdService.getCmnCd("C0010"));
    	
    	return "intrBrd/intr_brd_noti_reg.page";
    }

    // 게시판 등록
    @RequestMapping(value = {"/insert"})
    public String insertNoti(IntrBrd intrBrd) {
    	logger.info("IntrBrdController insert");
    	
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
    
    // FAQ 상세 페이지
    @RequestMapping(value = {"/intr_brd_faq_dtl"})
    public String dtlFaq(Model model, String brdCd, int hit) {
    	logger.info("IntrBrdController intr_brd_faq_dtl");
    	String tblNm = "tb_brd_faq";
    	
    	// 조회수 증가
    	service.brdHit(tblNm, brdCd, hit);
    	
    	// 공통코드 세팅
    	String cmnCd = "C0003";
    	List<CmnCd> cmnCdList = cmnCdService.getCmnCd(cmnCd);
    	model.addAttribute("cmnCd", cmnCdList);
    	
    	// dtl 세팅
    	IntrFaq dtl = service.faqDtl(brdCd);
    	model.addAttribute("dtl", dtl);
    	
    	// 이전글 다음글 가져오기
    	model.addAttribute("pri", service.getPriBrdTl(tblNm, brdCd));
    	model.addAttribute("next", service.getNextBrdTl(tblNm, brdCd));
    	
    	return "intrBrd/intr_brd_faq_dtl.page";
    }
    
    // FAQ 등록 페이지
    @RequestMapping(value = {"/intr_brd_faq_reg"})
    public String regFaq(Model model) {
    	logger.info("IntrBrdController intr_brd_faq_reg");
    	// 공통코드 세팅
    	String cmnCd = "C0003";
    	model.addAttribute("cmnCd", cmnCdService.getCmnCd(cmnCd));
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
    
    // FAQ 등록
    @RequestMapping(value = {"/faqInsert"})
	public String insertFaq(Model model, IntrFaq intrFaq) {
    	logger.info("IntrBrdController faqInsert");
    	String tblNm = "tb_brd_faq";
    	intrFaq.setBrdCd(service.brdCdMax(tblNm)+1);
    	
    	service.faqInsert(intrFaq);
		return "redirect:/intrBrd/intr_brd_faq";
	}
    
    /**************************** 공 통 게 시 판 (Gallery) *******************************************/
    // 갤러리 페이지 (List 셋팅)
    @RequestMapping(value = {"/intr_brd_gal"})
	public String listGal(Model model, String srch, Criteria cri) {
    	logger.info("IntrBrdController intr_brd_gal");
    	String tblNm = "tb_brd_gal";
    	int count = service.listCount(tblNm, srch);
    	
    	model.addAttribute("list", service.listGal(cri, srch));
    	model.addAttribute("count", count);
    	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		
		return "intrBrd/intr_brd_gal.page";
	}
    
    // 갤러리 상세 페이지
    @RequestMapping(value = {"/intr_brd_gal_dtl"})
    public String dtlGal(Model model, String brdCd, int hit) {
    	logger.info("IntrBrdController intr_brd_gal_dtl");
    	String tblNm = "tb_brd_gal";
    	
    	// 조회수 증가
    	service.brdHit(tblNm, brdCd, hit);

    	// 유형 세팅
    	IntrGal dtl = service.galDtl(brdCd);
    	List<IntrGal> type = service.getBrdTypeGal();
    	type.remove(dtl.getBrdType()-1);
    	model.addAttribute("type", type);
    	
    	// dtl 세팅
    	model.addAttribute("dtl", dtl);
    	
    	// 이전글 다음글 가져오기
    	model.addAttribute("pri", service.getPriBrdTl(tblNm, brdCd));
    	model.addAttribute("next", service.getNextBrdTl(tblNm, brdCd));
    	
    	return "intrBrd/intr_brd_gal_dtl.page";
    }
    
    // 갤러리 저장
    @RequestMapping(value = {"/galSave"})
    public String updateGal(IntrGal intrGal) {
    	logger.info("IntrBrdController galSave");
    	service.updateGal(intrGal);
    	return "redirect:/intrBrd/intr_brd_gal";
    }
    
    // 갤러리 삭제
    @RequestMapping(value = {"/galDel"})
   	public String deleteGal(int brdCd) {
       	logger.info("IntrBrdController galDel");
       	service.deleteGal(brdCd);
   		return "redirect:/intrBrd/intr_brd_gal";
   	}
    
    // 갤러리 등록 페이지
    @RequestMapping(value = {"/intr_brd_gal_reg"})
	public String regGal() {
    	logger.info("IntrBrdController intr_brd_gal_reg");
		return "intrBrd/intr_brd_gal_reg.page";
	}
    
    // 갤러리 등록
    @RequestMapping(value = {"/galInsert"})
	public String insertGal(Model model, IntrGal intrGal) {
    	logger.info("IntrBrdController galInsert");
    	String tblNm = "tb_brd_gal";
    	intrGal.setBrdCd(service.brdCdMax(tblNm)+1);
    	
    	service.galInsert(intrGal);
		return "redirect:/intrBrd/intr_brd_gal";
	}
}
