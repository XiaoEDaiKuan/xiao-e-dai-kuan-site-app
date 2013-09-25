package com.webloan.question.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.question.QuestionConstant;
import com.webloan.question.service.QuestionService;

public class QuestionController extends MultiActionController{

	@Resource  QuestionService questionService;
	
	public ModelAndView questionListByUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/myquestionlist");
		String strCustId=(String)request.getSession().getAttribute("custId");
		mav.addObject("questions", questionService.questionListByCustId(strCustId));
		return mav;
	}

	public ModelAndView questionListByKind(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/questionlist");
		mav.addObject("nonmortage", questionService.questionListByCustId(QuestionConstant.NONMORTAGE));
		mav.addObject("mortage", questionService.questionListByCustId(QuestionConstant.MORTAGE));
		return mav;
	}
	
}
