package com.webloan.question.service.impl;

import java.util.List;

import com.webloan.model.Question;
import com.webloan.question.dao.QuestionRepository;
import com.webloan.question.service.QuestionService;

public class QuestionServiceImpl implements QuestionService {

	private QuestionRepository questionRepository;
	
	/**
	 * 根据客户ID查询提问
	 */
	@Override
	public List<Question> questionListByCustId(String strCustId) {
        Long custId=strCustId==null?null:Long.valueOf(strCustId);
		return questionRepository.questionListByCustId(custId);
	}

	/**
	 * 根据问题ID查看详情
	 * 
	 */
	@Override
	public Question questionDtById(String strQuestionId) {
		Long questionId=strQuestionId==null?null:Long.valueOf(strQuestionId);
		return questionRepository.questionDtById(questionId);
	}

	public QuestionRepository getQuestionRepository() {
		return questionRepository;
	}

	public void setQuestionRepository(QuestionRepository questionRepository) {
		this.questionRepository = questionRepository;
	}


}
