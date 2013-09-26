package com.webloan.model;

import java.io.Serializable;

public class HighQuest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6526674475129807408L;

	private Long id;
	private Question question;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

}
