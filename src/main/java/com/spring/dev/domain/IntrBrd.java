package com.spring.dev.domain;

import java.io.Serializable;
import java.util.Date;

public class IntrBrd {
	private static final long serialVersionUID = 1L;
	private String boardIdx;
	private String boardCd;
	private String boardTitle;
	private String boardContent;
	private String regId;
	private Date regDt;
	private String useYn;
	
	private String rNum;
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	
	public String getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getBoardCd() {
		return boardCd;
	}
	public void setBoardCd(String boardCd) {
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "IntrBrd [boardIdx=" + boardIdx + ", boardCd=" + boardCd + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", regId=" + regId + ", regDt=" + regDt + ", useYn=" + useYn
				+ ", rNum=" + rNum + "]";
	}
}
