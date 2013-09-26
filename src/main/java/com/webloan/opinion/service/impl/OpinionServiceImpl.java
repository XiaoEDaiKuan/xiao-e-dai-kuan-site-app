package com.webloan.opinion.service.impl;

import java.util.List;

import com.webloan.model.Opinion;
import com.webloan.opinion.dao.OpinionRepository;
import com.webloan.opinion.service.OpinionService;

public class OpinionServiceImpl implements OpinionService{

	private OpinionRepository opinionRepository;
	
	@Override
	public void saveOpinion(String name, String email, String telephone,
			String content) {
	   opinionRepository.saveOpinion(name, email, telephone, content);	
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

	public OpinionRepository getOpinionRepository() {
		return opinionRepository;
	}

	public void setOpinionRepository(OpinionRepository opinionRepository) {
		this.opinionRepository = opinionRepository;
	}

}
