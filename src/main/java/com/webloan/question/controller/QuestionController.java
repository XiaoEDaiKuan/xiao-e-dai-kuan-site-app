package com.webloan.question.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.webloan.common.Page;
import com.webloan.credit.service.CreditService;
import com.webloan.exception.BizException;
import com.webloan.model.Cust;
import com.webloan.model.Question;
import com.webloan.model.RegionIP;
import com.webloan.order.service.OrderService;
import com.webloan.question.QuestionConstant;
import com.webloan.question.service.QuestionService;
import com.webloan.question.view.QuestionView;
import com.webloan.user.UserConstant;
import com.webloan.user.service.UserService;

public class QuestionController extends MultiActionController {

	@Resource
	QuestionService questionService;
	@Resource
	OrderService orderService;
	@Resource
	CreditService creditService;
	@Resource
	UserService userService;
	@Resource
	ImageCaptchaService captchaService;

	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	public ModelAndView questionListByUser(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/myquestionlist");
		String strCustId = (String) request.getSession().getAttribute("custId");
		mav.addObject("questions",
				questionService.questionListByCustId(strCustId));
		return mav;
	}

	public ModelAndView questionListByKind(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/questionlist");
		mav.addObject("nonmortage", questionService
				.questionListByCustId(QuestionConstant.NONMORTAGE));
		mav.addObject("mortage",
				questionService.questionListByCustId(QuestionConstant.MORTAGE));
		return mav;
	}

	public ModelAndView ask(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/QA");

		mav.addObject("nonMort", questionService.pagingQuestions(1,
				Integer.MAX_VALUE, null, QuestionConstant.NONMORTAGE));
		mav.addObject("mortage", questionService.pagingQuestions(1,
				Integer.MAX_VALUE, null, QuestionConstant.MORTAGE));
		mav.addObject("hiQusts", questionService.pagingQuestions(1, 5,
				QuestionConstant.TYPE_HIGH));

		return mav;
	}

	public ModelAndView viewAnswer(HttpServletRequest request,
			HttpServletResponse response, Question question) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/viewAnswer");
		if (question.getId() != null) {
			mav.addObject("question",
					questionService.qryQuestionById(question.getId()));
		}
		return mav;
	}

	public ModelAndView questionSearch(HttpServletRequest request,
			HttpServletResponse response, QuestionView qv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/questionlist");
		mav.addObject("qv", qv);
		mav.addObject(
				"questions",
				questionService.pagingQuestions(qv.getPageIndex(),
						qv.getPageSize(), qv.getTitle(), null));
		return mav;
	}

	public ModelAndView postQuestionForm(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/postQuestionForm");
		return mav;
	}

	public ModelAndView postQuestionFormSave(HttpServletRequest request,
			HttpServletResponse response, QuestionView qv) {

		// 验证验证码
		String sessionId = request.getSession().getId();
		String captcha = request.getParameter("captcha");

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

		
		
		String ip = request.getRemoteAddr();
		questionService.saveQuestion(qv, ip);
		ModelAndView mav = new ModelAndView();
		mav.addObject("saveOK", "true");
		mav.setViewName("question/postQuestionForm");
		return mav;
	}

	// ///////////////////////////////////////////////// 评分器的Controller

	public ModelAndView scoreChoose(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("score/scoreChoose");
		return mav;
	}

	public ModelAndView scorePerson(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("score/score");
		return mav;
	}

	public ModelAndView scoreCompany(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("score/scoreCompany");
		return mav;
	}

	public ModelAndView scoreSave(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		// 没有登录，导向登录页面
		Long custId = (Long) request.getSession().getAttribute("custId");
		if (null == custId) {
			mav.setViewName("user/login");
		} else {
			Cust user = userService.findCustById(custId);
			creditService.saveCredit(custId.toString(),
					request.getParameter("strCreditType"), user.getCustName(),
					user.getMobileNO(), request.getParameter("strCreditMin"),
					request.getParameter("strCreditMax"));
			mav.setViewName("member/myCreditScore");
		}
		return mav;
	}
}
