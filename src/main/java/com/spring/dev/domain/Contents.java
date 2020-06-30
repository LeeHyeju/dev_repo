package com.spring.dev.domain;

import java.util.Date;

public class Contents {

	private static final long serialVersionUID = 1L;

	private int contIdx;
	private String contCd;
	private String contNm;
	private String contStyle;
	private String contScript;
	private String contents;
	private String regId;
	private Date regDt;
	
	
	public int getContIdx() {
		return contIdx;
	}
	public void setContIdx(int contIdx) {
		this.contIdx = contIdx;
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
		return "Contents [contIdx=" + contIdx + ", contCd=" + contCd + ", contNm=" + contNm + ", contStyle=" + contStyle
				+ ", contScript=" + contScript + ", contents=" + contents + ", regId=" + regId + ", regDt=" + regDt
				+ "]";
	}
}
