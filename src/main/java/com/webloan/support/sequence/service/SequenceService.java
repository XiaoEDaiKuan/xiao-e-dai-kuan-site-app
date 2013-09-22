package com.webloan.support.sequence.service;

import com.webloan.support.sequence.ESeqType;


/**
 * 序列号Service
 * 
 * 
 */
public interface SequenceService {

	/**
	 * 创建指定类型序列
	 * @param seqType
	 * @return
	 */
	String createSequence(ESeqType seqType) ;

}
