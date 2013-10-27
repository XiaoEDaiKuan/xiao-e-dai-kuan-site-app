package com.webloan.model;

import java.io.Serializable;

public class RequireInfo implements Serializable {
	
	private static final long serialVersionUID = -6741247287927689708L;

	private Long id;
	private String question;
	private String ansOptions;
	private String formName;
	private String propertyName;
	private String validateType;
	private String status;
	
	private Product product;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnsOptions() {
		return ansOptions;
	}
	public void setAnsOptions(String ansOptions) {
		this.ansOptions = ansOptions;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getValidateType() {
		return validateType;
	}
	public void setValidateType(String validateType) {
		this.validateType = validateType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
