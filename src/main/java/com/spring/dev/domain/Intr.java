package com.spring.dev.domain;

import java.util.Date;

public class Intr {
	private int brdCd;
	private String brdType;
	private String brdNm;
	private String brdPage;
	private String pageYn;
	private String postPeriYn;
	private String srchYn;
	private String notiYn;
	private String fileYn;
	private String vdYn;
	private String tabYn;
	private String linkYn;
	private String imgYn;
	private String replYn;
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
	public String getPageYn() {
		return pageYn;
	}
	public void setPageYn(String pageYn) {
		this.pageYn = pageYn;
	}
	public String getPostPeriYn() {
		return postPeriYn;
	}
	public void setPostPeriYn(String postPeriYn) {
		this.postPeriYn = postPeriYn;
	}
	public String getSrchYn() {
		return srchYn;
	}
	public void setSrchYn(String srchYn) {
		this.srchYn = srchYn;
	}
	public String getNotiYn() {
		return notiYn;
	}
	public void setNotiYn(String notiYn) {
		this.notiYn = notiYn;
	}
	public String getFileYn() {
		return fileYn;
	}
	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}
	public String getVdYn() {
		return vdYn;
	}
	public void setVdYn(String vdYn) {
		this.vdYn = vdYn;
	}
	public String getTabYn() {
		return tabYn;
	}
	public void setTabYn(String tabYn) {
		this.tabYn = tabYn;
	}
	public String getLinkYn() {
		return linkYn;
	}
	public void setLinkYn(String linkYn) {
		this.linkYn = linkYn;
	}
	public String getImgYn() {
		return imgYn;
	}
	public void setImgYn(String imgYn) {
		this.imgYn = imgYn;
	}
	public String getReplYn() {
		return replYn;
	}
	public void setReplYn(String replYn) {
		this.replYn = replYn;
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
				+ ", pageYn=" + pageYn + ", postPeriYn=" + postPeriYn + ", srchYn=" + srchYn + ", notiYn=" + notiYn
				+ ", fileYn=" + fileYn + ", vdYn=" + vdYn + ", tabYn=" + tabYn + ", linkYn=" + linkYn + ", imgYn="
				+ imgYn + ", replYn=" + replYn + ", cmtYn=" + cmtYn + ", useYn=" + useYn + ", delYn=" + delYn
				+ ", regId=" + regId + ", regDt=" + regDt + ", rNum=" + rNum + "]";
	}
}
