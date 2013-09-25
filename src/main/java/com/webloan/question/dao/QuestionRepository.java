package com.webloan.question.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.QstPrd;
import com.webloan.model.Question;

public interface QuestionRepository extends BaseJpaRepository {
	
	//根据客户ID查询提问
	List<QstPrd> questionListByCustId(Long custId);
	//根据问题ID查看详情
	Question questionDtById(Long questionId);
	//根据问题类型查询
	List<Question> questionListByKind(String kindTwo);
	//根据标题和内容区匹配问题
	List<Question> qryQuestion(String title);

}

