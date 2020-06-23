package com.spring.dev.domain;

public class SearchKey {
	private String keyGroCd;
	private String keyGroNm;
	private String keyCmnCd;
	private String keyCmnNm;
	private String keyUseYn;
	private String keyArayOrde;
	
	public String getKeyGroCd() {
		return keyGroCd;
	}
	public void setKeyGroCd(String keyGroCd) {
		this.keyGroCd = keyGroCd;
	}
	public String getKeyGroNm() {
		return keyGroNm;
	}
	public void setKeyGroNm(String keyGroNm) {
		this.keyGroNm = keyGroNm;
	}
	public String getKeyCmnCd() {
		return keyCmnCd;
	}
	public void setKeyCmnCd(String keyCmnCd) {
		this.keyCmnCd = keyCmnCd;
	}
	public String getKeyCmnNm() {
		return keyCmnNm;
	}
	public void setKeyCmnNm(String keyCmnNm) {
		this.keyCmnNm = keyCmnNm;
	}
	public String getKeyUseYn() {
		return keyUseYn;
	}
	public void setKeyUseYn(String keyUseYn) {
		this.keyUseYn = keyUseYn;
	}
	public String getKeyArayOrde() {
		return keyArayOrde;
	}
	public void setKeyArayOrde(String keyArayOrde) {
		this.keyArayOrde = keyArayOrde;
	}
	@Override
	public String toString() {
		return "SearchKey [keyGroCd=" + keyGroCd + ", keyGroNm=" + keyGroNm + ", keyCmnCd=" + keyCmnCd + ", keyCmnNm="
				+ keyCmnNm + ", keyUseYn=" + keyUseYn + ", keyArayOrde=" + keyArayOrde + "]";
	}
}
