package com.webloan.question.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Queriable;
import com.webloan.model.QstPrd;
import com.webloan.model.Question;
import com.webloan.question.dao.QuestionRepository;

public class QuestionRepositoryImpl extends BaseJpaRepositoryImpl implements
		QuestionRepository {

	/**
	 * 根据客户id,查找该客户提交的问题
	 */
	@Override
	public List<QstPrd> questionListByCustId(Long custId) {

		StringBuilder jpql = new StringBuilder(
				"select new com.webloan.model.QstPrd(q.id,p.id, p.name,q.subject,q.status,q.askTime,q.detail,q.region) ")
				.append(" from Question q, Product p where q.productID=p.id and q.custID=:custId ");

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("custId", custId);

		TypedQuery<QstPrd> query = entityManager.createQuery(jpql.toString(),QstPrd.class);

		for (Map.Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}

		return query.getResultList();
	}

	/**
	 * 根据问题id查找该问题的详情
	 */
	@Override
	public Question questionDtById(Long questionId) {

		return this.load(Question.class, questionId);
	}

	// 根据问题类型查询
	@Override
	public List<Question> questionListByKind(String kindTwo) {
		List<Question> questions = this.queryList(Question.class,
				new String[] { "kindTwo" }, new Object[] { kindTwo });
		for (Question q : questions) {
			q.getAnswers();
		}
		return questions;

	}

    /**
     * 匹配主题或内容
     */
	@Override
	public List<Question> qryQuestion(String title) {
		
		String jpql = "select q from Question q  where q.subject like :subject or q.detail like :subject";

		TypedQuery<Question> query = entityManager.createQuery(jpql, Question.class);
		query.setParameter("subject", "%"+title+"%");
		
		return query.getResultList();
	}

}
