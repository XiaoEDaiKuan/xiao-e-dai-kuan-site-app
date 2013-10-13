package com.webloan.question.view;

public class QuestionView {
	
	private Long questionId;
	private String tag;
	private String title;
	
	private String subject;
	private String detail;
	private String email;
	private String telephone;
	
	private int pageIndex = 1;
	private int pageSize = 10;
	
	private int hiIndex = 1;
	private int nomIndex = 1;
	private int morIndex = 1;
	
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
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
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getHiIndex() {
		return hiIndex;
	}
	public void setHiIndex(int hiIndex) {
		this.hiIndex = hiIndex;
	}
	public int getNomIndex() {
		return nomIndex;
	}
	public void setNomIndex(int nomIndex) {
		this.nomIndex = nomIndex;
	}
	public int getMorIndex() {
		return morIndex;
	}
	public void setMorIndex(int morIndex) {
		this.morIndex = morIndex;
	}
}
