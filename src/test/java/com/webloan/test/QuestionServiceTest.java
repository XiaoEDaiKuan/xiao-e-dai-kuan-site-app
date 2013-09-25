package com.webloan.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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
        String strCustId="";
		List<Question> qs= questionService.questionListByCustId(strCustId);
		for(int i=0;i<qs.size();i++){
			System.out.println(""+qs.get(i).getId());
			System.out.println(""+qs.get(i).getAskedBy());
			System.out.println(""+qs.get(i).getDetail());
			System.out.println(""+qs.get(i).getEmail());
			System.out.println(""+qs.get(i).getKindOne());
			System.out.println(""+qs.get(i).getKindTwo());
			System.out.println(""+qs.get(i).getStatus());
			System.out.println(""+qs.get(i).getTag());
			System.out.println(""+qs.get(i).getTelephone());
			System.out.println(""+qs.get(i).getCustID());
			System.out.println(""+qs.get(i).getProductID());
			System.out.println(""+qs.get(i).getAskTime());
			System.out.println(""+qs.get(i).getRegion().getName());
		}
	}
	
	@After
	public void end() {
		appContext = null;
	}

}
