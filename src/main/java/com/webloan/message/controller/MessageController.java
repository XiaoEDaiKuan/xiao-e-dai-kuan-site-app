package com.webloan.message.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.message.service.MessageService;


public class MessageController extends MultiActionController{
	@Resource MessageService messageService;
	public ModelAndView messageListByUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messagelistbyuser");
		mav.addObject("messages", messageService.messageListByUser(null));
		return mav;
	}

}
