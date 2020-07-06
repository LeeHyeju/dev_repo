package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dev.domain.History;
import com.spring.dev.service.HistoryService;

@Controller
@RequestMapping("/history")
public class HistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	HistoryService service;
	
    @RequestMapping(value = {"/historyPopup"})
   	public String view(HttpServletRequest request, History history, Model model) {
       	logger.info("히스토리 {}", history);
       	
   		model.addAttribute("view",service.viewHistory(history));
   		
   		return "/history/historyPopup.part";
   	}
	
}
