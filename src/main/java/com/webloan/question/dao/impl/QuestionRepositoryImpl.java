package com.webloan.question.dao.impl;

import java.util.List;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.model.Question;
import com.webloan.question.dao.QuestionRepository;

public class QuestionRepositoryImpl extends BaseJpaRepositoryImpl implements QuestionRepository{

	/**
	 * 根据客户id,查找该客户提交的问题
	 */
	@Override
	public List<Question> questionListByCustId(Long custId) {
		
		return this.queryList(Question.class, new String[]{"custID"}, new Object[]{custId});
	}

	/**
	 * 根据问题id查找该问题的详情
	 */
	@Override
	public Question questionDtById(Long questionId) {

		return this.load(Question.class ,questionId );
	}

}
