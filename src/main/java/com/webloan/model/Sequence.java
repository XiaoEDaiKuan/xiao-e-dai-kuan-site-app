package com.webloan.model;

import java.io.Serializable;

public class Sequence implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6170234619362735267L;

	private Long    id;
	private String  seqType;
	private Long    value;
	private Long    length;
	private String  remark;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSeqType() {
		return seqType;
	}
	public void setSeqType(String seqType) {
		this.seqType = seqType;
	}
	public Long getValue() {
		return value;
	}
	public void setValue(Long value) {
		this.value = value;
	}
	public Long getLength() {
		return length;
	}
	public void setLength(Long length) {
		this.length = length;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
