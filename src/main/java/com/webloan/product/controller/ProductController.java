package com.webloan.product.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.common.Asserts;
import com.webloan.common.Page;
import com.webloan.model.ProductAttach;
import com.webloan.model.Question;
import com.webloan.order.service.OrderService;
import com.webloan.product.service.ProductService;
import com.webloan.product.view.ProductQuery;

public class ProductController extends MultiActionController {

	@Resource ProductService productService;
	@Resource OrderService orderService;
	
	public ModelAndView queryProduct(HttpServletRequest request, 
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/listproduct");
		if (pq.getLoanAmt() != null) {
			Page page = productService.pagingProduct(pq);
			mav.addObject("products", page);
		}
		return mav;
	}
	
	public ModelAndView productView(HttpServletRequest request, 
			HttpServletResponse response, ProductQuery pq) {
		Long productId = pq.getProductId();
		Asserts.notNull(productId);
		Asserts.notNull(pq.getLoanAmt(), "请选择贷款金额!");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/addToCart");
		
		ProductAttach prod = productService.getAttachByProductId(productId);
		mav.addObject("prod", prod);
		
		List<Question> questions = orderService.listQuestionByPrdId(productId.toString());
		mav.addObject("questions", questions);
		
		mav.addObject("pq", pq);
		
		return mav;
	}
	
	public ModelAndView requestProductInfo(HttpServletRequest request, 
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/requestProductInfo");
		
		mav.addObject("productId", pq.getProductId());
		
		return mav;
	}

	public ModelAndView requestProductCheck(HttpServletRequest request, 
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductAttach> attaches = productService.queryProductAttaches(pq);
		
		//不符合条件的就返回拒绝的页面
		if (attaches == null || attaches.size() == 0) {
			mav.setViewName("order/rejectOrderRequest");
		}
		else {//符合条件的情况
			mav.setViewName("order/requestOrderQuestion");
			mav.addObject("pq", pq);
		}
		
		return mav;
	}
	
	public ModelAndView inputOrderInfoForm(HttpServletRequest request, 
			HttpServletResponse response, ProductQuery pq) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductAttach> attaches = productService.queryProductAttaches(pq);

		//不符合条件的就返回拒绝的页面
		if (attaches == null || attaches.size() == 0) {
			mav.setViewName("order/requestOrderFinished");
		}
		else {//符合条件的情况
			mav.setViewName("order/inputOrderInfo");
			mav.addObject("pq", pq);
		}
		
		return mav;
	}
	
}
