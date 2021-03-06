package com.webloan.test;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webloan.model.Product;
import com.webloan.product.service.ProductService;


public class ProductServiceTest {

	private ApplicationContext appContext;
	
	@Before
	public void start() {
		appContext = new ClassPathXmlApplicationContext("classpath*:beans/**/*.xml");
	}
	
	@Test
	public void testQueryProduct() {
		ProductService ps = appContext.getBean("productService", ProductService.class);
	}
	
	@Test
	public void testQueryProductByUser() {
		ProductService ps = appContext.getBean("productService", ProductService.class);
	}
	
	@Test
	public void testGetProductById() {
		ProductService ps = appContext.getBean("productService", ProductService.class);
		Product prod = ps.getProductById(1L);
		System.out.println(prod);
	}
	
	@After
	public void end() {
		appContext = null;
	}
}
