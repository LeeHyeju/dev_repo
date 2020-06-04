package com.spring.dev.domain;

import java.io.Serializable;
import java.util.Date;

public class CmnCd {
	private static final long serialVersionUID = 1L;
	
	private String groCd;
	private String groNm;
	private String cmnCd;
	private String cmnNm;
	private String regId;
	private Date regDt;
	private String useYn;
	private int arayOrde;
	
	private String rNum;
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	
	public String getGroCd() {
		return groCd;
	}
	public void setGroCd(String groCd) {
		this.groCd = groCd;
	}
	public String getGroNm() {
		return groNm;
	}
	public void setGroNm(String groNm) {
		this.groNm = groNm;
	}
	public String getCmnCd() {
		return cmnCd;
	}
	public void setCmnCd(String cmnCd) {
		this.cmnCd = cmnCd;
	}
	public String getCmnNm() {
		return cmnNm;
	}
	public void setCmnNm(String cmnNm) {
		this.cmnNm = cmnNm;
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
	public int getArayOrde() {
		return arayOrde;
	}
	public void setArayOrde(int arayOrde) {
		this.arayOrde = arayOrde;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "CmnCd [groCd=" + groCd + ", groNm=" + groNm + ", cmnCd=" + cmnCd + ", cmnNm=" + cmnNm + ", regId="
				+ regId + ", regDt=" + regDt + ", useYn=" + useYn + ", arayOrde=" + arayOrde + ", rNum=" + rNum + "]";
	}
}
