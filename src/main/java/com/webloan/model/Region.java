package com.webloan.model;

import java.io.Serializable;

public class Region implements Serializable {

	private static final long serialVersionUID = 6813580758178182783L;
	
	private Long id;//ID
	private String code;//REGION_CODE
	private String name;//REGION_NAME
	private Integer level;//REGION_LEVEL
	private Integer order;//REGION_ORDER
	private String enName;//REGION_NAME_EN
	private String enShortName;//REGION_SHORTNAME_EN
	private Region parent;//PARENT_ID
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getEnShortName() {
		return enShortName;
	}
	public void setEnShortName(String enShortName) {
		this.enShortName = enShortName;
	}
	public Region getParent() {
		return parent;
	}
	public void setParent(Region parent) {
		this.parent = parent;
	}
}
