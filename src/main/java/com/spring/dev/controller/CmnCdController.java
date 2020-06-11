package com.spring.dev.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.CmnCdService;

@Controller
@RequestMapping("/cmnCd")
public class CmnCdController {
	private static final Logger logger = LoggerFactory.getLogger(CmnCdController.class);
	
	@Autowired
	CmnCdService service;
	
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
	public String insert(HttpServletRequest request, CmnCd cmnCd, Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");
    	logger.info("CmnCdController insert");
		return "cmnCd/insert.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
	public String insertProcess(HttpServletRequest request, CmnCd cmnCd, Model model) throws UnsupportedEncodingException {
    	logger.info("CmnCdController insert");
    	service.insert(cmnCd);
    	return "redirect:/cmnCd/cmn_cd";
	}
    
    @RequestMapping(value = {"/editSave"}, method = RequestMethod.GET)
   	public String editSave(HttpServletRequest request, CmnCd cmnCd, Model model) throws UnsupportedEncodingException {
       	logger.info("CmnCdController editSave");
       	service.update(cmnCd);
       	return "redirect:/cmnCd/cmn_cd";
   	}
       
	@RequestMapping(value = "/cmn_cd", method = RequestMethod.GET)
	public String list(Model model, SearchCriteria scri, CmnCd cmnCd) throws Exception{
		logger.info("list>>>{}", service.getCmnCd(cmnCd, scri));
		model.addAttribute("list", service.getCmnCd(cmnCd, scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("count", service.listCount());
		model.addAttribute("subCount", 0);
		model.addAttribute("pageMaker", pageMaker);
		return "cmnCd/cmn_cd.page";
	}
	
    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
	public String search(HttpServletRequest request, CmnCd cmnCd, Model model, SearchCriteria scri, Criteria cri) {
    	logger.info("CmnCdController search");
    	model.addAttribute("list", service.search(cmnCd, cri));
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount2(cmnCd));
		model.addAttribute("count", service.listCount2(cmnCd));
		model.addAttribute("subCount", 0);
		model.addAttribute("pageMaker", pageMaker);
		return "cmnCd/cmn_cd.page";
	}
    
    @RequestMapping(value = {"/click"}, method = RequestMethod.GET)
	public String click(HttpServletRequest request, CmnCd cmnCd, Model model, SearchCriteria scri, Criteria cri) {
    	logger.info("CmnCdController click {}",scri);
    	model.addAttribute("subList", service.click(cmnCd.getGroCd(), cri));
		model.addAttribute("subCount", service.listCount2(cmnCd));
		model.addAttribute("list", service.getCmnCd(cmnCd, scri));
		
		String srchKey = cmnCd.getSrchKey();
		logger.info("srchKey>>>>> {}", srchKey);
		if(!srchKey.equals("")) {
			String[] keyArray = srchKey.split(",");
			if(keyArray.length != 1 || keyArray.length != 0) {
				cmnCd.setGroCd(keyArray[0]);
				cmnCd.setGroNm(keyArray[1]);
				cmnCd.setCmnCd(keyArray[2]);
				cmnCd.setCmnNm(keyArray[3]);
				cmnCd.setUseYn(keyArray[4]);
			}
			model.addAttribute("list", service.getCmnCd(cmnCd, scri));
			model.addAttribute("count", service.listCount2(cmnCd));
		} else {
			cmnCd.setGroCd("");
			cmnCd.setUseYn("");
			model.addAttribute("list", service.getCmnCd(cmnCd, scri));
			model.addAttribute("count", service.listCount());
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount2(cmnCd));
		model.addAttribute("pageMaker", pageMaker);
    	
		return "cmnCd/cmn_cd.page";
	}
}
