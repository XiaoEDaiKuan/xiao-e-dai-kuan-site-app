package com.webloan.test;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.test.service.SpringTestService;


public class SpringTest {

	private ApplicationContext appContext;
	
	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext("classpath*:beans/**/*.xml");
	}
	
	@Test
	public void testSpringBean() {
		SpringTestService sts = appContext.getBean("springTestService", SpringTestService.class);
		sts.test();
	}
	
	@After
	public void end() {
		appContext = null;
	}
}
