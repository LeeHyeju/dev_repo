package com.spring.dev.domain;

import java.util.Date;

public class Popup {
	
	private int popIdx;
	private String popTp;
	private String popNm;
	private Date StartDt; 
	private Date endDt;
	private String popState;
	private String popUrl;
	private String useYn;
	private String regId;
	private Date regDt;
	
	
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
	public String getPopState() {
		return popState;
	}
	public void setPopState(String popState) {
		this.popState = popState;
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

	@Override
	public String toString() {
		return "Popup [popIdx=" + popIdx + ", popTp=" + popTp + ", popNm=" + popNm + ", StartDt=" + StartDt + ", endDt="
				+ endDt + ", popState=" + popState + ", popUrl=" + popUrl + ", useYn=" + useYn + ", regId=" + regId
				+ ", regDt=" + regDt + "]";
	}
}
