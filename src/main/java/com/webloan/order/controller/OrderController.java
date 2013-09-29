package com.webloan.order.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.order.service.OrderService;


public class OrderController extends MultiActionController{

	@Resource OrderService orderService;
	public ModelAndView orderlistByUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderlistbyuser");
		mav.addObject("orders", orderService.orderListByUser(null));
		return mav;
	}
	
	public ModelAndView requestProductInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/requestProductInfo");
		return mav;
	}

	public ModelAndView requestProductCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		//不符合条件的就返回拒绝的页面
		//mav.setViewName("order/rejectOrderRequest");
		//符合条件的情况
		mav.setViewName("order/requestOrderQuestion");
		return mav;
	}
}
