package com.spring.dev.domain;

import java.util.Date;

public class IntrFaq {
	private int brdCd;
	private String brdType;
	private String brdTl;
	private String brdCont;
	private String regId;
	private Date regDt;
	private String useYn;
	
	public int getBrdCd() {
		return brdCd;
	}
	public void setBrdCd(int brdCd) {
		this.brdCd = brdCd;
	}
	public String getBrdType() {
		return brdType;
	}
	public void setBrdType(String brdType) {
		this.brdType = brdType;
	}
	public String getBrdTl() {
		return brdTl;
	}
	public void setBrdTl(String brdTl) {
		this.brdTl = brdTl;
	}
	public String getBrdCont() {
		return brdCont;
	}
	public void setBrdCont(String brdCont) {
		this.brdCont = brdCont;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	@Override
	public String toString() {
		return "IntrFaq [brdCd=" + brdCd + ", brdType=" + brdType + ", brdTl=" + brdTl + ", brdCont=" + brdCont
				+ ", regId=" + regId + ", regDt=" + regDt + ", useYn=" + useYn + "]";
	}
}
