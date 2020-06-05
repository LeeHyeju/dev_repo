package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.IntrBrdService;

@Controller
@RequestMapping("/intrBrd")
public class IntrBrdController {
	private static final Logger logger = LoggerFactory.getLogger(CmnCdController.class);
	
	@Autowired
	IntrBrdService service;
	
    @RequestMapping(value = {"/info"})
	public String getInfo(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController list");
		return "intrBrd/info.page";
	}
    
    @RequestMapping(value = {"/intr_brd_brd"})
	public String getBrd(HttpServletRequest request,  Model model, SearchCriteria scri) {
    	logger.info("IntrBrdController getBrd");
    	model.addAttribute("list", service.getBrd(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("count", service.listCount());
		model.addAttribute("pageMaker", pageMaker);
		return "intrBrd/intr_brd_brd.page";
	}
	
	@RequestMapping(value = {"/intr_brd_brd_search"})
	public String search(HttpServletRequest request, Model model, SearchCriteria scri, Criteria cri) {
//		logger.info("IntrBrdController search");
//    	model.addAttribute("list", service.search(srch, cri));
//    	PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(scri);
//		pageMaker.setTotalCount(service.listCount2(srch));
//		model.addAttribute("count", service.listCount2(srch));
//		model.addAttribute("pageMaker", pageMaker);
		return "intrBrd/intr_brd_brd.page";
	}
    
    @RequestMapping(value = {"/intr_brd_brd_dtl"})
	public String getBrdDtl(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController getBrdDtl");
		return "intrBrd/intr_brd_brd_dtl.page";
	}
    
    @RequestMapping(value = {"/intr_brd_qna"})
	public String getQna(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController getQna");
		return "intrBrd/intr_brd_qna.page";
	}
    
    @RequestMapping(value = {"/intr_brd_gal"})
	public String getGal(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController getGal");
		return "intrBrd/intr_brd_gal.page";
	}
}
