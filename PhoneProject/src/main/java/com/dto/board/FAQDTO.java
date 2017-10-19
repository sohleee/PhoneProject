package com.dto.board;

import org.apache.ibatis.type.Alias;

@Alias("FAQDTO")
public class FAQDTO {
	private int num;
	private String title;
	private String content;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public FAQDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQDTO(int num, String title,String content) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		
	}
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ",content=" + content + "]";
	}
	
	
}
