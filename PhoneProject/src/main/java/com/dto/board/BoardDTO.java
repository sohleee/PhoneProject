package com.dto.board;

import org.apache.ibatis.type.Alias;

@Alias("BoardDTO")
public class BoardDTO {
	
	private int boardnum;
	private String userid;
	private String title;
	private String author;
	private String content;
	private String writeday;
	private int readCnt;
	private String board_image;
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int boardnum, String userid, String title, String author, String content, String writeday, int readCnt,String board_image) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.title = title;
		this.author = author;
		this.content = content;
		this.writeday = writeday;
		this.readCnt = readCnt;
		this.board_image = board_image;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	
	
}
