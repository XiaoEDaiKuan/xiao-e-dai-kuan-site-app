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
	
	private String posJournal;//POS
	private String operCert;//OPER_CERT
	private String localCert;//LOCAL_CERT
	private String operDevice;//OPER_DEVICE
	
	private String overdue;//OVERDUE
	private BigDecimal annualIncome;//ANNUAL_INCOME
	private String estateType;//ESTATE_TYPE
	private Integer estateAge;//ESTATE_AGE
	
	private String incomeProof;//INCOME_PROOF
	private String loanCert;//LOAN_CERT
	private String vehicleCert;//VEHICLE_CERT
	private String estateCert;//ESTATE_CERT
	
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
	public String getPosJournal() {
		return posJournal;
	}
	public void setPosJournal(String posJournal) {
		this.posJournal = posJournal;
	}
	public String getOperCert() {
		return operCert;
	}
	public void setOperCert(String operCert) {
		this.operCert = operCert;
	}
	public String getLocalCert() {
		return localCert;
	}
	public void setLocalCert(String localCert) {
		this.localCert = localCert;
	}
	public String getOperDevice() {
		return operDevice;
	}
	public void setOperDevice(String operDevice) {
		this.operDevice = operDevice;
	}
	public String getOverdue() {
		return overdue;
	}
	public void setOverdue(String overdue) {
		this.overdue = overdue;
	}
	public BigDecimal getAnnualIncome() {
		return annualIncome;
	}
	public void setAnnualIncome(BigDecimal annualIncome) {
		this.annualIncome = annualIncome;
	}
	public String getEstateType() {
		return estateType;
	}
	public void setEstateType(String estateType) {
		this.estateType = estateType;
	}
	public Integer getEstateAge() {
		return estateAge;
	}
	public void setEstateAge(Integer estateAge) {
		this.estateAge = estateAge;
	}
	public String getIncomeProof() {
		return incomeProof;
	}
	public void setIncomeProof(String incomeProof) {
		this.incomeProof = incomeProof;
	}
	public String getLoanCert() {
		return loanCert;
	}
	public void setLoanCert(String loanCert) {
		this.loanCert = loanCert;
	}
	public String getVehicleCert() {
		return vehicleCert;
	}
	public void setVehicleCert(String vehicleCert) {
		this.vehicleCert = vehicleCert;
	}
	public String getEstateCert() {
		return estateCert;
	}
	public void setEstateCert(String estateCert) {
		this.estateCert = estateCert;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
