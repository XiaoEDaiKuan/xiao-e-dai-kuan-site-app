package com.webloan.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.model.Answer;
import com.webloan.model.QstPrd;
import com.webloan.model.Question;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;
import com.webloan.order.service.OrderService;
import com.webloan.question.QuestionConstant;
import com.webloan.question.service.QuestionService;

public class QuestionServiceTest {
	private ApplicationContext appContext;

	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext(
				"classpath*:beans/**/*.xml");
	}

	@Test
	public void testQuestionListByCustId(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
        String strCustId="1";
		List<QstPrd> qs= questionService.questionListByCustId(strCustId);
	 System.out.println("=======list question by cust id===========");	
		for(QstPrd qp:qs){
			System.out.println(""+qp.getQuestionId());
			System.out.println(""+qp.getPrdId());
			System.out.println(""+qp.getPrdName());
			System.out.println(""+qp.getSubject());
			System.out.println(""+qp.getAskTime());
			System.out.println(""+qp.getKindTwo());
			System.out.println("status="+qp.getStatus());
			System.out.println(""+qp.getTag());
			System.out.println(""+qp.getTelephone());
			System.out.println(""+qp.getCustID());
			System.out.println(""+qp.getAskTime());
			System.out.println(""+qp.getRegion().getName());
			System.out.println(""+qp.getAskedBy());
		}
	}
	
	@Test
	public void TestQuestionListByKind(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
        String kindTwo="0";
		List<Question> qs= questionService.questionListByKind(kindTwo);
		System.out.println("=======list question by kind===========");
		for(Question qt:qs){
			System.out.println(""+qt.getAskedBy());
			System.out.println(""+qt.getDetail());
			System.out.println(""+qt.getEmail());
			System.out.println(""+qt.getStatus());
			System.out.println(""+qt.getSubject());
			System.out.println(""+qt.getTag());
			System.out.println(""+qt.getRegion().getName());
			System.out.println("answerCnt="+qt.getAnswers());
		}		
	}

	@Test
	public void TestQryQuestion(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
        String title="午夜";
		List<Question> qs= questionService.qryQuestion(title);
		System.out.println("=======list question by title===========");
		for(Question qt:qs){
			System.out.println(""+qt.getAskedBy());
			System.out.println(""+qt.getDetail());
			System.out.println(""+qt.getEmail());
			System.out.println(""+qt.getStatus());
			System.out.println(""+qt.getSubject());
			System.out.println(""+qt.getTag());
			System.out.println(""+qt.getRegion().getName());
			System.out.println("answerCnt="+qt.getAnswers());
		}		
	}
	@Test
	public void TestSaveQuestion(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
        String subject="贷款问答-测试1";
        String detail="午夜电话亭";
        String regionId="11";
        String email="wenlinfeng@gmail.com";
        String  telephone="13917367496";
		questionService.saveQuestion(subject, detail, regionId, email, telephone);
		
		System.out.println("save question ok");
	}
	@Test
	public void TestQryCityByIP(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
        String ip="218.1.101.19";
		RegionIP r= questionService.qryCityByIP(ip);
		System.out.println("=======qry city by ip===========");
			System.out.println(""+r.getAreaName());
			System.out.println(""+r.getIpEnd());
			System.out.println(""+r.getIpStart());
			System.out.println(""+r.getRemark());
			System.out.println(""+r.getRegion().getName());
	}

	@Test
	public void TestQryArea(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
        String areaCode=QuestionConstant.XI_NAN;
		List<Region> rs= questionService.qryArrea(areaCode);
		System.out.println("=======qry city arrea code===========");
		for(Region r:rs){
			System.out.println(""+r.getName());
			System.out.println(""+r.getEnShortName());
			System.out.println(""+r.getId());
		}
	}
	@Test
	public void TestQryHighQuest(){
		QuestionService questionService = appContext.getBean("questionService",
				QuestionService.class);
		List<Question> qs= questionService.qryHighQuest();
		System.out.println("=======list high  question ===========");
		for(Question qt:qs){
			System.out.println(""+qt.getAskedBy());
			System.out.println(""+qt.getDetail());
			System.out.println(""+qt.getEmail());
			System.out.println(""+qt.getStatus());
			System.out.println(""+qt.getSubject());
			System.out.println(""+qt.getTag());
			System.out.println(""+qt.getRegion().getName());
			System.out.println("answerCnt="+qt.getAnswers());
		}		
		
	}

	@After
	public void end() {
		appContext = null;
	}

}
