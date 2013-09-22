package com.webloan.support.sequence;

public enum ESeqType {

	/**
	 * 客户号序列
	 */
	CI_NO_SEQ ("0");
	
	
	ESeqType (String sequence){
		this.sequence = sequence;
	}
	
	private final String sequence;

	public String getSequence() {
		return sequence;
	}
	
	
}
