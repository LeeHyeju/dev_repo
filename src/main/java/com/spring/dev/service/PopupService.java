package com.spring.dev.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.dev.common.FileUtils;
import com.spring.dev.domain.Popup;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.PopupMapper;

@Service
public class PopupService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	PopupMapper mapper;
	
	public List<Popup> getPopupList(SearchCriteria cri) {
		return mapper.getPopupList(cri);
	}
	
	public int listCount(String searchType, String keyword) {
		return mapper.listCount(searchType, keyword);
	}
	
	public Popup popupView(int popIdx) {
		return mapper.popupView(popIdx);
	}
	
	public void insertPopup( Popup popup, MultipartHttpServletRequest mpRequest) throws Exception {
		mapper.insertPopup(popup);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(popup, "tb_popup", "팝업테이블", mpRequest); 
		for(int i=0, size = list.size(); i<size; i++){ 
			mapper.insertFile(list.get(i)); 
		}
	}
	
	public void updatePopup(Popup popup) {
		mapper.updatePopup(popup);
	}

	public void deletePopup(int popIdx) {
		mapper.deletePopup(popIdx);
	}
	
	public List<Popup> getMainPopup() {
		return mapper.getMainPopup();
	}
	
	public Popup winPop(int popIdx) {
		return mapper.winPop(popIdx);
	}
	
}
