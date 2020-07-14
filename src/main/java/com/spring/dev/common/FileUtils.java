package com.spring.dev.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.dev.domain.Popup;

@Component("fileUtils")	
public class FileUtils {
private static final String filePath = "C:\\eclipse\\dev\\upload"; // 파일이 저장될 위치

public List<Map<String, Object>> parseInsertFileInfo(Popup popup, 
		MultipartHttpServletRequest mpRequest) throws Exception{	
	return parseInsertFileInfo(popup, null, null, mpRequest);
}
	public List<Map<String, Object>> parseInsertFileInfo(Popup popup, String tblCd, String tblNm,
			MultipartHttpServletRequest mpRequest) throws Exception{
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String orgnFile = null;
		String fileExp = null;
		String saveFile = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int tblIdx = popup.getPopIdx();
		
		File file = new File(filePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(!multipartFile.isEmpty()) {
				orgnFile = multipartFile.getOriginalFilename();
				fileExp = orgnFile.substring(orgnFile.lastIndexOf("."));
				saveFile = getRandomString() + fileExp;
				
				file = new File(filePath + File.separator + saveFile);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("tblIdx", tblIdx);
				listMap.put("orgnFile", orgnFile);
				listMap.put("saveFile", saveFile);
				listMap.put("fileSize", multipartFile.getSize());
				listMap.put("tblCd", tblCd);
				listMap.put("tblNm", tblNm);
				listMap.put("fileExp", fileExp);
				listMap.put("filePath", filePath);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
