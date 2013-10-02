package com.webloan.gonglue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;



public class GonelueController extends MultiActionController{
	
	public ModelAndView gonglue(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/gonglue");
		return mav;
	}

	public ModelAndView kuaisu(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/KS");
		return mav;
	}
	
	public ModelAndView tigao(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/TG");
		return mav;
	}
	
	public ModelAndView pos(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhuanqu/POS");
		return mav;
	}
}
