package com.webloan.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.webloan.message.service.MessageService;
import com.webloan.model.Message;

public class MessageServiceTest {
	private ApplicationContext appContext;

	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext(
				"classpath*:beans/**/*.xml");
	}

	@Test
	public void testMessageListByUser() {
		MessageService messageService = appContext.getBean("messageService",
				MessageService.class);
		List<Message> messages = messageService.messageListByUser("1");
		for (int i = 0; i < messages.size(); i++) {

			System.out.println(((Message) messages.get(i)).getId());
			System.out.println(((Message) messages.get(i)).getFromPerson());
			System.out.println(((Message) messages.get(i)).getSubject());
			System.out.println(((Message) messages.get(i)).getSendTime());

		}
	}
	
	@Test
	public void testMessageCountByStatus() {
		MessageService messageService = appContext.getBean("messageService",
				MessageService.class);
		List<Object> object = messageService.messageCountByStatus();
		for (int i = 0; i < object.size(); i++) {

			System.out.println(((Number) object.get(i)).intValue());

		}
	}
	
	@Test
	public void testMessageDetail() {
		MessageService messageService = appContext.getBean("messageService",
				MessageService.class);
		Message message = messageService.messageDetail("1");
		System.out.println("subject="+message.getSubject());
		System.out.println("content="+message.getContent());
	}

	@Test
	public void testDeleteMessage() {
		MessageService messageService = appContext.getBean("messageService",
				MessageService.class);
		 messageService.deleteMessage("6");
	}
	
	@After
	public void end() {
		appContext = null;
	}

}
