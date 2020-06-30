package com.spring.dev.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 공통코드 편집
	@RequestMapping(value = {"/editSave"}, method = RequestMethod.GET)
	public String editSave(SearchKey searchKey) {
		logger.info("CmnCdController editSave");
		service.update(searchKey);
		return "redirect:/cmnCd/cmn_cd";
	}
	
	// 공통코드 삭제
	@RequestMapping(value = {"/del"}, method = RequestMethod.GET)
	public String del(SearchKey searchKey) {
		logger.info("CmnCdController del");
		service.delete(searchKey);
		return "redirect:/cmnCd/cmn_cd";
	}
	
	// 공통코드 등록 페이지
    @RequestMapping(value = {"/reg"}, method = RequestMethod.GET)
	public String reg(Model model) {
    	logger.info("CmnCdController reg");
    	model.addAttribute("list", service.cdList());
		return "cmnCd/reg.page";
	}
    
    // 공통코드 등록
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
	public String insertProcess(CmnCd cmnCd) {
    	logger.info("CmnCdController insert");
    	service.insert(cmnCd);
    	return "redirect:/cmnCd/cmn_cd";
	}
    
    // 코드 중복확인
    @RequestMapping(value= {"/cdChk"}, method= RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> cdChk(@RequestBody String cd) {
        logger.info("CmnCdController cdChk");
        int count = 0;
        String[] code = cd.split(",");
        count = service.cdChk(code[0], code[1]);
        
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("count", count);
        map.put("listCount", service.subCount(code[0])+1);
        return map;
    }
    
    // 그룹코드 선택 팝업 & 그룹코드 검색
    @RequestMapping(value = {"/codePopup"}, method = RequestMethod.GET)
	public String codePopup(Model model, SearchKey searchKey, Criteria cri) {
    	logger.info("CmnCdController codePopup");
    	int count = service.listCount(searchKey);
    	
    	// List 세팅
		model.addAttribute("list", service.list(searchKey, cri));
		model.addAttribute("count", count);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		
		return "cmnCd/codePopup.part";
	}
}
