package com.spring.dev.domain;

import java.util.Date;

public class CustOpn {
	private String regNo;
	private String brdType;
	private String brdTl;
	private String brdCont;
	private String emadr;
	private String tel;
	private String stsCd;
	private String mbrYn;
	private String regChnl;
	private String regNm;
	private String regId;
	private Date regDt;
	private String mngmNm;
	private Date mngmDt;
	private String replCont;
	
	private String rNum;
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
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
	public String getEmadr() {
		return emadr;
	}
	public void setEmadr(String emadr) {
		this.emadr = emadr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getStsCd() {
		return stsCd;
	}
	public void setStsCd(String stsCd) {
		this.stsCd = stsCd;
	}
	public String getMbrYn() {
		return mbrYn;
	}
	public void setMbrYn(String mbrYn) {
		this.mbrYn = mbrYn;
	}
	public String getRegChnl() {
		return regChnl;
	}
	public void setRegChnl(String regChnl) {
		this.regChnl = regChnl;
	}
	public String getRegNm() {
		return regNm;
	}
	public void setRegNm(String regNm) {
		this.regNm = regNm;
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
	public String getMngmNm() {
		return mngmNm;
	}
	public void setMngmNm(String mngmNm) {
		this.mngmNm = mngmNm;
	}
	public Date getMngmDt() {
		return mngmDt;
	}
	public void setMngmDt(Date mngmDt) {
		this.mngmDt = mngmDt;
	}
	public String getReplCont() {
		return replCont;
	}
	public void setReplCont(String replCont) {
		this.replCont = replCont;
	}
	@Override
	public String toString() {
		return "CustOpn [regNo=" + regNo + ", brdType=" + brdType + ", brdTl=" + brdTl + ", brdCont=" + brdCont
				+ ", emadr=" + emadr + ", tel=" + tel + ", stsCd=" + stsCd + ", mbrYn=" + mbrYn + ", regChnl=" + regChnl
				+ ", regNm=" + regNm + ", regId=" + regId + ", regDt=" + regDt + ", mngmNm=" + mngmNm + ", mngmDt="
				+ mngmDt + ", replCont=" + replCont + ", rNum=" + rNum + "]";
	}
}
