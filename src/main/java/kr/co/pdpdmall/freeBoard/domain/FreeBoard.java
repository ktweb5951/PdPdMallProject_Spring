package kr.co.pdpdmall.freeBoard.domain;

import java.sql.*;

public class FreeBoard {
	private int freeBoardNo;
	private String freeBoardTitle;
	private String freeBoardContent;
	private String freeBoardWriter;
	private int viewCount;
	private int rcmndCount;
	private Timestamp freeBoardDate;
	private Timestamp updateDate;
	private String freeBoardFilename;
	private String freeBoardFileRename;
	private String freeBoardFilepath;
	private long freeBoardFilelength;
	
	public FreeBoard() {
	}

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}

	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}

	public String getFreeBoardContent() {
		return freeBoardContent;
	}

	public void setFreeBoardContent(String freeBoardContent) {
		this.freeBoardContent = freeBoardContent;
	}

	public String getFreeBoardWriter() {
		return freeBoardWriter;
	}

	public void setFreeBoardWriter(String freeBoardWriter) {
		this.freeBoardWriter = freeBoardWriter;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getRcmndCount() {
		return rcmndCount;
	}

	public void setRcmndCount(int rcmndCount) {
		this.rcmndCount = rcmndCount;
	}

	public Timestamp getFreeBoardDate() {
		return freeBoardDate;
	}

	public void setFreeBoardDate(Timestamp freeBoardDate) {
		this.freeBoardDate = freeBoardDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getFreeBoardFilename() {
		return freeBoardFilename;
	}

	public void setFreeBoardFilename(String freeBoardFilename) {
		this.freeBoardFilename = freeBoardFilename;
	}

	public String getFreeBoardFileRename() {
		return freeBoardFileRename;
	}
	
	public void setFreeBoardFileRename(String freeBoardFileRename) {
		this.freeBoardFileRename = freeBoardFileRename;
	}
	
	public String getFreeBoardFilepath() {
		return freeBoardFilepath;
	}

	public void setFreeBoardFilepath(String freeBoardFilepath) {
		this.freeBoardFilepath = freeBoardFilepath;
	}

	public long getFreeBoardFilelength() {
		return freeBoardFilelength;
	}

	public void setFreeBoardFilelength(long freeBoardFilelength) {
		this.freeBoardFilelength = freeBoardFilelength;
	}

	@Override
	public String toString() {
		return "FreeBoard [freeBoardNo=" + freeBoardNo + ", freeBoardTitle=" + freeBoardTitle + ", freeBoardContent="
				+ freeBoardContent + ", freeBoardWriter=" + freeBoardWriter + ", viewCount=" + viewCount
				+ ", rcmndCount=" + rcmndCount + ", freeBoardDate=" + freeBoardDate + ", updateDate=" + updateDate
				+ ", freeBoardFilename=" + freeBoardFilename + ", freeBoardFileRename=" + freeBoardFileRename
				+ ", freeBoardFilepath=" + freeBoardFilepath + ", freeBoardFilelength=" + freeBoardFilelength + "]";
	}


	









	
}
