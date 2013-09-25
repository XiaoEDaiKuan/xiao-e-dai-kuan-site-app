package com.webloan.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Answer implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1278351986364318526L;
	private Long id;//
	private Question question;
	private Region region;
	private String answerBy;
	private Timestamp answerTime;
	private String answerContent;
	private String answerLevel;
	private String email;
	private String telephone;
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
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public String getAnswerBy() {
		return answerBy;
	}
	public void setAnswerBy(String answerBy) {
		this.answerBy = answerBy;
	}
	public Timestamp getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(Timestamp answerTime) {
		this.answerTime = answerTime;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerLevel() {
		return answerLevel;
	}
	public void setAnswerLevel(String answerLevel) {
		this.answerLevel = answerLevel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	
}
