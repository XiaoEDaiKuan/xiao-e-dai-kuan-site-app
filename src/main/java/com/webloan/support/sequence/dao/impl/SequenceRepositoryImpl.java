package com.webloan.support.sequence.dao.impl;

import java.util.List;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.model.Sequence;
import com.webloan.support.sequence.dao.SequenceRepository;

public class SequenceRepositoryImpl extends BaseJpaRepositoryImpl implements SequenceRepository{

	@Override
	public Sequence modifySequenceBySeqType(String seqType) {
		Sequence s=null;
		Long vl=null;
		List<Sequence> sequences=this.queryList(Sequence.class, new String[]{"seqType"}, new Object[]{seqType});
		if(sequences.size()==1){
		   s=sequences.get(0);
		   	vl=s.getValue();
		   	s.setValue(vl+1);
		   	this.update(s);
		}
        Sequence s2=new Sequence();
        s2.setId(s.getId());
        s2.setLength(s.getLength());
        s2.setRemark(s.getRemark());
        s2.setSeqType(s.getSeqType());
        s2.setValue(vl);
		return s2;
	}

}
