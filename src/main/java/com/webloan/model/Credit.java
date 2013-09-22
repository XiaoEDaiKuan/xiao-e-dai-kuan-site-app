package com.webloan.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class Credit implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -674637854122123705L;

	  
	private Long id;//主键
	   private Cust cust;//
	   private String creditType;//信用评分类型
	   private String custName;//测评人称呼
	   private String custTelephone;//测评人联系方式
	   private Timestamp calTime;//测评时间
	   private BigDecimal creditMin;//测评信用下限
	   private BigDecimal creditMax;//测评信用上限
	   private String status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Cust getCust() {
		return cust;
	}
	public void setCust(Cust cust) {
		this.cust = cust;
	}
	public String getCreditType() {
		return creditType;
	}
	public void setCreditType(String creditType) {
		this.creditType = creditType;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustTelephone() {
		return custTelephone;
	}
	public void setCustTelephone(String custTelephone) {
		this.custTelephone = custTelephone;
	}
	public Timestamp getCalTime() {
		return calTime;
	}
	public void setCalTime(Timestamp calTime) {
		this.calTime = calTime;
	}
	public BigDecimal getCreditMin() {
		return creditMin;
	}
	public void setCreditMin(BigDecimal creditMin) {
		this.creditMin = creditMin;
	}
	public BigDecimal getCreditMax() {
		return creditMax;
	}
	public void setCreditMax(BigDecimal creditMax) {
		this.creditMax = creditMax;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	   
}
