package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.PopupService;

@Controller
@RequestMapping("/popup")
public class PopupController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	PopupService service;

	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/list"})
	public String getList(Model model, @ModelAttribute("cri") SearchCriteria cri) {
    	logger.info("PopupController List");
    	
	   	int count = service.listCount(cri.getSearchType(), cri.getKeyword());
	   	
	   	model.addAttribute("list", service.getPopupList(cri));
		model.addAttribute("count", count);
	   	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri.getSearchType(), cri.getKeyword()));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
		
		return "popup/list.page";
	}
    
    @RequestMapping(value = {"/view"})
	public String view(HttpServletRequest request, int popIdx, Model model) {
    	logger.info("AuthController view");
    	model.addAttribute("view", service.popupView(popIdx));
		return "popup/view.page";
	}
    
    
}
