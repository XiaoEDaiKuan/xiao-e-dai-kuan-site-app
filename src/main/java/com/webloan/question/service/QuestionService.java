package com.webloan.question.service;

import java.util.List;

import com.webloan.model.Question;

public interface QuestionService {

	//根据客户ID查询提问
	List<Question> questionListByCustId(String strCustId);
	//根据问题ID查看详情
	Question questionDtById(String strQuestionId);
	
}
