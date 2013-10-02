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
	
	public ModelAndView requestOrderQuestion(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/requestOrderFinished");
		return mav;
	}
	
	
	public ModelAndView inputOrderInfoForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/inputOrderInfo");
		return mav;
	}
	
	//信息提交处理
	public ModelAndView saveOrderInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/inputOrderInfoSuccess");
		return mav;
	}
}
