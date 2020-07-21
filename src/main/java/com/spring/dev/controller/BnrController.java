package com.spring.dev.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.Bnr;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.service.BnrService;
import com.spring.dev.service.CmnCdService;

@Controller
@RequestMapping("/bnr")
public class BnrController {
	private static final Logger logger = LoggerFactory.getLogger(BnrController.class);
	
	@Autowired
	BnrService service;
	
	@Autowired
	CmnCdService cmnCdService;
	
	// 베너 페이지 & 검색
    @RequestMapping(value = {"/bnr"})
	public String list(Model model, SearchKey searchKey, Criteria cri) {
    	logger.info("bnrController bnr");
    	int count = service.count(searchKey);
    	
    	// List 세팅
    	model.addAttribute("list", service.list(searchKey, cri));
    	model.addAttribute("count", count);
    	
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
    	
    	return "bnr/bnr.page";
    }
    
    // 베너 상세 페이지
    @RequestMapping(value = {"/bnr_dtl"})
	public String dtl(Model model, String brdCd) {
    	logger.info("bnrController bnr_dtl");
    	
    	// dtl 세팅
    	model.addAttribute("dtl", service.dtl(brdCd));
    	
    	return "bnr/bnr_dtl.page";
    }
    
    // 베너 저장
    @RequestMapping(value = {"/save"})
	public String update(Model model, Bnr bnr) {
    	logger.info("bnrController save");
    	service.update(bnr);
    	return "redirect:/bnr/bnr";
    }
    
    // 베너 삭제
    @RequestMapping(value = {"/del"})
	public String delete(Model model, String brdCd) {
    	logger.info("bnrController del");
    	service.delete(brdCd);
    	return "redirect:/bnr/bnr";
    }
    
    // 베너 등록 페이지
    @RequestMapping(value = {"/bnr_reg"})
	public String reg(Model model) {
    	logger.info("bnrController bnr_reg");
    	model.addAttribute("brdKind", cmnCdService.getCmnCd("C0007"));
    	model.addAttribute("brdType", cmnCdService.getCmnCd("C0008"));
    	return "bnr/bnr_reg.page";
    }
    
    // 베너 등록
    @RequestMapping(value = {"/insert"})
	public String insert(Bnr bnr) {
    	logger.info("bnrController insert");
    	service.insert(bnr);
    	return "redirect:/bnr/bnr";
    }
}
