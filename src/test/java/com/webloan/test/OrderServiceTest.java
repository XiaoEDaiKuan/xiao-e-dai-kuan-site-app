package com.webloan.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.order.OrderStatus;
import com.webloan.model.Order;
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
		List<Order> orders = orderService.orderListByUser("1");
		for (int i = 0; i < orders.size(); i++) {
			for (OrderStatus os : OrderStatus.values()) {
				if(os.getIndex()==Integer.valueOf(orders.get(i).getStatus()).intValue()){
					orders.get(i).setStatus(os.getName());
					break;
				}
			}

			System.out.println(((Order) orders.get(i)).getId());
			System.out.println(((Order) orders.get(i)).getProduct().getName());
			System.out.println(((Order) orders.get(i)).getApprovAmt());
			System.out.println(((Order) orders.get(i)).getOrderTime());
			System.out.println(((Order) orders.get(i)).getStatus());

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
	
	
	@After
	public void end() {
		appContext = null;
	}

}