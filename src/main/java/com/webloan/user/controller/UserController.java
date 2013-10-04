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
import com.webloan.order.service.OrderService;
import com.webloan.question.service.QuestionService;
import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;

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
	
	///////////////////////弹出页面登录/////////////////////
	
	public ModelAndView loginForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView(); //login(request, response);
		mav.setViewName("user/loginForm");
		return mav;
	}

	public ModelAndView loginFormAction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = login(request, response);
		mav.setViewName("order/requestProductInfo");
		return mav;
	}
	
	
	///////////////////////// 会员中心/////////////////////
	/**
	 * 我的贷款
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView myDaikuan(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myDaikuan");

		String custId=(String)request.getSession().getAttribute("custId");

		//测试
		custId="1";

		
		if(null==custId||"".equals(custId)){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}
		String strPageIndex=request.getParameter("pageIndex");
		String strPageSize=request.getParameter("pageSize");
		
		if(null==strPageIndex||"".equals(strPageIndex)){
           strPageIndex="1";
		}
		int pageIndex=Integer.parseInt(strPageIndex);
		
		if(null==strPageSize||"".equals(strPageSize)){
           strPageSize="10";
		}
		int pageSize=Integer.parseInt(strPageSize);
		
		Page orderPage=orderService.orderListByUser(custId,pageIndex,pageSize);
		
		mav.addObject("orderPage",orderPage);

		
		return mav;
	}
	
	/**
	 * 取消订单
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_CancelOrder(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_CancelOrder");
        String orderid=request.getParameter("orderid");
		if(null==orderid ||"".equals(orderid)){
			log.error(UserConstant.EXCEPTION_MY_LOAN);
			throw new BizException(UserConstant.EXCEPTION_MY_LOAN);
		}
		orderService.deleteOrder(orderid);
		
		return mav;
	}
	
	/**
	 * 取消订单成功
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_CancelOrderOK(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_CancelOrder");
		return mav;
	}

	/**
	 * 我的消息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView myMessage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myMessage");

		String custId=(String)request.getSession().getAttribute("custId");

		//测试
		custId="1";

		
		if(null==custId||"".equals(custId)){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}
		String strPageIndex=request.getParameter("pageIndex");
		String strPageSize=request.getParameter("pageSize");
		
		if(null==strPageIndex||"".equals(strPageIndex)){
           strPageIndex="1";
		}
		int pageIndex=Integer.parseInt(strPageIndex);
		
		if(null==strPageSize||"".equals(strPageSize)){
           strPageSize="10";
		}
		int pageSize=Integer.parseInt(strPageSize);
		
		
		Page messagePage=messageService.messageListByUser(custId,pageIndex,pageSize);
		
		mav.addObject("messagePage",messagePage);
		
		List<Object> ls=messageService.messageCountByStatus(custId);
		
		int messageCnt=0;
		int unreadCnt=0;
		int readCnt=0;
		
		if(null !=ls && ls.size() ==2){
				unreadCnt=((Number) ls.get(0)).intValue();
				readCnt=((Number) ls.get(1)).intValue();
				messageCnt=unreadCnt+readCnt;
		}
		if(null !=ls && ls.size() ==1){
			unreadCnt=((Number) ls.get(0)).intValue();
			messageCnt=unreadCnt+readCnt;
     	}
		
		mav.addObject("unreadCnt",unreadCnt );
		mav.addObject("readCnt",readCnt );
		mav.addObject("messageCnt",messageCnt );
		
		return mav;
	}
	
	/**
	 * 我的信用评分
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView myCreditScore(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myCreditScore");
		
		String custId=(String)request.getSession().getAttribute("custId");

		//测试
		custId="1";

		
		if(null==custId||"".equals(custId)){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}
		String strPageIndex=request.getParameter("pageIndex");
		String strPageSize=request.getParameter("pageSize");
		
		if(null==strPageIndex||"".equals(strPageIndex)){
           strPageIndex="1";
		}
		int pageIndex=Integer.parseInt(strPageIndex);
		
		if(null==strPageSize||"".equals(strPageSize)){
           strPageSize="10";
		}
		int pageSize=Integer.parseInt(strPageSize);
		
		
		Page creditPage=creditService.creditListByUser(custId,pageIndex,pageSize);
		
		mav.addObject("creditPage",creditPage);
		
		
		return mav;
	}	

	/**
	 * 删除兴勇评分记录
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView pop_DeleteCredit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_DeleteCredit");
        String creditId=request.getParameter("creditId");
		if(null==creditId ||"".equals(creditId)){
			log.error(UserConstant.EXCEPTION_MY_LOAN);
			throw new BizException(UserConstant.EXCEPTION_MY_LOAN);
		}
		creditService.deleteCredit(creditId);
		
		return mav;
	}
	
	
	/**
	 * 编辑用户信息-回显用户信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView editMyInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/editMyInfo");

		String strCustId=(String)request.getSession().getAttribute("custId");
		//测试
		strCustId="1";
		if(null==strCustId||"".equals(strCustId)){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}

		Long custId=Long.valueOf(strCustId);
		Cust cust=userService.findCustById(custId);
		mav.addObject("cust", cust);
		return mav;
	}

   /**
    * 保存用户编辑的联系信息
    * @param request
    * @param response
    * @return
    * @throws Exception
    */
	public ModelAndView modifyMyInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/pop_contact");

		String strCustId=(String)request.getSession().getAttribute("custId");
		//测试
		strCustId="1";
		if(null==strCustId||"".equals(strCustId)){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}

		
		String mobileNO=request.getParameter("mobileNO");
		if(null==mobileNO||"".equals(mobileNO)){
			log.error(UserConstant.MobileIsNull);
			throw new BizException(UserConstant.MobileIsNull);
		}
		String email=request.getParameter("email");
		if(null==email||"".equals(email)){
			log.error(UserConstant.EmailIsNull);
			throw new BizException(UserConstant.EmailIsNull);
		}
		
		
		String postCode=request.getParameter("postCode");
		String address=request.getParameter("address");
		
        userService.modifyUser(strCustId, mobileNO, email, postCode, address);
		
		return mav;
	}
	

	
	public ModelAndView myQuestion(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myQuestion");

		String strCustId=(String)request.getSession().getAttribute("custId");
		//测试
		strCustId="1";
		if(null==strCustId||"".equals(strCustId)){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}
		
      //  Page questionPage=questionService.questionListByCustId(strCustId);
		
		
		return mav;
	}
	public ModelAndView changePassword(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/changePassword");
		return mav;
	}
}
