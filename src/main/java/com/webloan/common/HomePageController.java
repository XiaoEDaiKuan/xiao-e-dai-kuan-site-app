package com.webloan.common;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.webloan.common.dict.RecommendType;
import com.webloan.model.Product;
import com.webloan.model.Question;
import com.webloan.product.service.ProductService;
import com.webloan.question.service.QuestionService;

public class HomePageController implements Controller {

	@Resource ProductService productService;
	@Resource QuestionService questionService;
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		List<Product> hcrProds = productService.queryProductRecommend(RecommendType.HOT_CREDIT, 5);
		mav.addObject("hcrProds", hcrProds);
		
		List<Product> hchProds = productService.queryProductRecommend(RecommendType.HOT_CHARACTER, 5);
		mav.addObject("hchProds", hchProds);
		
		List<Question> hiQusts = questionService.qryHighQuest();
		mav.addObject("hiQusts", hiQusts);
		
		
		return mav;
	}

}
