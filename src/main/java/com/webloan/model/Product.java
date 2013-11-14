package com.webloan.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class Product implements Serializable {

	private static final long serialVersionUID = -7913666445680418270L;
	
	private Long id;//ID
	private String name;//PRD_NAME
	private String desc;//PRD_DESC
	private String icon;//PRD_ICON
	
	private String issueOrgan;//ISSUE_ORG
	private String issueType;//ISSUE_ORG_TYPE
	
	private String type;//PRD_TYPE
	private String status;//PRD_STATUS
	private String guarantyType;//GUARANTY_TYPE
	private String repayType;//REPAY_TYPE
	private String repayDesc;//REPAY_DESC
	
	private Integer paidDays;//PAY_TIME
	private String appReq;//APP_REQ
	private String appMaterial;//APP_MATERIAL
	private String groupBuying;//IS_GROUP
	
	private BigDecimal intrRate;//INTR_RATE
	private String intrDesc;//INTR_RATE_DESC
	private String intrFormula;//INTR_FORMULAR
	private String monthlyFormula;//MONTHLY_FORMULAR
	private BigDecimal initialRate;//INITIAL_RATE
	private BigDecimal managerRate;//MANAGER_RATE
	
	private Integer orders;//ORDER_ID
	
	public BigDecimal getManagerRate() {
		return managerRate;
	}
	public void setManagerRate(BigDecimal managerRate) {
		this.managerRate = managerRate;
	}
	private List<Region> regions;
	
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getIssueOrgan() {
		return issueOrgan;
	}
	public void setIssueOrgan(String issueOrgan) {
		this.issueOrgan = issueOrgan;
	}
	public String getIssueType() {
		return issueType;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getRepayDesc() {
		return repayDesc;
	}
	public void setRepayDesc(String repayDesc) {
		this.repayDesc = repayDesc;
	}
	public Integer getPaidDays() {
		return paidDays;
	}
	public void setPaidDays(Integer paidDays) {
		this.paidDays = paidDays;
	}
	public String getAppReq() {
		return appReq;
	}
	public void setAppReq(String appReq) {
		this.appReq = appReq;
	}
	public String getAppMaterial() {
		return appMaterial;
	}
	public void setAppMaterial(String appMaterial) {
		this.appMaterial = appMaterial;
	}
	public String getGroupBuying() {
		return groupBuying;
	}
	public void setGroupBuying(String groupBuying) {
		this.groupBuying = groupBuying;
	}
	public BigDecimal getIntrRate() {
		return intrRate;
	}
	public void setIntrRate(BigDecimal intrRate) {
		this.intrRate = intrRate;
	}
	public String getIntrDesc() {
		return intrDesc;
	}
	public void setIntrDesc(String intrDesc) {
		this.intrDesc = intrDesc;
	}
	public String getIntrFormula() {
		return intrFormula;
	}
	public void setIntrFormula(String intrFormula) {
		this.intrFormula = intrFormula;
	}
	public String getMonthlyFormula() {
		return monthlyFormula;
	}
	public void setMonthlyFormula(String monthlyFormula) {
		this.monthlyFormula = monthlyFormula;
	}
	public BigDecimal getInitialRate() {
		return initialRate;
	}
	public void setInitialRate(BigDecimal initialRate) {
		this.initialRate = initialRate;
	}
	public Integer getOrders() {
		return orders;
	}
	public void setOrders(Integer orders) {
		this.orders = orders;
	}
	public List<Region> getRegions() {
		return regions;
	}
	public void setRegions(List<Region> regions) {
		this.regions = regions;
	}
}
