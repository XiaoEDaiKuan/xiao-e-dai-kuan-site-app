package com.webloan.order.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.order.service.OrderService;
import com.webloan.user.service.UserService;

public class OrderController extends MultiActionController{

	@Resource OrderService orderService;
	@Resource UserService userService;
	
	public ModelAndView orderlistByUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderlistbyuser");
		mav.addObject("orders", orderService.orderListByUser(null));
		return mav;
	}
	
	//信息提交处理
	public ModelAndView saveOrderInfo(HttpServletRequest request, HttpServletResponse response) {

		String productId = request.getParameter("productId");
		String loanAmt = request.getParameter("loanAmt");
		
		String ip = request.getRemoteAddr();
		String custId = request.getSession().getAttribute("custId").toString();
		
		orderService.createOrder(productId, custId, "", "", loanAmt, ip);
		
		return new ModelAndView("order/inputOrderInfoSuccess");
	}
}
