package com.webloan.order;

public class ValidatorError {

	private ValidatorInfo info;
	private String message;
	
	public ValidatorInfo getInfo() {
		return info;
	}
	public void setInfo(ValidatorInfo info) {
		this.info = info;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
