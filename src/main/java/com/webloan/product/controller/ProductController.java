package com.webloan.product.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.product.service.ProductService;

public class ProductController extends MultiActionController {

	@Resource ProductService productService;
	
	public ModelAndView queryProduct(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/query");
		mav.addObject("products", productService.queryProduct(null, null, null));
		return mav;
	}
	
	
	public ModelAndView queryProductByUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/querybyuser");
		mav.addObject("products", productService.queryProductByUser(null, null, null));
		return mav;
	}
}
