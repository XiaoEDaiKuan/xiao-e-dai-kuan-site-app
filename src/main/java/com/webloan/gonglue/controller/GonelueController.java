package com.webloan.gonglue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class GonelueController extends MultiActionController {

	public ModelAndView gonglue(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		String type = request.getParameter("gonglueleixing");
		if (null == type || "".equals(type)) {
			mav.setViewName("zhuanqu/gonglue");
		} else if ("xiaofeigonglue".equals(type)) {
			mav.setViewName("zhuanqu/xiaofeigonglue");
		}else if ("jingyinggonglue".equals(type)) {
			mav.setViewName("zhuanqu/jingyinggonglue");
		}else if ("diyagonglue".equals(type)) {
			mav.setViewName("zhuanqu/diyagonglue");
		}else if ("wudiyagonglue".equals(type)) {
			mav.setViewName("zhuanqu/wudiyagonglue");
		}else if ("xinshougonglue".equals(type)) {
			mav.setViewName("zhuanqu/xinshougonglue");
		}

		return mav;
	}
	
	/**
	 * 每条攻略的详细信息
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView gonglueDT(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		String gonglueID = request.getParameter("gonglueID");
		if (null == gonglueID || "".equals(gonglueID)) {
			mav.setViewName("zhuanqu/gonglue");
		} else  {
			
			mav.setViewName("zhuanqu/gongluedt_"+gonglueID);
		}		return mav;
	}

}
