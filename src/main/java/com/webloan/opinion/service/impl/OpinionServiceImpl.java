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
		// 
		return opinionRepository.listOpinion();
	}

	@Override
	public Opinion qryOpinionById(Long id) {
		// 
		return opinionRepository.qryOpinionById(id);
	}

	@Override
	public void saveOpinionAnswer(Long id,String answerContent,String answerBy) {
		// =
		opinionRepository.saveOpinionAnswer(id,answerContent,answerBy);
	}

	public OpinionRepository getOpinionRepository() {
		return opinionRepository;
	}

	public void setOpinionRepository(OpinionRepository opinionRepository) {
		this.opinionRepository = opinionRepository;
	}

}
