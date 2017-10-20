package com.dto.qna;

import java.util.List;

public class QNAPageDTO {
	private List<QNADTO> list;
	private int curPage;
	private int perPage;
	private int curIdx;
	public int getCurIdx() {
		return curIdx;
	}
	public void setCurIdx(int curIdx) {
		this.curIdx = curIdx;
	}
	private int totalCount;
	private String searchName;
	private String searchValue;
	public List<QNADTO> getList() {
		return list;
	}
	public void setList(List<QNADTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public QNAPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QNAPageDTO(List<QNADTO> list, int curPage, int perPage, int totalCount, String searchName,
			String searchValue) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.searchName = searchName;
		this.searchValue = searchValue;
	}
	@Override
	public String toString() {
		return "PageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", searchName=" + searchName + ", searchValue=" + searchValue + "]";
	}
	
	
}
