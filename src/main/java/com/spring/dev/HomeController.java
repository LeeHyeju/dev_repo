package com.spring.dev;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dev.domain.Popup;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.service.PopupService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	PopupService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri) {
		logger.info("home");
		List<Popup> popups = service.getMainPopup();
		
		logger.info("home {}", popups);
		model.addAttribute("mainPopup", popups);
		return "home.page";
	}
	
	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	public String memo(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri) {
		logger.info("memo");
		//테스트용 커밋
		return "memo.part";
	}
}
