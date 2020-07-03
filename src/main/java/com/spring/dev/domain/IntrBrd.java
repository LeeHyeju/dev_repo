package com.spring.dev.domain;

import java.util.Date;

public class IntrBrd {
	private static final long serialVersionUID = 1L;
	private String brdIdx;
	private int brdCd;
	private int brdType;
	private String brdTl;
	private String brdCont;
	private String regId;
	private Date regDt;
	private int hit;
	
	private String useYn;
	private String fileYn;
	private String ancmOptnYn;

	private String rNum;
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	
	public String getBrdIdx() {
		return brdIdx;
	}
	public void setBrdIdx(String brdIdx) {
		this.brdIdx = brdIdx;
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
	public String getAncmOptnYn() {
		return ancmOptnYn;
	}
	public void setAncmOptnYn(String ancmOptnYn) {
		this.ancmOptnYn = ancmOptnYn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "IntrBrd [brdIdx=" + brdIdx + ", brdCd=" + brdCd + ", brdType=" + brdType + ", brdTl=" + brdTl
				+ ", brdCont=" + brdCont + ", regId=" + regId + ", regDt=" + regDt + ", hit=" + hit + ", useYn=" + useYn
				+ ", fileYn=" + fileYn + ", ancmOptnYn=" + ancmOptnYn + ", rNum=" + rNum + "]";
	}
}
