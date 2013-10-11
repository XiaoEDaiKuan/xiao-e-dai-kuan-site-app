package com.webloan.opinion.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.model.Opinion;
import com.webloan.opinion.service.OpinionService;

public class OpinionController extends MultiActionController{

	@Resource OpinionService opinionService;
	
	public ModelAndView feedback(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("opinion/feedback"); 
		return mav;
	}
	
	public ModelAndView addopinion(HttpServletRequest request, 
			HttpServletResponse response, Opinion opinion){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("opinion/feedback"); 
		
		opinionService.saveOpinion(opinion.getName(), opinion.getEmail(), 
				opinion.getTelephone(), opinion.getContent());
		
		return mav;
	}

}
