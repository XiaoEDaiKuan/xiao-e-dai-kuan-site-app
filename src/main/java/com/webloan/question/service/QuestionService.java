package com.webloan.question.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.QstPrd;
import com.webloan.model.Question;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;
import com.webloan.question.view.QuestionView;

public interface QuestionService {

	//根据客户ID查询提问
	List<QstPrd> questionListByCustId(String strCustId);
	//根据问题ID查看详情
	Question questionDtById(String strQuestionId);
	//根据问题类型查询
	List<Question> questionListByKind(String kindTwo);
	//根据标题和内容区匹配问题
	List<Question> qryQuestion(String title);
	//根据问题id查询
	Question qryQuestionById(Long id);
	//保存问题
	void saveQuestion(String subject,String detail,String regionId,String email,String telephone);
	//根据IP查询所属城市
	RegionIP qryCityByIP(String ip);
	//查询大区所拥有的城市
	List<Region> qryArrea(String areaCode); 
	//大家都在问列表
	List<Question> qryHighQuest();
	
	void saveQuestion(QuestionView qv, String ipAddr);
	
	Page pagingQuestions(int pageIndex, int pageSize, String type);
	
	Page pagingQuestions(int pageIndex, int pageSize, String title, String kindTwo);
}
