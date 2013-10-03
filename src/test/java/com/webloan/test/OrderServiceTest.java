package com.webloan.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.order.OrderStatus;
import com.webloan.common.Page;
import com.webloan.model.Order;
import com.webloan.model.Question;
import com.webloan.model.RequireInfo;
import com.webloan.order.service.OrderService;

public class OrderServiceTest {
	private ApplicationContext appContext;

	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext(
				"classpath*:beans/**/*.xml");
	}

	@Test
	public void testOrderListByUser() {
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		Page orderpage= orderService.orderListByUser("1",1,10);
		for (int i = 0; i < orderpage.getItems().size(); i++) {

			System.out.println(((Order) orderpage.getItems().get(i)).getId());
			System.out.println(((Order) orderpage.getItems().get(i)).getProduct().getName());
			System.out.println(((Order) orderpage.getItems().get(i)).getApprovAmt());
			System.out.println(((Order) orderpage.getItems().get(i)).getOrderTime());
			System.out.println(((Order) orderpage.getItems().get(i)).getStatus());

		}
	}
	@Test
	public void testOrderCancel() {
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		orderService.modifyOrderStatus("1");
		System.out.println("update order status");
	}

	@Test
	public void testOrderCount() {
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		int count=orderService.orderCount();
		System.out.println("order count="+count);
	}
	
	@Test
	public void testDeleteOrder() {
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		orderService.deleteOrder("1");
		System.out.println("order delete");
	}
	
	@Test
	public void testCreateOrder() {
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		String productId="1";
		String custId="1";
		String applyName="刘海光";
		String applyTelephone="22222";
		String applyAmt="8989.12";
		String custRegion="上海";
		orderService.createOrder(productId,custId,applyName,applyTelephone,applyAmt,custRegion);
		System.out.println("order create");
	}

	@Test
	public void testOrderEmail(){
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		String productId="1";
		String email="haiguangliu@aliyun.com";
		orderService.orderEmail(email, productId);	
		System.out.println("product has been sent");
	}

	@Test
	public void testListQuestionByPrdId(){
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		String productId="2";
		List<Question> qs=orderService.listQuestionByPrdId(productId);
		for(Question q:qs){
			System.out.println("提问主题："+q.getSubject());
			System.out.println("提问内容："+q.getDetail());
			System.out.println("提问时间："+q.getAskTime());
			System.out.println("提问人："+q.getAskedBy());
			System.out.println("几个回答："+q.getAnswers().size());
		}
		System.out.println("list question about product ok");
	}

	
	@Test
	public void TestListRequireInfoByProductID(){
		OrderService orderService = appContext.getBean("orderService",
				OrderService.class);
		String productId="1";
		List<RequireInfo> qi=orderService.listRequireInfoByProductID(productId);
		for(RequireInfo q:qi){
			System.out.println("产品id："+q.getProductID());
			System.out.println("属性："+q.getAttr());
			System.out.println("列ID："+q.getColumnID());
			System.out.println("取值："+q.getValue());
			System.out.println("状态："+q.getStatus());
		}
		System.out.println("list require info about product ok");
	}
	
	@After
	public void end() {
		appContext = null;
	}

}
