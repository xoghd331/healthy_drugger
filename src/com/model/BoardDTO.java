package com.model;

public class BoardDTO {
	
	private int num;
	private String username;
	private String password;
	private String title;
	private String content;
	private String b_date;
	private int b_view;
	private int ref;
	private int indent;
	private int step;
	private boolean dayNew;
	
	public BoardDTO() {
		
	}
	
	public BoardDTO(int num, String username, String password, String title, String content, String b_date, int b_view, int ref, int indent, int step, boolean dayNew) {

		this.num = num;
		this.username = username;
		this.password = password;
		this.title = title;
		this.content = content;
		this.b_date = b_date;
		this.b_view = b_view;
		this.ref = ref;
		this.indent = indent;
		this.step = step;
		this.dayNew = dayNew;
	}

	public int getNum() {
		return num;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getB_date() {
		return b_date;
	}

	public int getB_view() {
		return b_view;
	}

	public int getRef() {
		return ref;
	}

	public int getIndent() {
		return indent;
	}

	public int getStep() {
		return step;
	}

	public boolean isDayNew() {
		return dayNew;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public void setB_view(int b_view) {
		this.b_view = b_view;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public void setDayNew(boolean dayNew) {
		this.dayNew = dayNew;
	}
}
