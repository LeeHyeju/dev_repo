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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dev.domain.Contents;
import com.spring.dev.domain.History;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.ContentsService;
import com.spring.dev.service.HistoryService;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	ContentsService service;

	@Autowired
	HistoryService historyService;
	
	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/list"})
	public String getList(Model model, @ModelAttribute("cri") SearchCriteria cri) {
    	logger.info("ContentsController_ List");
    	
    	int count = service.listCount(cri.getSearchType(), cri.getKeyword());
    	
    	model.addAttribute("list", service.getContentsByContCd(cri));
		model.addAttribute("count", count);
    	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri.getSearchType(), cri.getKeyword()));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

		return "/contents/list.page"; 
	}
    
    @RequestMapping(value = {"/view"})
   	public String view(HttpServletRequest request,  int contIdx, Model model, SearchCriteria cri) {
       	logger.info("ContentsController_ view {}", service.viewContents(contIdx));
       	
       	Contents contents = service.viewContents(contIdx);
       	
       	model.addAttribute("view", contents);
       	model.addAttribute("histories", service.getHistoryList(contents.getContCd()));
       	
   		return "contents/view.page";
   	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
   	public String insert(HttpServletRequest request, Model model,SearchCriteria cri) {
       	logger.info("ContentsController_ insert");
   		return "contents/insert.page";
   	}
       
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
   	public String insertProcess(HttpServletRequest request, Contents contents, Model model) {
       	logger.info("ContentsController_ insertProcess");
   		service.insertContents(contents);
   		return "redirect:/contents/list";
   	}
    
    @RequestMapping(value= {"/contCdcheck"}, method= RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String contCd) {
        logger.info("컨텐츠 코드 체크");
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = service.contCdcheck(contCd);
        logger.info("코드 갯수", count);
        map.put("cnt", count);
        return map;
    }
    
    @RequestMapping(value = {"/update"})
   	public String update(HttpServletRequest request, @ModelAttribute Contents contents, History history, SearchCriteria cri, Model model, int contIdx) {
    	logger.info("ContentsController_ contentsUpdate");	
    	service.contentsUpdate(contents);
    	logger.info("ContentsController_ update 완료");	
    	//히스토리 insert 
    	historyService.insertHistory(history);
    	logger.info("ContentsController_ history 완료");	
       	return "redirect:/contents/list.page";
       	}
    
    @RequestMapping(value = {"/delete"})
	public String delete(HttpServletRequest request, String contIdx,  Model model) {
		logger.info("ContentsController_ contentsDelete");	
    	service.contentsDelete(contIdx);
		return "redirect:/contents/list";
	}
}
