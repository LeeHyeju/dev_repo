package com.spring.dev.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.spring.dev.domain.PageMaker;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.AdminService;
import com.spring.dev.service.AuthService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService service;

	@Autowired
	AuthService authService;	
	
	/*타일즈 적용 시 page*/
    @RequestMapping(value = {"/list"})
	public String getList(Model model, @ModelAttribute("cri") SearchCriteria cri) {
    	logger.info("AdminController_ List");
    	
	   	int count = service.listCount(cri.getSearchType(), cri.getKeyword());
	   	
	   	model.addAttribute("list", service.getList(cri));
		model.addAttribute("count", count);
	   	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri.getSearchType(), cri.getKeyword()));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
		
		return "/admin/list.page";
	}
    
    @RequestMapping(value = {"/view"})
	public String view(HttpServletRequest request,  String admId, Model model, SearchCriteria cri) {
    	logger.info("AdminController_ view {}", service.view(admId));
    	
    	model.addAttribute("view", service.view(admId));
    	model.addAttribute("codes", authService.getAuth(cri));
    	
		return "admin/view.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.GET)
	public String insert(HttpServletRequest request, Model model,SearchCriteria cri) {
    	logger.info("AdminController_ insert");
    	model.addAttribute("codes", authService.getAuth(cri));
		return "admin/insert.page";
	}
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
	public String insertProcess(HttpServletRequest request, Admin admin, Model model) {
    	logger.info("AdminController_ insertProcess");
		service.insert(admin);
		return "redirect:/admin/list";
	}

    @RequestMapping(value = {"/update"})
	public String update(HttpServletRequest request, @ModelAttribute Admin admin,SearchCriteria cri, String admId, Model model) {
    	//비밀번호 비교
    	int result = service.checkPw(admin.getAdmId(), admin.getPw());
    	System.out.println("컨트롤러 result : "+ result);
    	if(result == 1) { //비밀번호 일치 시
    		service.update(admin);
    		return "redirect:/admin/list";	
    	} else {
    		model.addAttribute("view", service.view(admId));
        	model.addAttribute("codes", authService.getAuth(cri));

    		model.addAttribute("msg","비밀번호 불일치");
    		
    		return "admin/view.page";
    	}
	}

    @RequestMapping(value = {"/delete"}, method = RequestMethod.POST)
	public String delete(HttpServletRequest request, String admId,  Model model) {
    	service.delete(admId);
		return "redirect:/admin/list";
	}

    /*타일즈 미적용 시 part*/
    @RequestMapping(value = {"/login"})
   	public String login(Admin admin, HttpServletRequest request,  Model model) {
       	logger.info("AdminController_login");
   		return "admin/login.part";
   	}
    
    @RequestMapping(value = {"/login"}, method= RequestMethod.POST)
	public String loginProcess(Admin admin, HttpServletRequest request,  Model model) {
    	logger.info("AdminController_login");
    	HttpSession session = request.getSession();
    	Admin login = service.login(admin);
    	
    	if (login == null) {
			session.setAttribute("admin", null);
		} else {
			session.setAttribute("admin", login);
		}
		return "redirect:/admin/list";
	}
    
    @RequestMapping(value= {"/logout"})
    public String logout(HttpSession session) {
    	logger.info("AdminController_login");
        session.invalidate(); // 세션 초기화
        return "redirect:/admin/login"; 
    }
    
    @RequestMapping(value= {"/idcheck"}, method= RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String admId) {
        logger.info("아이디 체크");
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = service.idCheck(admId);
        logger.info("아이디", count);
        map.put("cnt", count);
        return map;
    }
 
}
