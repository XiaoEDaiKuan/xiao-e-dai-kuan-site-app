package com.webloan.test;


import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xml.sax.SAXException;

import com.meterware.httpunit.HttpUnitOptions;
import com.meterware.httpunit.PostMethodWebRequest;
import com.meterware.httpunit.WebConversation;
import com.meterware.httpunit.WebRequest;
import com.meterware.httpunit.WebResponse;
import com.webloan.user.service.UserService;

public class UserServiceTest {
	private ApplicationContext appContext;
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());
	protected WebConversation converstaion;
	protected static final String URL_PREFIX = "http://127.0.0.1:8080/web-loan/";

	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext(
				"classpath*:beans/**/*.xml");
		
		HttpUnitOptions.setDefaultCharacterSet("utf-8");
		HttpUnitOptions.setExceptionsThrownOnScriptError(false);//屏蔽错误自动输出
		converstaion = new WebConversation();

	}

	@Test
	public void testCreateUser(){
		UserService userService = appContext.getBean("userService",
				UserService.class);
		String custName="刘海光"; 
		String logonPasswd="0"; 
		String mobileNO="18621687579";
		String email="liuhg5@aliyun.com"; 
		String idType="0"; 
		String idNO="210726197110351718";
		String postCode="100000";
		String address="上海浦东长清路75弄18号501室";
		String setupIP="123.8.7.6";
		
		userService.createUser(custName, logonPasswd, mobileNO, idType, idNO, email, postCode, address,setupIP,null);
         
         System.out.println("user save");
		
	}

	@After
	public void end() {
		appContext = null;
		converstaion = null;
	}


}
