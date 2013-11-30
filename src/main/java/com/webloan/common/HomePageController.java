package com.webloan.common;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.webloan.common.dict.RecommendType;
import com.webloan.model.Region;
import com.webloan.order.service.OrderService;
import com.webloan.product.service.ProductService;
import com.webloan.question.QuestionConstant;
import com.webloan.question.service.QuestionService;
import com.webloan.region.service.RegionService;

public class HomePageController implements Controller {

	@Resource ProductService productService;
	@Resource QuestionService questionService;
	@Resource RegionService regionService;
	@Resource OrderService orderService;
	
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");

		Page hcrProds = productService.pagingProductRecommend(1, 5,
				RecommendType.HOT_CREDIT);
		mav.addObject("hcrProds", hcrProds);

		Page hchProds = productService.pagingProductRecommend(1, 5,
				RecommendType.HOT_CHARACTER);
		mav.addObject("hchProds", hchProds);

		Page hiQusts = questionService.pagingQuestions(1, 5,
				QuestionConstant.TYPE_HIGH);
		mav.addObject("hiQusts", hiQusts);
		
		Page sucOrders = orderService.queryOrderByStatus(1, 5, "4");
		mav.addObject("sucOrders", sucOrders);
		
		List<Region> provinces = regionService.queryProvinces();
		mav.addObject("provinces", provinces);
		
		List<?> orderNums = productService.querySumOfStats();
		if (orderNums != null && !orderNums.isEmpty()) {
			Object[] nums = (Object[]) orderNums.get(0);
			mav.addObject("numOfOrders", nums[0].toString().toCharArray());
			mav.addObject("numOfSuccess", nums[1].toString().toCharArray());
		} else {
			mav.addObject("numOfOrders", Arrays.asList(0));
			mav.addObject("numOfSuccess", Arrays.asList(0));
		}
		
		return mav;
	}
}
