package com.spring.dev.domain;

import java.io.Serializable;

import java.util.Date;

public class IntrBrd {
	private static final long serialVersionUID = 1L;
	private String boardIdx;
	private int boardCd;
	private String boardTitle;
	private String boardContent;
	private String regId;
	private Date regDt;
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
	
	private String srchKey;
	private String srch;
	public String getSrchKey() {
		return srchKey;
	}
	public void setSrchKey(String srchKey) {
		this.srchKey = srchKey;
	}
	public String getSrch() {
		return srch;
	}
	public void setSrch(String srch) {
		this.srch = srch;
	}
	
	public String getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getBoardCd() {
		return boardCd;
	}
	public void setBoardCd(int boardCd) {
		this.boardCd = boardCd;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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
		return "IntrBrd [boardIdx=" + boardIdx + ", boardCd=" + boardCd + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", regId=" + regId + ", regDt=" + regDt + ", useYn=" + useYn
				+ ", fileYn=" + fileYn + ", ancmOptnYn=" + ancmOptnYn + ", rNum=" + rNum + ", srchKey=" + srchKey
				+ ", srch=" + srch + "]";
	}
}
