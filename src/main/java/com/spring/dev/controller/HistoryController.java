package com.spring.dev.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dev.domain.History;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.HistoryService;

@Controller
@RequestMapping("/history")
public class HistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	HistoryService service;
	
	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/historyPopup"})
	public ModelAndView getList(@ModelAttribute("cri") SearchCriteria cri) {
    	logger.info("HistoryController_ List");
    	
    	ModelAndView mav = new ModelAndView();
    	
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri.getSearchType(), cri.getKeyword()));
		
		List<History> list = service.getHistoryList(cri);
		int count = service.listCount(cri.getSearchType(), cri.getKeyword());
	   	Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		map.put("page", cri.getPage());
		
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("map", map);
		mav.setViewName("/history/historyPopup.part"); //tiles 레이아웃 적용
		return mav;
	}
    
    @RequestMapping(value = {"/view"})
   	public String view(HttpServletRequest request, History history, Model model) {
       	logger.info("dddddddddddddddddddd {}", history);
       	
   		model.addAttribute("view",service.viewHistory(history));
   		
   		return "/history/view.part";
   	}
	
}
