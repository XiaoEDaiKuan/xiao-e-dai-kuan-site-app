package com.webloan.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.Validate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.model.Cust;
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
		mav.setViewName("user/register");
		String custName = request.getParameter("custName");
		String logonPasswd = request.getParameter("logonPasswd");
		String mobileNO = request.getParameter("mobileNO");
		String idType = request.getParameter("idType");
		String idNO = request.getParameter("idNO");
		String email = request.getParameter("email");
		String postCode = request.getParameter("postCode");
		String address = request.getParameter("address");

		// String setupIP=request.getParameter("setupIP");
		String setupIP = request.getHeader("Remote_Addr");
		if (setupIP == null) {
			setupIP = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (setupIP == null) {
			setupIP = request.getRemoteAddr();
		}

		mav.addObject("account", userService.createUser(custName, logonPasswd,
				mobileNO, idType, idNO, email, postCode, address, setupIP,
				request));
		mav.addObject("email", email);
		mav.addObject("identity", idNO);
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
		mav.setViewName("user/mailconfirm");
		String strCode = request.getParameter("code");
		Validate.notEmpty(strCode, UserConstant.REQUIRED_MAIL_CODE);
		userService.mailAuthentication(strCode);
		return mav;
	}

	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginsuccess");
        String logonName=request.getParameter("logonName");
        String passwd=request.getParameter("passwd");
		Cust cust=userService.login(logonName, passwd);
		request.getSession().setAttribute("custId", cust.getId());
		mav.addObject("mobile", cust.getMobileNO());
		return mav;
	}

	/**
	 * 修改用户登录信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView modifyUser(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/modifyuser");
        String id=(String)request.getSession().getAttribute("custId");
        String mobileNO=request.getParameter("mobileNO");
        String email=request.getParameter("email");
        String postCode=request.getParameter("postCode");
        String address=request.getParameter("address");
        userService.modifyUser(id, mobileNO, email, postCode, address);
		return mav;
	}

	/**
	 * 忘记密码
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView forgetPassword(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/forgetpasswd");
		String logonName=request.getParameter("logonName");
        userService.forgetPassword(logonName);

		return mav;
	}

	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView modifyPassword(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/modifypasswd");
		String originalPassword=request.getParameter("originalPassword");
		String newPassword=request.getParameter("newPassword");
		//从session中获取ciustId
		String strCustId=(String)request.getSession().getAttribute("custId");
		userService.modifyPassword(strCustId, originalPassword, newPassword);
		return mav;
	}

	/**
	 * 用户退出
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView logOut(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/logout");
		//从session中获取ciustId
		String strCustId=(String)request.getSession().getAttribute("custId");
        if(null != strCustId && !"".equals(strCustId)){
        	request.getSession().invalidate();
        }
		return mav;
	}
	
}
