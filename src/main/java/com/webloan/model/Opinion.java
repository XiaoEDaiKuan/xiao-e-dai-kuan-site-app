package com.webloan.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Opinion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1321399366187975981L;

	private Long id;
	private String name;
	private String email;
	private String telephone;
	private String content;
	private Timestamp setupTime;
	private String answerBy;
	private Timestamp answerTime;
	private String status;
    private String answerCont;
    
     
    
	public Timestamp getSetupTime() {
		return setupTime;
	}

	public void setSetupTime(Timestamp setupTime) {
		this.setupTime = setupTime;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswerCont() {
		return answerCont;
	}

	public void setAnswerCont(String answerCont) {
		this.answerCont = answerCont;
	}

}
