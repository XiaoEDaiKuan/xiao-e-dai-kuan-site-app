package com.webloan.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.webloan.common.dict.RecommendType;
import com.webloan.product.service.ProductService;
import com.webloan.question.QuestionConstant;
import com.webloan.question.service.QuestionService;

public class HomePageController implements Controller {

	@Resource ProductService productService;
	@Resource QuestionService questionService;
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		Page hcrProds = productService.pagingProductRecommend(1, 5, RecommendType.HOT_CREDIT);
		mav.addObject("hcrProds", hcrProds);
		
		Page hchProds = productService.pagingProductRecommend(1, 5, RecommendType.HOT_CHARACTER);
		mav.addObject("hchProds", hchProds);
		
		Page hiQusts = questionService.pagingQuestions(1, 5, QuestionConstant.TYPE_HIGH);
		mav.addObject("hiQusts", hiQusts);
		
		return mav;
	}

}
