package com.spring.dev.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
   	public String insert(HttpServletRequest request, Popup popup, Model model)  {
       	logger.info("PopupController insert");
   		return "popup/insert.page";
   	}
    /**
     * 서버에서 이미지 가져오는 법
		1. Stream 가져오는 법
		1.1 FileInputStream(new File(filePath  + / + saveFile));
		    // 파일에대한 속성지정. 이름 사이즈 타입 등
		    Response.setContent 
		    Response.write 파일 쓰기
		- 장점 : 보안에 강하다. (권한체크 가능)
		- 단점 : 서버 자원
		
		2. 파일 직접 링크
		2.1 업로드 경로와 이미지를 다운시켜줄 경로를 cmd 창에서 미러링(심볼릭링크)
		C:\dev_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\dev\resources
		(경로는 이클립스에서 생성할때 컴파일된 소스 작업 경로,, 로컬에서 서버로 업로드하면 meta에 server.core 안에 있음! )
     */
    
    @RequestMapping(value = {"/insert"}, method = RequestMethod.POST)
   	public String insertProcess(HttpServletRequest request, Popup popup, MultipartHttpServletRequest mpRequest, Model model) throws Exception  {
       	logger.info("PopupController insertProcess");
       	System.out.println("인서트"+popup.toString());
       	service.insertPopup(popup, mpRequest);
   		return "redirect:/popup/list";
   	}
       
    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
   	public String update(HttpServletRequest request, Popup popup, int popIdx, MultipartHttpServletRequest mpRequest,  Model model) throws Exception {
       	logger.info("PopupController update__img Delete__");
    	logger.info("PopupController update");
   		service.updatePopup(popup, mpRequest);
   		return "redirect:/popup/list";
   	}

    @RequestMapping(value = {"/delete"}, method = RequestMethod.POST)
   	public String delete(HttpServletRequest request, int popIdx,  Model model) {
       	logger.info("PopupController delete");
       	service.deletePopup(popIdx);
   		return "redirect:/popup/list";
   	}
    
    @RequestMapping(value = {"/winPop"})
	public String winPop(HttpServletRequest request, int popIdx, Model model) {
    	logger.info("PopupController winPop");
    	model.addAttribute("winPop", service.winPop(popIdx));
		return "popup/win_popup.part";
	}
}
