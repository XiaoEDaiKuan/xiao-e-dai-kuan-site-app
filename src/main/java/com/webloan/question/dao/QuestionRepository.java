package com.webloan.question.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.QstPrd;
import com.webloan.model.Question;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;

public interface QuestionRepository extends BaseJpaRepository {
	
	//根据客户ID查询提问
	List<QstPrd> questionListByCustId(Long custId);
	//根据问题ID查看详情
	Question questionDtById(Long questionId);
	//根据问题类型查询
	List<Question> questionListByKind(String kindTwo);
	//根据标题和内容区匹配问题
	List<Question> qryQuestion(String title);
    //根据id查询
	Question qryQuestionById(Long id);
	//保存问题
	void saveQuestion(String subject,String detail,Long regionId,String email,String telephone);
	//根据IP查询所属城市
	RegionIP qryCityByIP(String ip);
	//查询大区所拥有的城市
	List<Region> qryArrea(String areaCode); 

}

