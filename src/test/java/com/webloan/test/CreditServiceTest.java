package com.webloan.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.common.Page;
import com.webloan.credit.service.CreditService;
import com.webloan.model.Credit;

public class CreditServiceTest {
	private ApplicationContext appContext;

	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext(
				"classpath*:beans/**/*.xml");
	}

	@Test
	public void testCreditListByUser() {
		CreditService creditService = appContext.getBean("creditService",
				CreditService.class);
		Page credits = creditService.creditListByUser("1",1,10);
		for (int i = 0; i < credits.getItems().size(); i++) {

			System.out.println(((Credit) credits.getItems().get(i)).getId());
			System.out.println(((Credit) credits.getItems().get(i)).getCustName());
			System.out.println(((Credit) credits.getItems().get(i)).getCreditType());
			System.out.println(((Credit) credits.getItems().get(i)).getCreditMin());
			System.out.println(((Credit) credits.getItems().get(i)).getCreditMax());
			System.out.println(((Credit) credits.getItems().get(i)).getCalTime());

		}
	}
	
	@Test
	public void testDeleteCredit(){
		CreditService creditService = appContext.getBean("creditService",
				CreditService.class);
         creditService.deleteCredit("2");
         System.out.println("credit delete");
		
	}

	@Test
	public void testSaveCredit(){
		CreditService creditService = appContext.getBean("creditService",
				CreditService.class);
		String strCustId="1"; 
		String strCreditType="0"; 
		String strCustName="liuhg";
		String strCustTelephone="13917367496"; 
		String strCreditMin="250000"; 
		String strCreditMax="500000";
         creditService.saveCredit(strCustId, strCreditType, strCustName, strCustTelephone, strCreditMin, strCreditMax);
         System.out.println("credit delete");
		
	}

	@After
	public void end() {
		appContext = null;
	}


}
