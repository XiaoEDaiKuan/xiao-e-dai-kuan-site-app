package com.webloan.question.dao.impl;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Queriable;
import com.webloan.exception.BizException;
import com.webloan.model.Answer;
import com.webloan.model.QstPrd;
import com.webloan.model.Question;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;
import com.webloan.question.QuestionConstant;
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

		TypedQuery<QstPrd> query = entityManager.createQuery(jpql.toString(),
				QstPrd.class);

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
		return questions;

	}

	/**
	 * 匹配主题或内容
	 */
	@Override
	public List<Question> qryQuestion(String title) {

		String jpql = "select q from Question q  where q.subject like :subject or q.detail like :subject";

		TypedQuery<Question> query = entityManager.createQuery(jpql,
				Question.class);
		query.setParameter("subject", "%" + title + "%");
		List<Question> questions = query.getResultList();
		for (Question q : questions) {
			q.getAnswers();
		}

		return questions;
	}

	/**
	 * 根据id查询
	 */
	@Override
	public Question qryQuestionById(Long id) {
		return this.load(Question.class, id);
	}

	/**
	 * 保存问题
	 */
	@Override
	public void saveQuestion(String subject, String detail, Long regionId,
			String email, String telephone) {
		Question q = new Question();
		q.setDetail(detail);
		q.setSubject(subject);
		Region r = this.load(Region.class, regionId);
		q.setRegion(r);
		q.setEmail(email);
		q.setTelephone(telephone);
		this.save(q);
	}

	/**
	 * 根据IP查询所属城市
	 */
	@Override
	public RegionIP qryCityByIP(String ip) {

		String jpql = "select r from RegionIP r  where inet_aton(r.ipStart)<=inet_aton(:ip) and inet_aton(:ip)<=inet_aton(r.ipEnd)";

		TypedQuery<RegionIP> query = entityManager.createQuery(jpql,
				RegionIP.class);
		query.setParameter("ip", ip);
		List<RegionIP> regionIPs = query.getResultList();
		if (null == regionIPs || regionIPs.size() == 0) {
			// throw new BizException("");
			return null;
		}

		return regionIPs.get(0);
	}

	@Override
	public List<Region> qryArrea(String areaCode) {
		String jpql = "select r from CityLoan c,Region r  where  c.arreaCode=:areaCode and c.region.id=r.id";
		TypedQuery<Region> query = entityManager
				.createQuery(jpql, Region.class);

		query.setParameter("areaCode", areaCode);

		List<Region> rs = query.getResultList();
		if (null == rs || rs.size() == 0) {
			// throw new BizException("");
			return null;
		}

		return rs;
	}

	@Override
	public List<Question> qryHighQuest() {
        List<Question> qs=this.queryList(Question.class, new String[]{""}, new Object[]{}); 
        for(Question q:qs){
        	q.getAnswers();
        }
		return qs;
	}

}
