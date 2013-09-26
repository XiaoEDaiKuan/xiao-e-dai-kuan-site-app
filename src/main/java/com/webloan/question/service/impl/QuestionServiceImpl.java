package com.webloan.question.service.impl;

import java.util.List;

import com.webloan.model.QstPrd;
import com.webloan.model.Question;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;
import com.webloan.question.dao.QuestionRepository;
import com.webloan.question.service.QuestionService;

public class QuestionServiceImpl implements QuestionService {

	private QuestionRepository questionRepository;
	
	/**
	 * 根据客户ID查询提问
	 */
	@Override
	public List<QstPrd> questionListByCustId(String strCustId) {
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
    /**
     * 根据问题类型查询
     */
	@Override
	public List<Question> questionListByKind(String kindTwo) {
		
		return questionRepository.questionListByKind(kindTwo) ;
	}

	
	public QuestionRepository getQuestionRepository() {
		return questionRepository;
	}

	public void setQuestionRepository(QuestionRepository questionRepository) {
		this.questionRepository = questionRepository;
	}

	/**
	 * 根据标题和内容查询
	 */
	@Override
	public List<Question> qryQuestion(String title) {

		return questionRepository.qryQuestion(title);
	}
    /**
     * 根据id查询
     */
	@Override
	public Question qryQuestionById(String strId) {
        Long id=strId==null?null:Long.valueOf(strId);
		return questionRepository.qryQuestionById(id);
	}

	/**
	 * 保存问题
	 */
	@Override
	public void saveQuestion(String subject, String detail, String regionId,
			String email, String telephone) {
      questionRepository.saveQuestion(subject, detail, Long.valueOf(regionId), email, telephone);		
	}

	/**
	 * 根据IP查询所属城市
	 */
	@Override
	public RegionIP qryCityByIP(String ip) {
		
		return questionRepository.qryCityByIP(ip);
	}
    /**
     * 查询大区所拥有的城市
     */
	@Override
	public List<Region> qryArrea(String areaCode) {
		return questionRepository.qryArrea(areaCode);
	}

}
