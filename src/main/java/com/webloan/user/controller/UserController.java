package com.webloan.user.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.webloan.common.Page;
import com.webloan.credit.service.CreditService;
import com.webloan.exception.BizException;
import com.webloan.message.service.MessageService;
import com.webloan.model.Cust;
import com.webloan.model.Region;
import com.webloan.order.service.OrderService;
import com.webloan.question.service.QuestionService;
import com.webloan.region.service.RegionService;
import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;
import com.webloan.util.EmailVerify;
import com.webloan.util.IDCodeVerify;
import com.webloan.util.MobileVerify;

public class UserController extends MultiActionController {
	@Resource
	UserService userService;
	@Resource
	ImageCaptchaService captchaService;
	@Resource
	OrderService orderService;
	@Resource
	MessageService messageService;
	@Resource
	CreditService creditService;
	@Resource
	QuestionService questionService;
	@Resource
	RegionService regionService;

	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	/*
	 * 保存用户注册信息
	 */
	public ModelAndView createUser(HttpServletRequest request,
			HttpServletResponse response) {

		/*
		 * // 验证验证码 String sessionId = request.getSession().getId(); String
		 * captcha = request.getParameter("captcha");
		 * 
		 * boolean flag = false; try { flag =
		 * captchaService.validateResponseForID(sessionId, captcha); } catch
		 * (Exception e) { e.printStackTrace();
		 * log.error(UserConstant.EXCEPTION_CAPTCHA_CODE); throw new
		 * BizException(UserConstant.EXCEPTION_CAPTCHA_CODE); } if (!flag) {
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
		// String sessionId = request.getSession().getId();
		// String captcha = request.getParameter("captcha");
		//
		// boolean flag = false;
		// try {
		// flag = captchaService.validateResponseForID(sessionId, captcha);
		// } catch (Exception e) {
		// e.printStackTrace();
		// log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// }
		// if (!flag) {
		// log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// }

		ModelAndView mav = new ModelAndView();

		try {
			mav.setViewName("redirect:/");
			String logonName = request.getParameter("logonName");
			String passwd = request.getParameter("passwd");
			Cust cust = userService.login(logonName, passwd);
			request.getSession().setAttribute("custId", cust.getId());
			request.getSession().setAttribute("custName", cust.getCustName());
			mav.addObject("mobile", cust.getMobileNO());
			return mav;
		}

		catch (Exception ex) {
			mav.setViewName("user/login");
			mav.addObject("response", "fail");
			return mav;
		}
	}

	public ModelAndView memlogin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 验证验证码
		// String sessionId = request.getSession().getId();
		// String captcha = request.getParameter("captcha");
		//
		// boolean flag = false;
		// try {
		// flag = captchaService.validateResponseForID(sessionId, captcha);
		// } catch (Exception e) {
		// e.printStackTrace();
		// log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// }
		// if (!flag) {
		// log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		// }

		ModelAndView mav = new ModelAndView();

		try {
			mav.setViewName("member/myDaikuan");
			String logonName = request.getParameter("logonName");
			String passwd = request.getParameter("passwd");
			Cust cust = userService.login(logonName, passwd);
			request.getSession().setAttribute("custId", cust.getId());
			request.getSession().setAttribute("custName", cust.getCustName());
			mav.addObject("mobile", cust.getMobileNO());
			return mav;
		}

		catch (Exception ex) {
			mav.setViewName("user/login");
			mav.addObject("response", "fail");
			return mav;
		}
	}

	/**
	 * 跳转到登录页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView loginView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

	/**
	 * 跳转到注册页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
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

	public ModelAndView forgetPasswd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/forgetPasswd");

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
	public ModelAndView forgetPasswdConfirm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/forgetPasswdOk");

		String newPassword = request.getParameter("NewPassword");
		String reNewPassword = request.getParameter("ReNewPassword");
		if (null == newPassword || "".equals(newPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}
		if (null == reNewPassword || "".equals(reNewPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}

		if (!reNewPassword.equals(newPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}

		String email = request.getParameter("email");
		String verifyCode = request.getParameter("verifyCode");

		// 从session中获取email和verifyCode
		String sesEmail = (String) request.getSession().getAttribute("email");
		String sesVerifyCode = (String) request.getSession().getAttribute(
				"verifyCode");

		if (null == email || !email.equals(sesEmail)) {
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}

		if (null == verifyCode || !verifyCode.equals(sesVerifyCode)) {
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}

		userService.forgetPasswd(email, newPassword);

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
		mav.setViewName("member/changePassword");
		mav.addObject("success", "密码修改成功！");
		String originalPassword = request.getParameter("originalPassword");
		String newPassword = request.getParameter("newPassword");
		String newPasswordRep = request.getParameter("newPasswordRep");

		// 从session中获取ciustId
		Long custId = (Long) request.getSession().getAttribute("custId");

		if (null == custId) {
			log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			mav.setViewName("user/login");
			return mav;
		}

		if (null == newPassword || "".equals(newPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_CONFIRM);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_CONFIRM);
		}

		if (null == originalPassword || "".equals(originalPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_CONFIRM);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_CONFIRM);
		}
		if (null == newPasswordRep || "".equals(newPasswordRep)) {
			log.error(UserConstant.EXCEPTION_PASSWD_CONFIRM);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_CONFIRM);
		}

		if (!newPasswordRep.equals(newPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_CONFIRM);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_CONFIRM);
		}

		String strCustId = String.valueOf(custId);
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
		mav.setViewName("index");
		// 从session中获取ciustId
		Long custId = (Long) request.getSession().getAttribute("custId");
		if (null != custId) {
			request.getSession().removeAttribute("custId");
			request.getSession().removeAttribute("custName");
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
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView verifyPasswd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sessionId = request.getSession().getId();
		String captcha = request.getParameter("txtVerifyCode");

		boolean flag = false;
		try {
			flag = captchaService.validateResponseForID(sessionId, captcha);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
			throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		}
		if (!flag) {
			log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
			throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		}

		String logonName = request.getParameter("logonName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/passwdConfirm");

		HashMap hm = userService.verifyPasswd(logonName);
		mav.addObject("email", hm.get("email"));
		request.getSession().setAttribute("email", hm.get("email"));
		request.getSession().setAttribute("verifyCode", hm.get("verifyCode"));

		return mav;
	}

	// /////////////////////弹出页面登录/////////////////////

	public ModelAndView loginForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginForm");

		String productId = request.getParameter("productId");
		request.getSession().setAttribute("productId", productId);

		return mav;
	}

	public ModelAndView loginFormAction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		try {
			//mav.setViewName("redirect:/");
			String logonName = request.getParameter("logonName");
			String passwd = request.getParameter("passwd");
			Cust cust = userService.login(logonName, passwd);
			request.getSession().setAttribute("custId", cust.getId());
			request.getSession().setAttribute("custName", cust.getCustName());
			mav.addObject("mobile", cust.getMobileNO());

			mav.setViewName("order/requestProductInfo");

			Object productId = request.getSession().getAttribute("productId");
			mav.addObject("productId", productId);
			request.getSession().removeAttribute("productId");

			return mav;

		}

		catch (Exception ex) {
			mav.setViewName("user/loginForm");
			mav.addObject("response", "fail");
			return mav;
		}

	}

	// /////////////////////// 会员中心/////////////////////
	/**
	 * 我的贷款
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView myDaikuan(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myDaikuan");

		Long custId = (Long) request.getSession().getAttribute("custId");

		if (null == custId) {
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			mav.setViewName("member/memlogin");
			return mav;

		}
		

		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");

		if (null == strPageIndex || "".equals(strPageIndex)) {
			strPageIndex = "1";
		}
		int pageIndex = Integer.parseInt(strPageIndex);

		if (null == strPageSize || "".equals(strPageSize)) {
			strPageSize = "10";
		}
		int pageSize = Integer.parseInt(strPageSize);

		Page orderPage = orderService.orderListByUser(custId, pageIndex,
				pageSize);

		mav.addObject("orderPage", orderPage);

		return mav;
	}

	/**
	 * 取消订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_CancelOrder(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_CancelOrder");

		String orderid = request.getParameter("orderid");
		mav.addObject("orderid", orderid);
		if (null == orderid || "".equals(orderid)) {
			log.error(UserConstant.EXCEPTION_MY_LOAN);
			throw new BizException(UserConstant.EXCEPTION_MY_LOAN);
		}
		orderService.deleteOrder(orderid);

		return mav;
	}

	/**
	 * 取消订单成功
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_CancelOrderOK(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_CancelOrder");
		mav.addObject("deleteOK", "true");

		return mav;
	}

	/**
	 * 我的消息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */

	public ModelAndView myMessage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myMessage");

		Long custId = (Long) request.getSession().getAttribute("custId");

		if (null == custId) {
			mav.setViewName("user/login");
			return mav;
		}
		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");

		if (null == strPageIndex || "".equals(strPageIndex)) {
			strPageIndex = "1";
		}
		int pageIndex = Integer.parseInt(strPageIndex);

		if (null == strPageSize || "".equals(strPageSize)) {
			strPageSize = "10";
		}
		int pageSize = Integer.parseInt(strPageSize);
		String strCustId = String.valueOf(custId);
		Page messagePage = messageService.messageListByUser(strCustId,
				pageIndex, pageSize);

		mav.addObject("messagePage", messagePage);

		List<Object> ls = messageService.messageCountByStatus(strCustId);

		int messageCnt = 0;
		int unreadCnt = 0;
		int readCnt = 0;

		if (null != ls && ls.size() == 2) {
			unreadCnt = ((Number) ls.get(0)).intValue();
			readCnt = ((Number) ls.get(1)).intValue();
			messageCnt = unreadCnt + readCnt;
		}
		if (null != ls && ls.size() == 1) {
			unreadCnt = ((Number) ls.get(0)).intValue();
			messageCnt = unreadCnt + readCnt;
		}

		mav.addObject("unreadCnt", unreadCnt);
		mav.addObject("readCnt", readCnt);
		mav.addObject("messageCnt", messageCnt);

		return mav;
	}

	/**
	 * 我的信用评分
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView myCreditScore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myCreditScore");

		Long custId = (Long) request.getSession().getAttribute("custId");

		if (null == custId || "".equals(custId)) {
			mav.setViewName("user/login");
			return mav;
		}
		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");

		if (null == strPageIndex || "".equals(strPageIndex)) {
			strPageIndex = "1";
		}
		int pageIndex = Integer.parseInt(strPageIndex);

		if (null == strPageSize || "".equals(strPageSize)) {
			strPageSize = "10";
		}
		int pageSize = Integer.parseInt(strPageSize);
		String strCustId = String.valueOf(custId);
		Page creditPage = creditService.creditListByUser(strCustId, pageIndex,
				pageSize);

		mav.addObject("creditPage", creditPage);

		return mav;
	}

	/**
	 * 删除兴勇评分记录
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_DeleteCredit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_DeleteCredit");
		String creditId = request.getParameter("creditId");
		if (null == creditId || "".equals(creditId)) {
			log.error(UserConstant.EXCEPTION_MY_LOAN);
			throw new BizException(UserConstant.EXCEPTION_MY_LOAN);
		}
		creditService.deleteCredit(creditId);

		return mav;
	}

	/**
	 * 删除兴勇评分记录确认
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_DeleteCreditOK(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_DeleteCredit");
		mav.addObject("deleteOK", "true");

		return mav;
	}

	/**
	 * 编辑用户信息-回显用户信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView editMyInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/editMyInfo");

		Long custId = (Long) request.getSession().getAttribute("custId");

		if (null == custId) {
			mav.setViewName("user/login");
			return mav;
		}

		Cust cust = userService.findCustById(custId);
		mav.addObject("cust", cust);
		return mav;
	}

	/**
	 * 用户编辑的联系信息-回显
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView modifyMyInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_contact");

		Long custId = (Long) request.getSession().getAttribute("custId");
		if (null == custId) {
			mav.setViewName("user/login");
			return mav;
		}
		Cust cust = userService.findCustById(custId);
		mav.addObject("cust", cust);
		return mav;
	}

	/**
	 * 保存编辑后的信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView updateMyInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_contact");

		Long custId = (Long) request.getSession().getAttribute("custId");
		if (null == custId) {
			mav.setViewName("user/login");
			return mav;
		}

		String mobileNO = request.getParameter("mobileNO");
		if (null == mobileNO || "".equals(mobileNO)) {
			log.error(UserConstant.MobileIsNull);
			throw new BizException(UserConstant.MobileIsNull);
		}
		String email = request.getParameter("email");
		if (null == email || "".equals(email)) {
			log.error(UserConstant.EmailIsNull);
			throw new BizException(UserConstant.EmailIsNull);
		}

		String postCode = request.getParameter("postCode");
		String address = request.getParameter("address");

		String strCustId = String.valueOf(custId);
		userService.modifyUser(strCustId, mobileNO, email, postCode, address);
		mav.addObject("editOK", "true");

		return mav;
	}

	public ModelAndView myQuestion(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myQuestion");

		Long custId = (Long) request.getSession().getAttribute("custId");
		if (null == custId) {
			mav.setViewName("user/login");
			return mav;
		}

		String strPageIndex = request.getParameter("pageIndex");
		String strPageSize = request.getParameter("pageSize");

		if (null == strPageIndex || "".equals(strPageIndex)) {
			strPageIndex = "1";
		}
		int pageIndex = Integer.parseInt(strPageIndex);

		if (null == strPageSize || "".equals(strPageSize)) {
			strPageSize = "10";
		}
		int pageSize = Integer.parseInt(strPageSize);

		String strCustId = String.valueOf(custId);
		Page questionPage = questionService.qryQuestionByCustId(strCustId,
				pageIndex, pageSize);
		mav.addObject("questionPage", questionPage);

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
	public ModelAndView changePassword(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/changePassword");
		return mav;
	}

	/**
	 * 验证注册输入的手机号码
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String verifyMobile(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String result = "success";

		String mobileNo = request.getParameter("mobileNo");
		if (!MobileVerify.isNum(mobileNo)) {
			result = "fail1";
			out.print(result);
			out.close();
			return result;
		}
		if (!MobileVerify.isMobileNO(mobileNo)) {
			result = "fail1";
		}

		if (userService.duplicatedMobileCheck(mobileNo)) {
			result = "fail2";
		}

		out.print(result);
		out.close();
		return result;
	}

	/**
	 * 验证身份证
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String verifyIdNo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String result = "success";

		String idNO = request.getParameter("idNo");
		IDCodeVerify idV = new IDCodeVerify(idNO);
		if (!idV.validate()) {
			result = "fail1";
		}

		if (userService.duplicatedIdNoCheck(idNO)) {
			result = "fail2";
		}

		out.print(result);
		out.close();

		return result;
	}

	/**
	 * 检验邮件
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String verifyEmail(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String result = "success";

		String email = request.getParameter("email");
		if (!EmailVerify.checkEmail(email)) {
			result = "fail1";
		}

		if (userService.duplicatedEmailCheck(email)) {
			result = "fail2";
		}

		out.print(result);
		out.close();

		return result;
	}

	public ModelAndView selectCity(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Object from = request.getParameter("from");
		String to = from == null ? "/" : (String) from;

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:" + to.replace("#", ""));

		String strId = request.getParameter("setcity");
		Long regionId = Long.valueOf(strId);

		Region region = regionService.getRegionById(regionId);
		request.getSession().setAttribute("currentRegion", region);
		request.getSession().setAttribute("regionAvailable", "1");

		return mav;
	}
	
	public ModelAndView creditCust(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return new ModelAndView("user/creditcust");
	}
	public void createCreditCust(HttpServletRequest request,
			HttpServletResponse response, Cust cust) throws Exception {
		Boolean ret = false;
		
		if (cust.getCustName() != null && !"".equals(cust.getCustNO())
				&& cust.getMobileNO() != null && !"".equals(cust.getMobileNO())) {
			String setupIP = request.getHeader("Remote_Addr");
			if (setupIP == null) {
				setupIP = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if (setupIP == null) {
				setupIP = request.getRemoteAddr();
			}
			
			cust.setSetupIP(setupIP);
			cust.setCustType("1");
			
			ret = userService.saveCust(cust);
		}
		
		PrintWriter out = response.getWriter();
		out.print(ret ? "success" : "fail");
		out.flush();
		out.close();
	}
}
