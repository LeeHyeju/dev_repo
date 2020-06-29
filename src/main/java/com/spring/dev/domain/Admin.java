package com.spring.dev.domain;

import java.io.Serializable;

import java.util.Date;

public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String admId;
	private String pw;
	private String nm;
	private String authCd;
	private String tel;
	private String email;
	private String emailId;
	private String emailDomain;
	private String regId;
	private Date regDt;
	private String delYn;
	private String useYn;
	
	
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getauthCd() {
		return authCd;
	}
	public void setauthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		if (email == null && emailId != null) {
			email = emailId + "@" + emailDomain;
		}
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		
		if (email != null) {
			String[] m = email.split("@");
			setEmailId(m[0]);
			if (m.length > 1) {				
				setEmailDomain(m[1]);
			}
		}
	}	
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
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
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Admin [admId=" + admId + ", pw=" + pw + ", nm=" + nm + ", authCd=" + authCd + ", tel=" + tel
				+ ", email=" + email + ", emailId=" + emailId + ", emailDomain=" + emailDomain + ", regId=" + regId
				+ ", regDt=" + regDt + ", delYn=" + delYn + ", useYn=" + useYn + "]";
	}
	
}
