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
import com.webloan.order.service.OrderService;
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
        String title="玖富";
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

	@After
	public void end() {
		appContext = null;
	}

}
