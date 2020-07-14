package com.spring.dev.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Popup extends ModelObject {
	
	private static final long serialVersionUID = 1L;
	
	private int popIdx;
	private String popTp;
	private String popNm;
	private String popTxt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date StartDt; 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDt;
	private String popUrl;
	private String useYn;
	private int popHeight;
	private int popWidth;
	private int popX;
	private int popY;
	private String popTarget;
	private String regId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDt;
	private String saveFile;
	private String filePath;
	
	public int getPopIdx() {
		return popIdx;
	}
	public void setPopIdx(int popIdx) {
		this.popIdx = popIdx;
	}
	public String getPopTp() {
		return popTp;
	}
	public void setPopTp(String popTp) {
		this.popTp = popTp;
	}
	public String getPopNm() {
		return popNm;
	}
	public void setPopNm(String popNm) {
		this.popNm = popNm;
	}
	public String getPopTxt() {
		return popTxt;
	}
	public void setPopTxt(String popTxt) {
		this.popTxt = popTxt;
	}
	public Date getStartDt() {
		return StartDt;
	}
	public void setStartDt(Date startDt) {
		StartDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public String getPopUrl() {
		return popUrl;
	}
	public void setPopUrl(String popUrl) {
		this.popUrl = popUrl;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public int getPopHeight() {
		return popHeight;
	}
	public void setPopHeight(int popHeight) {
		this.popHeight = popHeight;
	}
	public int getPopWidth() {
		return popWidth;
	}
	public void setPopWidth(int popWidth) {
		this.popWidth = popWidth;
	}
	public int getPopX() {
		return popX;
	}
	public void setPopX(int popX) {
		this.popX = popX;
	}
	public int getPopY() {
		return popY;
	}
	public void setPopY(int popY) {
		this.popY = popY;
	}
	public String getPopTarget() {
		return popTarget;
	}
	public void setPopTarget(String popTarget) {
		this.popTarget = popTarget;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
