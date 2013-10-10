package com.webloan.order.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.exception.BizException;
import com.webloan.model.RegionIP;
import com.webloan.order.service.OrderService;
import com.webloan.question.service.QuestionService;
import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;

public class OrderController extends MultiActionController{

	@Resource OrderService orderService;
	@Resource UserService userService;
	@Resource QuestionService questionService;
	
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView orderlistByUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderlistbyuser");
		String strPageIndex=request.getParameter("pageIndex");
		String strPageSize=request.getParameter("pageSize");
		Long custId=(Long)request.getSession().getAttribute("custId");
		
		if(null==custId){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}

		if(null==strPageIndex||"".equals(strPageIndex)){
           strPageIndex="1";
		}
		int pageIndex=Integer.parseInt(strPageIndex);
		
		if(null==strPageSize||"".equals(strPageSize)){
           strPageSize="10";
		}
		int pageSize=Integer.parseInt(strPageSize);

		mav.addObject("orders", orderService.orderListByUser(custId,pageIndex,pageSize));
		return mav;
	}
	
	//信息提交处理
	public ModelAndView saveOrderInfo(HttpServletRequest request, HttpServletResponse response) {
		String productId = request.getParameter("productId");
		String loanAmt = request.getParameter("loanAmt");
		
		String ip = request.getRemoteAddr();
		RegionIP rip = questionService.qryCityByIP(ip);
		String regionId = rip == null || rip.getRegion() == null ? "" : rip.getRegion().getId().toString();
		
		String custId = request.getSession().getAttribute("custId").toString();
		
		orderService.createOrder(productId, custId, "", "", loanAmt, regionId);
		
		return new ModelAndView("order/inputOrderInfoSuccess");
	}
	
	public ModelAndView  orderEmail(HttpServletRequest request, HttpServletResponse response){
		
		String productId =(String) request.getParameter("productId");
		String email = request.getParameter("email");
		orderService.orderEmail(email, productId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/inputEmail"); 
		
		mav.addObject("emailOK", true);
		
		return mav;
		
	}
	
	
	public ModelAndView  popSave(HttpServletRequest request, HttpServletResponse response){
		String productId=request.getParameter("productId");
		request.getSession().setAttribute("productId", productId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/inputEmail"); 
		return mav;
		
	}

}
