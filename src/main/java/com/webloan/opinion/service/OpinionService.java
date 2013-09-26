package com.webloan.opinion.service;

import java.util.List;

import com.webloan.model.Opinion;

public interface OpinionService {
	//保存意见
	public void saveOpinion(String name,String email,String telephone,String content);
    //查询意见列表
	public List<Opinion>  listOpinion();
	//根据id查详细
	public Opinion qryOpinionById(Long id);
	//保存回复信息
	public void saveOpinionAnswer(Long id,String answerContent,String answerBy);
}
