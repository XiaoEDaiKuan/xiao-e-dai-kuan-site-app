package com.webloan.model;

import java.io.Serializable;

public class RequireInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6741247287927689708L;

	 private Long    id;
	 private Long    productID;
	 private String  attr;
	 private String  columnID;
	 private String  value;
	 private String  status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getProductID() {
		return productID;
	}
	public void setProductID(Long productID) {
		this.productID = productID;
	}
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}
	public String getColumnID() {
		return columnID;
	}
	public void setColumnID(String columnID) {
		this.columnID = columnID;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	           
}
