package com.spring.myapp.domain;

import java.util.Map;

public class Board {
	
	private String id;
	private String subject;
	private String content;
	private String writer;
	private String register_datetime;
	private int read_count;
	private int like_count;
	private String tag1;
	private String tag2;
	private String tag3;
	private String tag4;
	private String tag5;
	private String tag6;
	private String tag7;
	private String tag8;
	private Map check;
	private String thumbnail;
	
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public Map getCheck() {
		return check;
	}
	public void setCheck(Map check) {
		this.check = check;
	}
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getRegister_datetime() {
		return register_datetime;
	}
	public void setRegister_datetime(String register_datetime) {
		this.register_datetime = register_datetime;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getTag5() {
		return tag5;
	}
	public void setTag5(String tag5) {
		this.tag5 = tag5;
	}
	public String getTag6() {
		return tag6;
	}
	public void setTag6(String tag6) {
		this.tag6 = tag6;
	}
	public String getTag7() {
		return tag7;
	}
	public void setTag7(String tag7) {
		this.tag7 = tag7;
	}
	public String getTag8() {
		return tag8;
	}
	public void setTag8(String tag8) {
		this.tag8 = tag8;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
}
