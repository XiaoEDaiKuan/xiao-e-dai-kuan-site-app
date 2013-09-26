package com.webloan.opinion.dao.impl;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Page;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Opinion qryOpinionById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Opinion saveOpinionAnswer(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
