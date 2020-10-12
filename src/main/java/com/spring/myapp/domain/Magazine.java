package com.spring.myapp.domain;

public class Magazine {
	private String id;
	private String subject;
	private String subtitle;
	private String content;
	private String register_datetime;
	private String main_img_path;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegister_datetime() {
		return register_datetime;
	}
	public void setRegister_datetime(String register_datetime) {
		this.register_datetime = register_datetime;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getMain_img_path() {
		return main_img_path;
	}
	public void setMain_img_path(String main_img_path) {
		this.main_img_path = main_img_path;
	}
	
}
