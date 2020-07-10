package com.spring.dev.domain;

import java.util.Date;

public class IntrGal {
	private int brdCd;
	private int brdType;
	private String brdTypeNm;
	private String brdTl;
	private String brdCont;
	private String regId;
	private Date regDt;
	private String useYn;
	private int hit;
	private String img;
	
	private String rNum;
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	
	public int getBrdCd() {
		return brdCd;
	}
	public void setBrdCd(int brdCd) {
		this.brdCd = brdCd;
	}
	public int getBrdType() {
		return brdType;
	}
	public void setBrdType(int brdType) {
		this.brdType = brdType;
	}
	public String getBrdTypeNm() {
		return brdTypeNm;
	}
	public void setBrdTypeNm(String brdTypeNm) {
		this.brdTypeNm = brdTypeNm;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "IntrGal [brdCd=" + brdCd + ", brdType=" + brdType + ", brdTypeNm=" + brdTypeNm + ", brdTl=" + brdTl
				+ ", brdCont=" + brdCont + ", regId=" + regId + ", regDt=" + regDt + ", useYn=" + useYn + ", hit=" + hit
				+ ", img=" + img + ", rNum=" + rNum + "]";
	}
}
