package com.entity;

public class Feedback {

	private int id;

	private int bookId;

	private int userId;

	private String comment;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback(int bookId, int userId, String comment) {
		super();
		this.bookId = bookId;
		this.userId = userId;
		this.comment = comment;
	}

	public Feedback(int id, int bookId, int userId, String comment) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.userId = userId;
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
