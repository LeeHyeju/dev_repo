package com.spring.dev.domain;

import java.io.Serializable;
import java.util.Date;

public class Auth implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String authCd;
	private String authNm;
	private String regId;
	private Date regDt;
	
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getAuthNm() {
		return authNm;
	}
	public void setAuthNm(String authNm) {
		this.authNm = authNm;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Auth [authCd=" + authCd + ", authNm=" + authNm + ", regId=" + regId + ", regDt=" + regDt + "]";
	}
}
