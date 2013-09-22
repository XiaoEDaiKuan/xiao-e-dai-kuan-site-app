package com.webloan.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Cust implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3780490727758452792L;

	   private Long id ; //ID
	   private String custName;//客户姓名
	   private String custNO;//客户帐号
	   private String logonPasswd;//网站登录密码
	   private String  mobileNO;//手机号
	   private String  idType;//证件类型
	   private String  idNO;//证件号码
	   private String  email;//电子邮箱
	   private String  postCode;//邮编
	   private String  address;//住址
	   private Timestamp setupTime;//注册时间
	   private String setupIP;//注册时的IP
	   private String status="1";//状态,默认未激活
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustNO() {
		return custNO;
	}
	public void setCustNO(String custNO) {
		this.custNO = custNO;
	}
	public String getLogonPasswd() {
		return logonPasswd;
	}
	public void setLogonPasswd(String logonPasswd) {
		this.logonPasswd = logonPasswd;
	}
	public String getMobileNO() {
		return mobileNO;
	}
	public void setMobileNO(String mobileNO) {
		this.mobileNO = mobileNO;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getIdNO() {
		return idNO;
	}
	public void setIdNO(String idNO) {
		this.idNO = idNO;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getSetupTime() {
		return setupTime;
	}
	public void setSetupTime(Timestamp setupTime) {
		this.setupTime = setupTime;
	}
	public String getSetupIP() {
		return setupIP;
	}
	public void setSetupIP(String setupIP) {
		this.setupIP = setupIP;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
