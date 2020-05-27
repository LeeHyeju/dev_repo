package com.spring.dev.domain;

import java.io.Serializable;

public class AuthMenu implements Serializable {
private static final long serialVersionUID = 1L;
	
	private String authCd;
	private String authNm;
	private String authMenuCd;
	private String authInfo;
	private String authInfoDtl;
	
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
	public String getAuthMenuCd() {
		return authMenuCd;
	}
	public void setAuthMenuCd(String authMenuCd) {
		this.authMenuCd = authMenuCd;
	}
	public String getAuthInfo() {
		return authInfo;
	}
	public void setAuthInfo(String authInfo) {
		this.authInfo = authInfo;
	}
	public String getAuthInfoDtl() {
		return authInfoDtl;
	}
	public void setAuthInfoDtl(String authInfoDtl) {
		this.authInfoDtl = authInfoDtl;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "AuthMenu [authCd=" + authCd + ", authNm=" + authNm + ", authMenuCd=" + authMenuCd + ", authInfo="
				+ authInfo + ", authInfoDtl=" + authInfoDtl + "]";
	}
}
