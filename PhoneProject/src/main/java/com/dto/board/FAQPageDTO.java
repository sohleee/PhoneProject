package com.dto.board;

import java.util.List;

public class FAQPageDTO {
	private List<FAQDTO> list;
	private int curPage;
	private int perPage;
	private int totalCount;
	private String searchValue;
	public List<FAQDTO> getList() {
		return list;
	}
	public void setList(List<FAQDTO> list) {
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
	
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public FAQPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQPageDTO(List<FAQDTO> list, int curPage, int perPage, int totalCount, String searchValue) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.searchValue = searchValue;
	}
	@Override
	public String toString() {
		return "PageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", searchValue=" + searchValue + "]";
	}
	
	
}
