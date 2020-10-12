package com.spring.myapp.domain;

public class Follow {
	private String follow_id;
	private String following_id;
	private int id;

	public String getFollow_id() {
		return follow_id;
	}

	public void setFollow_id(String follow_id) {
		this.follow_id = follow_id;
	}

	public String getFollowing_id() {
		return following_id;
	}

	public void setFollowing_id(String following_id) {
		this.following_id = following_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
