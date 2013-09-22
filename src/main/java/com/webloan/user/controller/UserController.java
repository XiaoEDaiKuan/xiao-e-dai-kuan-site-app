package com.webloan.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.Validate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;

public class UserController extends MultiActionController {
	@Resource
	UserService userService;

	/*
	 * 保存用户注册信息
	 */
	public ModelAndView createUser(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/mailConfirm");
		String custName = request.getParameter("custName");
		String logonPasswd = request.getParameter("logonPasswd");
		String mobileNO = request.getParameter("mobileNO");
		String idType = request.getParameter("idType");
		String idNO = request.getParameter("idNO");
		String email = request.getParameter("email");
		String postCode = request.getParameter("postCode");
		String address = request.getParameter("address");

		// String setupIP=request.getParameter("setupIP");
		String setupIP = "127.0.0.1";

		mav.addObject("mailConfirm", userService.createUser(custName,
				logonPasswd, mobileNO, idType, idNO, email, postCode, address,
				setupIP, request));
		return mav;
	}

	/**
	 * 邮箱认证(同步页面)
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView mailAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/***");

		String strCode = request.getParameter("code");
		Validate.notEmpty(strCode, UserConstant.REQUIRED_MAIL_CODE);
		userService.mailAuthentication(strCode);
		mav.addObject("activated", true);

		return mav;
	}

}
