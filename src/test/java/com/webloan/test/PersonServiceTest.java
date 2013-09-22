package com.webloan.test;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.test.model.Person;
import com.webloan.test.service.PersonService;


public class PersonServiceTest {

	private ApplicationContext appContext;
	
	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext("classpath*:beans/**/*.xml");
	}
	
	@Test
	public void testSave() {
		PersonService ps = appContext.getBean("personService", PersonService.class);
		Person p = new Person();
		p.setName("Lonnie WEN");
		p.setAge(26);
		ps.save(p);
	}
	
	@Test
	public void testUpdate() {
		PersonService ps = appContext.getBean("personService", PersonService.class);
		Person p = new Person();
		p.setId(4L);
		p.setName("文林峰");
		p.setAge(28);
		ps.update(p);
	}
	
	@Test
	public void testDeletePerson() {
		PersonService ps = appContext.getBean("personService", PersonService.class);
		ps.deletePerson(3L);
	}
	
	@Test
	public void testGetPersons() {
		PersonService ps = appContext.getBean("personService", PersonService.class);
		System.out.println(ps.getPersons());
	}
	
	@After
	public void end() {
		appContext = null;
	}
}
