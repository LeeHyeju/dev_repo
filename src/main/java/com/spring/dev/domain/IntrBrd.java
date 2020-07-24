package com.spring.dev.domain;

import java.util.Date;

public class IntrBrd {
	private int brdCd;
	private int brdType;
	private String brdTypeNm;
	private String brdTl;
	private String brdCont;
	private String regId;
	private Date regDt;
	private int hit;
	
	private String notiYn;
	private String delYn;
	private String file;
	private String vd;
	private String link;
	private String replCont;
	private String cmtCont;
	private String useYn;
	private String fileYn;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getNotiYn() {
		return notiYn;
	}
	public void setNotiYn(String notiYn) {
		this.notiYn = notiYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getVd() {
		return vd;
	}
	public void setVd(String vd) {
		this.vd = vd;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getReplCont() {
		return replCont;
	}
	public void setReplCont(String replCont) {
		this.replCont = replCont;
	}
	public String getCmtCont() {
		return cmtCont;
	}
	public void setCmtCont(String cmtCont) {
		this.cmtCont = cmtCont;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getFileYn() {
		return fileYn;
	}
	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "IntrBrd [brdCd=" + brdCd + ", brdType=" + brdType + ", brdTypeNm=" + brdTypeNm + ", brdTl=" + brdTl
				+ ", brdCont=" + brdCont + ", regId=" + regId + ", regDt=" + regDt + ", hit=" + hit + ", notiYn="
				+ notiYn + ", delYn=" + delYn + ", file=" + file + ", vd=" + vd + ", link=" + link + ", replCont="
				+ replCont + ", cmtCont=" + cmtCont + ", useYn=" + useYn + ", fileYn=" + fileYn + ", img=" + img
				+ ", rNum=" + rNum + "]";
	}
}
