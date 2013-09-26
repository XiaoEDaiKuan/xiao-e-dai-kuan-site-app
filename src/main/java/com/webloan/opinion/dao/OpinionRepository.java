package com.webloan.opinion.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Opinion;

public interface OpinionRepository  extends BaseJpaRepository {
	//保存意见
	public void saveOpinion(String name,String email,String telephone,String content);
    //查询意见列表
	public List<Opinion>  listOpinion();
	//根据id查详细
	public Opinion qryOpinionById(Long id);
	//保存回复信息
	public Opinion saveOpinionAnswer(Long id);

}
