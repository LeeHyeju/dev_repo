package com.spring.dev.domain;

import java.util.Date;

public class Benner {
	private String brdCd;
	private String brdType;
	private String brdKind;
	private String brdTl;
	private String brdCont;
	private String brdExpl;
	private String useYn;
	private String img;
	private String link;
	private String regId;
	private Date regDt;
	
	private String rNum;
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	
	public String getBrdCd() {
		return brdCd;
	}
	public void setBrdCd(String brdCd) {
		this.brdCd = brdCd;
	}
	public String getBrdType() {
		return brdType;
	}
	public void setBrdType(String brdType) {
		this.brdType = brdType;
	}
	public String getBrdKind() {
		return brdKind;
	}
	public void setBrdKind(String brdKind) {
		this.brdKind = brdKind;
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
	public String getBrdExpl() {
		return brdExpl;
	}
	public void setBrdExpl(String brdExpl) {
		this.brdExpl = brdExpl;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
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
		return "Benner [brdCd=" + brdCd + ", brdType=" + brdType + ", brdKind=" + brdKind + ", brdTl=" + brdTl
				+ ", brdCont=" + brdCont + ", brdExpl=" + brdExpl + ", useYn=" + useYn + ", img=" + img + ", link="
				+ link + ", regId=" + regId + ", regDt=" + regDt + ", rNum=" + rNum + "]";
	}
}
