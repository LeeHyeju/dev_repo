package com.spring.dev.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.Benner;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.service.BennerService;
import com.spring.dev.service.CmnCdService;

@Controller
@RequestMapping("/benner")
public class BennerController {
	private static final Logger logger = LoggerFactory.getLogger(BennerController.class);
	
	@Autowired
	BennerService service;
	
	@Autowired
	CmnCdService cmnCdService;
	
	// 베너 페이지 & 검색
    @RequestMapping(value = {"/benner"})
	public String list(Model model, SearchKey searchKey, Criteria cri) {
    	logger.info("BennerController benner");
    	int count = service.count(searchKey);
    	
    	// List 세팅
    	model.addAttribute("list", service.list(searchKey, cri));
    	model.addAttribute("count", count);
    	
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
    	
    	return "benner/benner.page";
    }
    
    // 베너 상세 페이지
    @RequestMapping(value = {"/benner_dtl"})
	public String dtl(Model model, String brdCd) {
    	logger.info("BennerController benner_dtl");
    	
    	// dtl 세팅
    	model.addAttribute("dtl", service.dtl(brdCd));
    	
    	return "benner/benner_dtl.page";
    }
    
    // 베너 저장
    @RequestMapping(value = {"/save"})
	public String update(Model model, Benner benner) {
    	logger.info("BennerController save");
    	service.update(benner);
    	return "redirect:/benner/benner";
    }
    
    // 베너 삭제
    @RequestMapping(value = {"/del"})
	public String delete(Model model, String brdCd) {
    	logger.info("BennerController del");
    	service.delete(brdCd);
    	return "redirect:/benner/benner";
    }
    
    // 베너 등록 페이지
    @RequestMapping(value = {"/benner_reg"})
	public String reg(Model model) {
    	logger.info("BennerController benner_reg");
    	model.addAttribute("brdKind", cmnCdService.getCmnCd("C0007"));
    	model.addAttribute("brdType", cmnCdService.getCmnCd("C0008"));
    	return "benner/benner_reg.page";
    }
    
    // 베너 등록
    @RequestMapping(value = {"/insert"})
	public String insert(Benner benner) {
    	logger.info("BennerController insert");
    	service.insert(benner);
    	return "redirect:/benner/benner";
    }
}
