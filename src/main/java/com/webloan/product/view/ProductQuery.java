package com.webloan.product.view;

import java.math.BigDecimal;

public class ProductQuery {

	private Long productId;
	private String identity;
	private String loanUse;
	private Integer loanIssue;
	private BigDecimal loanAmt;
	private String estate;
	private String vehicle;
	private String credit;
	private String issueType;
	private String guarantyType;
	private String repayType;
	
	private Long regionId;
	
	private String rcmdType;
	private BigDecimal minLoanAmt;
	private BigDecimal maxLoanAmt;
	
	private String orderRate;
	private String orderMonthly;
	
	private Integer pageIndex = 1;
	private Integer pageSize = 10;
	
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getLoanUse() {
		return loanUse;
	}
	public void setLoanUse(String loanUse) {
		this.loanUse = loanUse;
	}
	public Integer getLoanIssue() {
		return loanIssue;
	}
	public void setLoanIssue(Integer loanIssue) {
		this.loanIssue = loanIssue;
	}
	public BigDecimal getLoanAmt() {
		return loanAmt;
	}
	public void setLoanAmt(BigDecimal loanAmt) {
		this.loanAmt = loanAmt;
	}
	public String getEstate() {
		return estate;
	}
	public void setEstate(String estate) {
		this.estate = estate;
	}
	public String getVehicle() {
		return vehicle;
	}
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getIssueType() {
		return issueType;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	public String getGuarantyType() {
		return guarantyType;
	}
	public void setGuarantyType(String guarantyType) {
		this.guarantyType = guarantyType;
	}
	public String getRepayType() {
		return repayType;
	}
	public void setRepayType(String repayType) {
		this.repayType = repayType;
	}
	public Long getRegionId() {
		return regionId;
	}
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}
	public String getRcmdType() {
		return rcmdType;
	}
	public void setRcmdType(String rcmdType) {
		this.rcmdType = rcmdType;
	}
	public BigDecimal getMinLoanAmt() {
		return minLoanAmt;
	}
	public void setMinLoanAmt(BigDecimal minLoanAmt) {
		this.minLoanAmt = minLoanAmt;
	}
	public BigDecimal getMaxLoanAmt() {
		return maxLoanAmt;
	}
	public void setMaxLoanAmt(BigDecimal maxLoanAmt) {
		this.maxLoanAmt = maxLoanAmt;
	}
	public String getOrderRate() {
		return orderRate;
	}
	public void setOrderRate(String orderRate) {
		this.orderRate = orderRate;
	}
	public String getOrderMonthly() {
		return orderMonthly;
	}
	public void setOrderMonthly(String orderMonthly) {
		this.orderMonthly = orderMonthly;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
