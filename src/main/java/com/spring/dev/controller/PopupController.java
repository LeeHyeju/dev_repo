package com.spring.dev.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.Popup;
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
    	logger.info("PopupController view");
    	model.addAttribute("view", service.popupView(popIdx));
		return "popup/view.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
   	public String insert(HttpServletRequest request, Popup popup, Model model) throws UnsupportedEncodingException {
       	logger.info("PopupController insert");
   		return "popup/insert.page";
   	}
       
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
   	public String insertProcess(HttpServletRequest request, Popup popup, Model model) throws UnsupportedEncodingException {
       	logger.info("PopupController insertProcess");
       	System.out.println("인서트"+popup.toString());
       	service.insertPopup(popup);
   		return "redirect:/popup/list";
   	}
       
    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
   	public String update(HttpServletRequest request, Popup popup,  Model model) {
       	logger.info("PopupController update");
   		service.updatePopup(popup);
   		return "redirect:/popup/list";
   	}

    @RequestMapping(value = {"/delete"}, method = RequestMethod.POST)
   	public String delete(HttpServletRequest request, int popIdx,  Model model) {
       	logger.info("PopupController delete");
       	service.deletePopup(popIdx);
   		return "redirect:/popup/list";
   	}
    
}
