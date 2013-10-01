package com.webloan.user.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.webloan.exception.BizException;
import com.webloan.model.Cust;
import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;

public class UserController extends MultiActionController {
	@Resource
	UserService userService;
	@Resource
	ImageCaptchaService captchaService;
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	/*
	 * 保存用户注册信息
	 */
	public ModelAndView createUser(HttpServletRequest request,
			HttpServletResponse response) {

		// 验证验证码
		String sessionId = request.getSession().getId();
		String captcha = request.getParameter("captcha");

		/*
		 * boolean flag=false; try{
		 * flag=captchaService.validateResponseForID(sessionId, captcha); }
		 * catch(Exception e){ e.printStackTrace();
		 * log.error(UserConstant.EXCEPTION_CAPTCHA_CODE); throw new
		 * BizException(UserConstant.EXCEPTION_CAPTCHA_CODE); } if(!flag){
		 * log.error(UserConstant.EXCEPTION_CAPTCHA_CODE); throw new
		 * BizException(UserConstant.EXCEPTION_CAPTCHA_CODE); }
		 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/registerok");
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
		mav.addObject("name", custName);
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
		String custName = userService.mailAuthentication(strCode);
		if (null == custName || "".equals(custName)) {
			log.error(UserConstant.EXCEPTION_MAIL_AUTHENTICATED);
			throw new BizException(UserConstant.EXCEPTION_MAIL_AUTHENTICATED);
		}
		mav.addObject("name", custName);
		return mav;
	}

	/**
	 * 登录认证
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 验证验证码
		String sessionId = request.getSession().getId();
		String captcha = request.getParameter("captcha");

		/*
		 * boolean flag=false; try{
		 * flag=captchaService.validateResponseForID(sessionId, captcha); }
		 * catch(Exception e){ e.printStackTrace();
		 * log.error(UserConstant.EXCEPTION_CAPTCHA_CODE); throw new
		 * BizException(UserConstant.EXCEPTION_CAPTCHA_CODE); } if(!flag){
		 * log.error(UserConstant.EXCEPTION_CAPTCHA_CODE); throw new
		 * BizException(UserConstant.EXCEPTION_CAPTCHA_CODE); }
		 */

		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		String logonName = request.getParameter("logonName");
		String passwd = request.getParameter("passwd");
		Cust cust = userService.login(logonName, passwd);
		request.getSession().setAttribute("custId", cust.getId());
		request.getSession().setAttribute("custName", cust.getCustName());
		mav.addObject("mobile", cust.getMobileNO());
		return mav;
	}

	public ModelAndView loginView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

	public ModelAndView reg(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/userregister");
		return mav;
	}

	/**
	 * 修改用户登录信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView modifyUser(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/modifyuser");
		String id = (String) request.getSession().getAttribute("custId");
		String mobileNO = request.getParameter("mobileNO");
		String email = request.getParameter("email");
		String postCode = request.getParameter("postCode");
		String address = request.getParameter("address");
		userService.modifyUser(id, mobileNO, email, postCode, address);
		return mav;
	}

	/**
	 * 忘记密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView forgetPasswd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/forgetPasswdOk");

		String newPassword = request.getParameter("NewPassword");
		String reNewPassword = request.getParameter("ReNewPassword");
		if(null==newPassword || "".equals(newPassword)){
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}
		if(null==reNewPassword || "".equals(reNewPassword)){
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}
		
		if(!reNewPassword.equals(reNewPassword) ){
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}
		
		
		String email=request.getParameter("email");
		String verifyCode=request.getParameter("verifyCode");
		
		// 从session中获取email和verifyCode
		String sesEmail = (String) request.getSession().getAttribute("email");
		String sesVerifyCode=(String) request.getSession().getAttribute("verifyCode");
		
		if(null==email || !email.equals(sesEmail)){
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}

		if(null==verifyCode || !verifyCode.equals(sesVerifyCode)){
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}

		userService.forgetPasswd(email,newPassword);

		return mav;
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView modifyPasswd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/modifypasswd");
		String originalPassword = request.getParameter("originalPassword");
		String newPassword = request.getParameter("newPassword");
		// 从session中获取ciustId
		String strCustId = (String) request.getSession().getAttribute("custId");
		userService.modifyPassword(strCustId, originalPassword, newPassword);
		return mav;
	}

	/**
	 * 用户退出
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView logOut(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/logout");
		// 从session中获取ciustId
		String strCustId = (String) request.getSession().getAttribute("custId");
		if (null != strCustId && !"".equals(strCustId)) {
			request.getSession().invalidate();
		}
		return mav;
	}

	/**
	 * 忘记密码，验证账号
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void verifyAccount(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String logonName = request.getParameter("logonName");
		boolean b = userService.verifyAccount(logonName);
		String result = "fail";
		if (b) {
			result = "success";
		}
		PrintWriter out = response.getWriter();

		out.print(result);
		out.close();

	}

	/**
	 * 产生验证码发给客户邮箱
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView verifyPasswd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

//		String sessionId = request.getSession().getId();
//		String captcha = request.getParameter("captcha");
//		try{
//		    captchaService.validateResponseForID(sessionId, captcha);
//		}
//		catch(Exception e){
//			e.printStackTrace();
//			log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
//			throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
//		}

		
		String logonName = request.getParameter("logonName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/passwdConfirm");

	    HashMap hm = userService.verifyPasswd(logonName);
	    mav.addObject("email", hm.get("email"));
        request.getSession().setAttribute("email", hm.get("email"));
        request.getSession().setAttribute("verifyCode", hm.get("verifyCode"));
	    
		return mav;
	}

}
