package com.webloan.model;

import java.io.Serializable;

public class CityLoan implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6663509161337112881L;
	
	   private Long id;
	   private Region region;
	   private String status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


}
