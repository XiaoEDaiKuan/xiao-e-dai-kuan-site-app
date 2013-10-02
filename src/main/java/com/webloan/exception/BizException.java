package com.webloan.exception;

public class BizException extends RuntimeException {

	private static final long serialVersionUID = 8249044200269374305L;
	
	public BizException() {
		super();
	}

	public BizException(String message, Throwable detail) {
		super(message, detail);
	}

	public BizException(String message) {
		super(message);
	}

	public BizException(Throwable detail) {
		super(detail);
	}
	
	private String viewName;

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	
}
