package com.spring.dev.domain;

import java.util.Date;

public class Intr {
	private int brdCd;
	private String brdType;
	private String brdNm;
	private String brdPage;
	private String fileYn;
	private String notiYn;
	private String replyYn;
	private String cmtYn;
	private String useYn;
	private String delYn;
	private String regId;
	private Date regDt;
	
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
	public String getBrdType() {
		return brdType;
	}
	public void setBrdType(String brdType) {
		this.brdType = brdType;
	}
	public String getBrdNm() {
		return brdNm;
	}
	public void setBrdNm(String brdNm) {
		this.brdNm = brdNm;
	}
	public String getBrdPage() {
		return brdPage;
	}
	public void setBrdPage(String brdPage) {
		this.brdPage = brdPage;
	}
	public String getFileYn() {
		return fileYn;
	}
	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}
	public String getNotiYn() {
		return notiYn;
	}
	public void setNotiYn(String notiYn) {
		this.notiYn = notiYn;
	}
	public String getReplyYn() {
		return replyYn;
	}
	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}
	public String getCmtYn() {
		return cmtYn;
	}
	public void setCmtYn(String cmtYn) {
		this.cmtYn = cmtYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
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
		return "Intr [brdCd=" + brdCd + ", brdType=" + brdType + ", brdNm=" + brdNm + ", brdPage=" + brdPage
				+ ", fileYn=" + fileYn + ", notiYn=" + notiYn + ", replyYn=" + replyYn + ", cmtYn=" + cmtYn + ", useYn="
				+ useYn + ", delYn=" + delYn + ", regId=" + regId + ", regDt=" + regDt + ", rNum=" + rNum + "]";
	}
}
