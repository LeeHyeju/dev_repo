package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.IntrBrdService;

@Controller
@RequestMapping("/intrBrd")
public class IntrBrdController {
	private static final Logger logger = LoggerFactory.getLogger(CmnCdController.class);
	
	@Autowired
	IntrBrdService service;
	
	/**************************** 공 통 게 시 판 ************************************************/
    @RequestMapping(value = {"/info"})
	public String getInfo(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController list");
		return "intrBrd/info.page";
	}
    /**************************** 공 통 게 시 판 (공지)*******************************************/
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
    
    @RequestMapping(value = {"/intr_brd_brd_save"})
   	public String update(HttpServletRequest request, Model model, IntrBrd intrBrd) {
       	logger.info("IntrBrdController intr_brd_brd_save");
       	service.update(intrBrd);
   		return "redirect:/intrBrd/intr_brd_brd";
   	}
    /**************************** 공 통 게 시 판 (FAQ)*******************************************/
    @RequestMapping(value = {"/intr_brd_faq"})
	public String getFaq(HttpServletRequest request,  Model model, SearchCriteria scri) {
    	logger.info("IntrBrdController getFaq");
    	model.addAttribute("list", service.getFaq(scri));
    	
    	model.addAttribute("list1", service.top10(scri));
    	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount3());
		model.addAttribute("count", service.listCount3());
		model.addAttribute("pageMaker", pageMaker);
		return "intrBrd/intr_brd_faq.page";
	}
    
    @RequestMapping(value = {"/intr_brd_faq_reg"})
	public String reg(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController intr_brd_faq_reg");
		return "intrBrd/intr_brd_faq_reg.page";
	}
    
    @RequestMapping(value = {"/intr_brd_faq_insert"})
	public String insert2(HttpServletRequest request, Model model, IntrFaq intrFaq) {
    	logger.info("IntrBrdController intr_brd_brd_insert");
    	intrFaq.setBrdCd(service.brdCdMax()+1);
    	service.insert2(intrFaq);
		return "redirect:/intrBrd/intr_brd_faq";
	}
    
    @RequestMapping(value = {"/intr_brd_faq_dtl"})
	public String view2(HttpServletRequest request, String brdCd, Model model, int hit) {
    	logger.info("IntrBrdController intr_brd_faq_dtl");
    	model.addAttribute("dtl", service.dtl2(brdCd, hit));
		return "intrBrd/intr_brd_faq_dtl.page";
	}
    
    @RequestMapping(value = {"/intr_brd_faq_del"})
   	public String delete2(HttpServletRequest request, Model model, int brdCd) {
       	logger.info("IntrBrdController intr_brd_faq_del");
       	service.delete2(brdCd);
   		return "redirect:/intrBrd/intr_brd_faq";
   	}
    
    @RequestMapping(value = {"/intr_brd_faq_save"})
   	public String update2(HttpServletRequest request, Model model, IntrFaq intrFaq) {
       	logger.info("IntrBrdController intr_brd_faq_save");
       	service.update2(intrFaq);
   		return "redirect:/intrBrd/intr_brd_faq";
   	}
    /**************************** 공 통 게 시 판 (Gallery)*******************************************/
    @RequestMapping(value = {"/intr_brd_gal"})
	public String getGal(HttpServletRequest request,  Model model) {
    	logger.info("IntrBrdController getGal");
		return "intrBrd/intr_brd_gal.page";
	}
}
