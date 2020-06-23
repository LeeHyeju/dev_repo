package com.spring.dev.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchKey;
import com.spring.dev.service.CmnCdService;

@Controller
@RequestMapping("/cmnCd")
public class CmnCdController {
	private static final Logger logger = LoggerFactory.getLogger(CmnCdController.class);
	
	@Autowired
	CmnCdService service;
	
	/*타일즈 적용 시 page*/
	
	// 공통코드 관리 페이지 & 검색 (List 세팅)
	@RequestMapping(value = {"/cmn_cd"}, method = RequestMethod.GET)
	public String list(Model model, SearchKey searchKey, Criteria cri) {
		logger.info("CmnCdController cmn_cd");
		int count = service.listCount(searchKey);
		
		// List 세팅
		model.addAttribute("list", service.list(searchKey, cri));
		model.addAttribute("count", count);
		model.addAttribute("subCount", 0);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		
		return "cmnCd/cmn_cd.page";
	}
	
	// 그룹코드 선택 (subList 세팅)
	@RequestMapping(value = {"/click"}, method = RequestMethod.GET)
	public String subList(Model model, CmnCd cmnCd, Criteria cri, SearchKey searchKey) {
		logger.info("CmnCdController click");
		int count = service.listCount(searchKey);
		
		// subList 세팅
		model.addAttribute("subList", service.subList(cmnCd.getGroCd()));
		model.addAttribute("subCount", service.subCount(cmnCd.getGroCd()));
		
		// List 세팅
		model.addAttribute("list", service.list(searchKey, cri));
		model.addAttribute("count", count);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		
		return "cmnCd/cmn_cd.page";
	}
	
	// 공통코드 등록 페이지
    @RequestMapping(value = {"/reg"}, method = RequestMethod.GET)
	public String reg() {
    	logger.info("CmnCdController reg");
		return "cmnCd/reg.page";
	}
    
    // 공통코드 등록
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
	public String insertProcess(CmnCd cmnCd) {
    	logger.info("CmnCdController insert");
    	service.insert(cmnCd);
    	return "redirect:/cmnCd/cmn_cd";
	}
    
    // 공통코드 편집
    @RequestMapping(value = {"/editSave"}, method = RequestMethod.GET)
   	public String editSave(SearchKey searchKey) {
       	logger.info("CmnCdController editSave");
       	service.update(searchKey);
       	return "redirect:/cmnCd/cmn_cd";
   	}
}
