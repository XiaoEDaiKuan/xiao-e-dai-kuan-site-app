package com.webloan.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.model.Opinion;
import com.webloan.opinion.service.OpinionService;


public class OpinionServiceTest {
	private ApplicationContext appContext;

	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext(
				"classpath*:beans/**/*.xml");
	}

	@Test
	public void testSaveOpinion(){
		OpinionService opinionService = appContext.getBean("opinionService",
				OpinionService.class);
		String name="陆家嘴";
		String email="ljz@aliyun.com";
		String telephone="1778888";
		String content="这是一个测试，随便造的数据";
		
		opinionService.saveOpinion(name, email, telephone, content);

		System.out.println("save opinion ok");
	}

	@Test
	public void testListOpinion(){
		OpinionService opinionService = appContext.getBean("opinionService",
				OpinionService.class);
		
		List<Opinion> ops=opinionService.listOpinion();
		for(Opinion o:ops){
			System.out.println(""+o.getName());
			System.out.println(""+o.getEmail());
			System.out.println(""+o.getTelephone());
			System.out.println(""+o.getSetupTime());
		}

		System.out.println("opinion list ok");
	}
	@Test
	public void testQryOpinionById(){
		OpinionService opinionService = appContext.getBean("opinionService",
				OpinionService.class);
		Long id=Long.valueOf(1);
		Opinion o=opinionService.qryOpinionById(id);
			System.out.println(""+o.getName());
			System.out.println(""+o.getEmail());
			System.out.println(""+o.getTelephone());
			System.out.println(""+o.getSetupTime());

		System.out.println("opinion qry by id ok");
	}
	@Test
	public void testSaveOpinionAnswer(){
		OpinionService opinionService = appContext.getBean("opinionService",
				OpinionService.class);
		Long id=Long.valueOf(1);
		String answerContent="多谢意见和建议，我们尽快改正";
		String answerBy="玖富信贷员";
		opinionService.saveOpinionAnswer(id, answerContent, answerBy);
		
		System.out.println("opinion answer save ok");
	}

}
