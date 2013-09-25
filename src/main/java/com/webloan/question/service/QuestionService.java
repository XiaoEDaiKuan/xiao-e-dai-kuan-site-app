package com.webloan.question.service;

import java.util.List;

import com.webloan.model.QstPrd;
import com.webloan.model.Question;

public interface QuestionService {

	//根据客户ID查询提问
	List<QstPrd> questionListByCustId(String strCustId);
	//根据问题ID查看详情
	Question questionDtById(String strQuestionId);
	//根据问题类型查询
	List<Question> questionListByKind(String kindTwo);
	//根据标题和内容区匹配问题
	List<Question> qryQuestion(String title);
	
}
