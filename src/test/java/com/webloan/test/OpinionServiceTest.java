package com.webloan.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.opinion.service.OpinionService;
import com.webloan.question.service.QuestionService;

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
}
