package com.dto.admin;

import java.util.List;

import com.dto.member.MemberDTO;

public class MemberMngPageDTO {
	
	private List<MemberDTO> m_list;
	private int curPage;
	private int perPage;
	private int curIdx;
	private int totalCount;
	private String searchName;
	private String searchValue;
	public MemberMngPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberMngPageDTO(List<MemberDTO> m_list, int curPage, int perPage, int curIdx, int totalCount,
			String searchName, String searchValue) {
		super();
		this.m_list = m_list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.curIdx = curIdx;
		this.totalCount = totalCount;
		this.searchName = searchName;
		this.searchValue = searchValue;
	}
	public List<MemberDTO> getM_list() {
		return m_list;
	}
	public void setM_list(List<MemberDTO> m_list) {
		this.m_list = m_list;
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
	public int getCurIdx() {
		return curIdx;
	}
	public void setCurIdx(int curIdx) {
		this.curIdx = curIdx;
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
	
	
}
