package com.webloan.test.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.webloan.test.service.PersonService;


public class PersonController implements Controller {
	
	@Resource PersonService personService;

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listperson");
		mav.addObject("persons", personService.getPersons());
		return mav;
	}

}
