package com.webloan.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProductAttach implements Serializable {

	private static final long serialVersionUID = -6091241579617329626L;
	
	private Long id;//ID
	private String nationality;//NATIONALITY
	private Integer minAge;//MIN_AGE
	private Integer maxAge;//MAX_AGE
	
	private String identity;//IDENTITY
	private String estate;//ESTATE
	private String vehicle;//VEHICLE
	private String credit;//CREDIT
	
	private BigDecimal ownerPubAccAmt;//BOWNER_PUBACC_AMT
	private BigDecimal ownerPrvAccAmt;//BOWNER_PRVACC_AMT
	private String ownerReg;//BOWNER_REG
	private Integer ownerOplife;//BOWNER_OPLIFE
	
	private BigDecimal selfEmpCardAmt;//SELF_EMPLOYED_CARD_AMT
	private BigDecimal selfEmpCashAmt;//SELF_EMPLOYED_CASH_AMT
	private String selfEmpReg;//SELF_EMPLOYED_REG
	private Integer selfEmpOplife;//SELF_EMPLOYED_OPLIFE
	
	private BigDecimal workersCardAmt;//WORKERS_CARD_AMT
	private BigDecimal workersCashAmt;//WORKERS_CASH_AMT
	private Integer workersExperience;//WORKERS_EXPERIENCE
	
	private BigDecimal unempCashAmt;//UNEMPLOYED_CASH_AMT
	private String loanUse;//LOAN_USE
	
	private BigDecimal minLoanAmt;//MIN_LOAN_AMT
	private BigDecimal maxLoanAmt;//MAX_LOAN_AMT
	private Integer minLoanIssue;//MIN_LOAN_TIME
	private Integer maxLoanIssue;//MAX_LOAN_TIME
	
	private Product product;//PRODUCT_ID
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public Integer getMinAge() {
		return minAge;
	}
	public void setMinAge(Integer minAge) {
		this.minAge = minAge;
	}
	public Integer getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(Integer maxAge) {
		this.maxAge = maxAge;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
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
	public BigDecimal getOwnerPubAccAmt() {
		return ownerPubAccAmt;
	}
	public void setOwnerPubAccAmt(BigDecimal ownerPubAccAmt) {
		this.ownerPubAccAmt = ownerPubAccAmt;
	}
	public BigDecimal getOwnerPrvAccAmt() {
		return ownerPrvAccAmt;
	}
	public void setOwnerPrvAccAmt(BigDecimal ownerPrvAccAmt) {
		this.ownerPrvAccAmt = ownerPrvAccAmt;
	}
	public String getOwnerReg() {
		return ownerReg;
	}
	public void setOwnerReg(String ownerReg) {
		this.ownerReg = ownerReg;
	}
	public Integer getOwnerOplife() {
		return ownerOplife;
	}
	public void setOwnerOplife(Integer ownerOplife) {
		this.ownerOplife = ownerOplife;
	}
	public BigDecimal getSelfEmpCardAmt() {
		return selfEmpCardAmt;
	}
	public void setSelfEmpCardAmt(BigDecimal selfEmpCardAmt) {
		this.selfEmpCardAmt = selfEmpCardAmt;
	}
	public BigDecimal getSelfEmpCashAmt() {
		return selfEmpCashAmt;
	}
	public void setSelfEmpCashAmt(BigDecimal selfEmpCashAmt) {
		this.selfEmpCashAmt = selfEmpCashAmt;
	}
	public String getSelfEmpReg() {
		return selfEmpReg;
	}
	public void setSelfEmpReg(String selfEmpReg) {
		this.selfEmpReg = selfEmpReg;
	}
	public Integer getSelfEmpOplife() {
		return selfEmpOplife;
	}
	public void setSelfEmpOplife(Integer selfEmpOplife) {
		this.selfEmpOplife = selfEmpOplife;
	}
	public BigDecimal getWorkersCardAmt() {
		return workersCardAmt;
	}
	public void setWorkersCardAmt(BigDecimal workersCardAmt) {
		this.workersCardAmt = workersCardAmt;
	}
	public BigDecimal getWorkersCashAmt() {
		return workersCashAmt;
	}
	public void setWorkersCashAmt(BigDecimal workersCashAmt) {
		this.workersCashAmt = workersCashAmt;
	}
	public Integer getWorkersExperience() {
		return workersExperience;
	}
	public void setWorkersExperience(Integer workersExperience) {
		this.workersExperience = workersExperience;
	}
	public BigDecimal getUnempCashAmt() {
		return unempCashAmt;
	}
	public void setUnempCashAmt(BigDecimal unempCashAmt) {
		this.unempCashAmt = unempCashAmt;
	}
	public String getLoanUse() {
		return loanUse;
	}
	public void setLoanUse(String loanUse) {
		this.loanUse = loanUse;
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
	public Integer getMinLoanIssue() {
		return minLoanIssue;
	}
	public void setMinLoanIssue(Integer minLoanIssue) {
		this.minLoanIssue = minLoanIssue;
	}
	public Integer getMaxLoanIssue() {
		return maxLoanIssue;
	}
	public void setMaxLoanIssue(Integer maxLoanIssue) {
		this.maxLoanIssue = maxLoanIssue;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
