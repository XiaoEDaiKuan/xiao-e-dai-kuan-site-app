package com.webloan.support.sequence.service.impl;


import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.webloan.exception.BizException;
import com.webloan.model.Sequence;
import com.webloan.support.sequence.ESeqType;
import com.webloan.support.sequence.SequenceConstants;
import com.webloan.support.sequence.dao.SequenceRepository;
import com.webloan.support.sequence.service.SequenceService;



public class SequenceServiceImpl implements SequenceService {
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());
	
	public String createSequence(ESeqType seqType) {
		
		//查询指定类型序列
		Sequence objSeqInfo = sequenceRepository.modifySequenceBySeqType(seqType.getSequence());
		
		if(objSeqInfo == null){
			log.error(SequenceConstants.LOG_EXCEPTION_SEQ_NOT_FOUND, new Object[]{seqType.getSequence()});
			throw new BizException(String.format(SequenceConstants.LOG_EXCEPTION_SEQ_NOT_FOUND, seqType.getSequence()));
		}
		
		//生成序列号
		String strSeq = StringUtils.leftPad(
				objSeqInfo.getValue().toString(), 
				objSeqInfo.getLength().intValue(), 
				PAD_CHAR
		);
		log.trace("Generated sequence[{}] : {}", new Object[]{objSeqInfo.getRemark(), strSeq});
		
		return strSeq;
	}
	
	private SequenceRepository sequenceRepository;
	

	public SequenceRepository getSequenceRepository() {
		return sequenceRepository;
	}


	public void setSequenceRepository(SequenceRepository sequenceRepository) {
		this.sequenceRepository = sequenceRepository;
	}

	private static final char PAD_CHAR = '0';

}
