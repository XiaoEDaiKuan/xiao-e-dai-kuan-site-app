package com.webloan.model;

import java.io.Serializable;

public class CorpIP implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3186208807224406795L;

	private Long id;
	private String startIP;
	private String endIP;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStartIP() {
		return startIP;
	}
	public void setStartIP(String startIP) {
		this.startIP = startIP;
	}
	public String getEndIP() {
		return endIP;
	}
	public void setEndIP(String endIP) {
		this.endIP = endIP;
	}
	
}
