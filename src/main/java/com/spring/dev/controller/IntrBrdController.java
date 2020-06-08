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
	public String search(HttpServletRequest request, Model model, IntrBrd intrBrd, SearchCriteria scri, Criteria cri) {
		logger.info("IntrBrdController search");
    	model.addAttribute("list", service.search(intrBrd, cri));
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount2(intrBrd));
		model.addAttribute("count", service.listCount2(intrBrd));
		model.addAttribute("pageMaker", pageMaker);
		return "intrBrd/intr_brd_brd.page";
	}
    
    @RequestMapping(value = {"/intr_brd_brd_dtl"})
	public String view(HttpServletRequest request, String boardCd, Model model) {
    	logger.info("IntrBrdController intr_brd_brd_dtl");
    	model.addAttribute("dtl", service.dtl(boardCd));
		return "intrBrd/intr_brd_brd_dtl.page";
	}
    
    @RequestMapping(value = {"/intr_brd_brd_reg"})
	public String reg(HttpServletRequest request, Model model, IntrBrd intrBrd) {
    	logger.info("IntrBrdController intr_brd_brd_reg");
		return "intrBrd/intr_brd_brd_reg.page";
	}
    
    @RequestMapping(value = {"/intr_brd_brd_insert"})
	public String insert(HttpServletRequest request, Model model, IntrBrd intrBrd) {
    	logger.info("IntrBrdController intr_brd_brd_insert");
    	intrBrd.setBoardCd(service.boardCdMax()+1);
    	service.insert(intrBrd);
		return "redirect:/intrBrd/intr_brd_brd";
	}
    
    @RequestMapping(value = {"/intr_brd_brd_del"})
   	public String delete(HttpServletRequest request, Model model, int boardCd) {
       	logger.info("IntrBrdController intr_brd_brd_del");
       	service.delete(boardCd);
   		return "redirect:/intrBrd/intr_brd_brd";
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
