package com.spring.dev.domain;

import java.util.Date;

public class Bnr {
	private String bnrCd;
	private String bnrType;
	private String bnrKind;
	private String bnrNm;
	private String bnrCont;
	private String bnrExpl;
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
	
	public String getbnrCd() {
		return bnrCd;
	}
	public void setbnrCd(String bnrCd) {
		this.bnrCd = bnrCd;
	}
	public String getbnrType() {
		return bnrType;
	}
	public void setbnrType(String bnrType) {
		this.bnrType = bnrType;
	}
	public String getbnrKind() {
		return bnrKind;
	}
	public void setbnrKind(String bnrKind) {
		this.bnrKind = bnrKind;
	}
	public String getbnrNm() {
		return bnrNm;
	}
	public void setbnrNm(String bnrNm) {
		this.bnrNm = bnrNm;
	}
	public String getbnrCont() {
		return bnrCont;
	}
	public void setbnrCont(String bnrCont) {
		this.bnrCont = bnrCont;
	}
	public String getbnrExpl() {
		return bnrExpl;
	}
	public void setbnrExpl(String bnrExpl) {
		this.bnrExpl = bnrExpl;
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
		return "Benner [bnrCd=" + bnrCd + ", bnrType=" + bnrType + ", bnrKind=" + bnrKind + ", bnrNm=" + bnrNm
				+ ", bnrCont=" + bnrCont + ", bnrExpl=" + bnrExpl + ", useYn=" + useYn + ", img=" + img + ", link="
				+ link + ", regId=" + regId + ", regDt=" + regDt + ", rNum=" + rNum + "]";
	}
}
