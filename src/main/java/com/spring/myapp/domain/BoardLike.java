package com.spring.myapp.domain;

public class BoardLike {
	private int like_Id;
	private  String like_boardId;
	private int like_check; 
	private String like_sendUserId; 
	private String like_getUserId;
	
	public int getLike_Id() {
		return like_Id;
	}
	public void setLike_Id(int like_Id) {
		this.like_Id = like_Id;
	}
	public String getLike_boardId() {
		return like_boardId;
	}
	public void setLike_boardId(String like_boardId) {
		this.like_boardId = like_boardId;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public String getLike_sendUserId() {
		return like_sendUserId;
	}
	public void setLike_sendUserId(String like_sendUserId) {
		this.like_sendUserId = like_sendUserId;
	}
	public String getLike_getUserId() {
		return like_getUserId;
	}
	public void setLike_getUserId(String like_getUserId) {
		this.like_getUserId = like_getUserId;
	} 

}
