package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CommentDTO")
public class CommentDTO {
	private int num;
	private int boardnum;
	private String username;
	private String commentday;
	private String content;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCommentday() {
		return commentday;
	}
	public void setCommentday(String commentday) {
		this.commentday = commentday;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public CommentDTO(int num, int boardnum, String username, String commentday, String content) {
		super();
		this.num = num;
		this.boardnum = boardnum;
		this.username = username;
		this.commentday = commentday;
		this.content = content;
	}
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CommentDTO [num=" + num + ", boardnum=" + boardnum + ", username=" + username + ", commentday="
				+ commentday + ", content=" + content + "]";
	}
	
		
}
