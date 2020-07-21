package com.spring.dev.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.CmnCd;
import com.spring.dev.domain.Criteria;
import com.spring.dev.domain.CustOpn;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.service.CmnCdService;
import com.spring.dev.service.CustOpnService;

@Controller
@RequestMapping("/custOpn")
public class CustOpnController {
	private static final Logger logger = LoggerFactory.getLogger(CustOpnController.class);
	
	@Autowired
	CustOpnService service;
	
	@Autowired
	CmnCdService cmnCdService;
	
	// 고객문의 페이지 & 검색
    @RequestMapping(value = {"/cust_opn"})
	public String list(Model model, CustOpn custOpn, Criteria cri) {
    	logger.info("CustOpnController cust_opn");
    	if(custOpn.getEndDt() == "") {
    		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
    		Date date = new Date();
    		String time = format.format(date);
    		
    		custOpn.setEndDt(time);
    		logger.info("CustOpnController time");
    	}
    	int count = service.listCount(custOpn);
    	
    	model.addAttribute("list", service.list(custOpn, cri));
    	model.addAttribute("count", count);
    	
    	// 공통코드 세팅
    	model.addAttribute("type", cmnCdService.getCmnCd("C0001"));
    	model.addAttribute("chnl", cmnCdService.getCmnCd("C0004"));
    	model.addAttribute("stsCd", cmnCdService.getCmnCd("C0005"));
    	model.addAttribute("mngm", cmnCdService.getCmnCd("C0006"));
    	
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("pageMaker", pageMaker);
    	
    	return "custOpn/cust_opn.page";
    }
    
    // 고객문의 상세 페이지
    @RequestMapping(value = {"/cust_opn_dtl"})
	public String dtl(Model model, String regNo) {
    	logger.info("CustOpnController cust_opn_dtl");
    	model.addAttribute("dtl", service.dtl(regNo));
    	return "custOpn/cust_opn_dtl.page";
    }
    
    // 고객문의 상세 저장
    @RequestMapping(value = {"/save"})
	public String save(CustOpn custOpn) {
    	logger.info("CustOpnController save>>>{}",custOpn);
    	service.update(custOpn);
    	return "redirect:/custOpn/cust_opn";
    }
    
    // 고객문의 상세 삭제
    @RequestMapping(value = {"/del"})
	public String del(String regNo) {
    	logger.info("CustOpnController del");
    	service.delete(regNo);
    	return "redirect:/custOpn/cust_opn";
    }
     
    // 고객문의 등록 페이지
    @RequestMapping(value = {"/cust_opn_reg"})
	public String reg(Model model) {
    	logger.info("CustOpnController cust_opn_reg");
    	model.addAttribute("type", cmnCdService.getCmnCd("C0001"));
    	model.addAttribute("email", cmnCdService.getCmnCd("C0009"));
    	return "custOpn/cust_opn_reg.page";
    }
    
    // 고객문의 등록
    @RequestMapping(value = {"/insert"})
	public String insert(CustOpn custOpn) {
    	logger.info("CustOpnController insert");
    	
    	// 접수번호 넣기
    	custOpn.setRegNo(service.regNoMax());
    	service.insert(custOpn);
    	
    	return "redirect:/custOpn/cust_opn";
    }
}
