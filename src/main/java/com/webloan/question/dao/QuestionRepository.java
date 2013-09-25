package com.webloan.question.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Question;

public interface QuestionRepository extends BaseJpaRepository {
	
	//根据客户ID查询提问
	List<Question> questionListByCustId(Long custId);
	//根据问题ID查看详情
	Question questionDtById(Long questionId);
}
