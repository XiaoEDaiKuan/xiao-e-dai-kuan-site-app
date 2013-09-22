package com.webloan.model;

import java.io.Serializable;

public class IpRec implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 372178233104924566L;

	Long id;//
	String setupDate;// 注册日期
	String setupIP;// 注册IP地址
	Integer setupIPCnt;// 当日此IP地址注册的次数

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSetupDate() {
		return setupDate;
	}

	public void setSetupDate(String setupDate) {
		this.setupDate = setupDate;
	}

	public String getSetupIP() {
		return setupIP;
	}

	public void setSetupIP(String setupIP) {
		this.setupIP = setupIP;
	}

	public Integer getSetupIPCnt() {
		return setupIPCnt;
	}

	public void setSetupIPCnt(Integer setupIPCnt) {
		this.setupIPCnt = setupIPCnt;
	}

}
