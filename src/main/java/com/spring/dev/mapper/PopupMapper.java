package com.spring.dev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.dev.domain.Popup;
import com.spring.dev.domain.SearchCriteria;

@Repository(value = "PopupMapper")
public interface PopupMapper {
	
	public List<Popup> getPopupList(@Param("cri")SearchCriteria cri);

	public int listCount(@Param("searchType")String searchType, @Param("keyword") String keyword);
	
	public Popup popupView(int popIdx);
	
	public int insertPopup(Popup popup);
	
	public int updatePopup(Popup popup);
	
	public int deletePopup(int popIdx);
	
	public List<Popup> getMainPopup();
	
	public void insertFile(Map<String, Object> map) throws Exception;

	public Popup winPop(int popIdx);
	
	public int deleteImg(int popIdx);
}
