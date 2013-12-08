package com.webloan.order.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.exception.BizException;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;
import com.webloan.order.OrderQuery;
import com.webloan.order.service.OrderService;
import com.webloan.question.service.QuestionService;
import com.webloan.region.service.RegionService;
import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;

public class OrderController extends MultiActionController{

	@Resource OrderService orderService;
	@Resource UserService userService;
	@Resource QuestionService questionService;
	@Resource RegionService regionService;
	
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
        String custName=request.getParameter("custName");
		String mobile=request.getParameter("mobile");
		
		orderService.createOrder(productId, custId, custName, mobile, loanAmt, regionId);
		
		return new ModelAndView("order/inputOrderInfoSuccess");
	}
	
	public ModelAndView  orderEmail(HttpServletRequest request, HttpServletResponse response){
		
		String productId =(String) request.getParameter("productId");
		String email = request.getParameter("email");
		orderService.orderEmail(email, productId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/sendEmailok"); 
		
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
	
	public ModelAndView directloan(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("order/publicise");
		
		List<Region> provinces = regionService.queryProvinces();
		mav.addObject("provinces", provinces);
		
		return mav;
	}
	public ModelAndView directOrder(HttpServletRequest request, 
			HttpServletResponse response, OrderQuery order) {
		ModelAndView mav = new ModelAndView("order/publiciseok");
		orderService.createOrder(order);
		return mav;
	}
	
	public void loadCities(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		String provId = request.getParameter("provinceId");
		List<Region> cities = regionService.queryCities(Long.valueOf(provId));
		
		StringBuilder retstr = new StringBuilder();
		
		for (Region city : cities) {
			retstr.append(",{").append("\"id\":\"").append(city.getId())
					.append("\",\"name\":\"").append(city.getName()).append("\"}");
		}
		
		if (retstr.length() > 0) {
			retstr.replace(0, 1, "[").append("]");
		} else {
			retstr.append("[]");
		}
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(retstr.toString());
		out.flush();
		out.close();
	}
	
	public void loadProvinces(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		List<Region> provinces = regionService.queryProvinces();
		
		StringBuilder retstr = new StringBuilder();
		
		for (Region province : provinces) {
			retstr.append(",{").append("\"id\":\"").append(province.getId())
					.append("\",\"name\":\"").append(province.getName()).append("\"}");
		}
		
		if (retstr.length() > 0) {
			retstr.replace(0, 1, "[").append("]");
		} else {
			retstr.append("[]");
		}
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(retstr.toString());
		out.flush();
		out.close();
	}

}
