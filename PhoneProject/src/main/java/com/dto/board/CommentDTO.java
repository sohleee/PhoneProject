package com.dto.board;

import org.apache.ibatis.type.Alias;

@Alias("CommentDTO")
public class CommentDTO {
	private int num;
	private int boardnum;
	private String userid;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDTO(int num, int boardnum, String userid, String username, String commentday, String content) {
		super();
		this.num = num;
		this.boardnum = boardnum;
		this.userid = userid;
		this.username = username;
		this.commentday = commentday;
		this.content = content;
	}
	
		
}
