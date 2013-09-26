package com.webloan.opinion.dao.impl;


import java.sql.Timestamp;
import java.util.List;

import com.webloan.common.BaseJpaRepositoryImpl;

import com.webloan.model.Opinion;
import com.webloan.opinion.OpinionConstant;
import com.webloan.opinion.dao.OpinionRepository;
import com.webloan.util.DateUtils;

public class OpinionRepositoryImpl extends BaseJpaRepositoryImpl implements OpinionRepository{

	@Override
	public void saveOpinion(String name, String email, String telephone,
			String content) {
		Opinion o=new Opinion();
		o.setContent(content);
		o.setName(name);
		o.setStatus(OpinionConstant.NON_DEALT);
		o.setEmail(email);
		o.setTelephone(telephone);
		Timestamp setupTime = DateUtils.getTimeStamp();
		o.setSetupTime(setupTime);
		o.setAnswerTime(null);
		this.save(o);
	}

	@Override
	public List<Opinion> listOpinion() {
		return this.queryList(Opinion.class, new String[]{}, new Object[]{});
	}

	@Override
	public Opinion qryOpinionById(Long id) {
		
		return this.load(Opinion.class, id);
	}

	@Override
	public void saveOpinionAnswer(Long id,String answerContent,String answerBy) {
		Opinion o=this.load(Opinion.class, id);
		o.setAnswerCont(answerContent);
		o.setAnswerBy(answerBy);
		o.setAnswerTime(DateUtils.getTimeStamp());
		this.save(o);
	}

}
