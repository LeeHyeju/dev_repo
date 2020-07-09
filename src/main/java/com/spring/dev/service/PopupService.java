package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dev.domain.Popup;
import com.spring.dev.domain.SearchCriteria;
import com.spring.dev.mapper.PopupMapper;

@Service
public class PopupService {
	
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
	
	public int insertPopup(Popup popup) {
		return mapper.insertPopup(popup);
	}
	
	public void updatePopup(Popup popup) {
		mapper.updatePopup(popup);
	}

	public void deletePopup(int popIdx) {
		mapper.deletePopup(popIdx);
	}

}
