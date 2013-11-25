package com.webloan.order;

import java.math.BigDecimal;

public class OrderQuery {
	
	private String applyName;
	private String applyTelephone;
	private BigDecimal applyAmt;
	private Long cityId;
	private Integer loanTime;
	
	public String getApplyName() {
		return applyName;
	}
	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}
	public String getApplyTelephone() {
		return applyTelephone;
	}
	public void setApplyTelephone(String applyTelephone) {
		this.applyTelephone = applyTelephone;
	}
	public BigDecimal getApplyAmt() {
		return applyAmt;
	}
	public void setApplyAmt(BigDecimal applyAmt) {
		this.applyAmt = applyAmt;
	}
	public Long getCityId() {
		return cityId;
	}
	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	public Integer getLoanTime() {
		return loanTime;
	}
	public void setLoanTime(Integer loanTime) {
		this.loanTime = loanTime;
	}
}
