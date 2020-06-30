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

import com.spring.dev.domain.Admin;
import com.spring.dev.domain.Contents;
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.ContentsService;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	ContentsService service;
	
	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/list"})
	public ModelAndView getList(@ModelAttribute("cri") SearchCriteria cri) {
    	logger.info("ContentsController_ List");
    	
    	ModelAndView mav = new ModelAndView();
    	
    	PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri.getSearchType(), cri.getKeyword()));
		
		List<Contents> list = service.getContentsByContCd(cri);
	   	int count = service.listCount(cri.getSearchType(), cri.getKeyword());

	   	Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		map.put("page", cri.getPage());
		
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("map", map);
		mav.setViewName("/contents/list.page"); //tiles 레이아웃 적용
		return mav;
	}
    
    @RequestMapping(value = {"/view"})
   	public String view(HttpServletRequest request,  String contIdx, Model model, SearchCriteria cri) {
       	logger.info("ContentsController_ view {}", service.viewContents(contIdx));
       	
       	model.addAttribute("view", service.viewContents(contIdx));
       	
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
   	public String update(HttpServletRequest request, @ModelAttribute Contents contents,SearchCriteria cri, Model model) {
    	logger.info("ContentsController_ contentsUpdate");	
    	service.contentsUpdate(contents);
       		
       		return "redirect:/contents/list.page";
       	}
    
    @RequestMapping(value = {"/delete"})
	public String delete(HttpServletRequest request, String contIdx,  Model model) {
		logger.info("ContentsController_ contentsDelete");	
    	service.contentsDelete(contIdx);
		return "redirect:/contents/list";
	}
}
