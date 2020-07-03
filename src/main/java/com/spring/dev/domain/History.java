package com.spring.dev.domain;

import java.sql.Date;

public class History {

	private static final long serialVersionUID = 1L;
	
	private int historyIdx;
	private String contCd;
	private String contNm;
	private String contStyle;
	private String contScript;
	private String contents;
	private int historyVer;
	private String regId;
	private Date regDt;
	
	
	public int getHistoryIdx() {
		return historyIdx;
	}
	public void setHistoryIdx(int historyIdx) {
		this.historyIdx = historyIdx;
	}
	public String getContCd() {
		return contCd;
	}
	public void setContCd(String contCd) {
		this.contCd = contCd;
	}
	public String getContNm() {
		return contNm;
	}
	public void setContNm(String contNm) {
		this.contNm = contNm;
	}
	public String getContStyle() {
		return contStyle;
	}
	public void setContStyle(String contStyle) {
		this.contStyle = contStyle;
	}
	public String getContScript() {
		return contScript;
	}
	public void setContScript(String contScript) {
		this.contScript = contScript;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHistoryVer() {
		return historyVer;
	}
	public void setHistoryVer(int historyVer) {
		this.historyVer = historyVer;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "History [historyIdx=" + historyIdx + ", contCd=" + contCd + ", contNm=" + contNm + ", contStyle="
				+ contStyle + ", contScript=" + contScript + ", contents=" + contents + ", historyVer=" + historyVer
				+ ", regId=" + regId + ", regDt=" + regDt + "]";
	}
}
