package com.webloan.product.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.common.Page;
import com.webloan.product.service.ProductService;
import com.webloan.product.view.ProductQuery;

public class ProductController extends MultiActionController {

	@Resource ProductService productService;
	
	public ModelAndView queryProduct(HttpServletRequest request, 
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/listproduct");
		Page page = productService.pagingProduct(pq);
		mav.addObject("products", page);
		return mav;
	}
}
