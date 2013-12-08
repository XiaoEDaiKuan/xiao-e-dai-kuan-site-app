package com.webloan.agent.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.webloan.agent.service.AgentService;

public class AgentController extends MultiActionController {
	
	@Resource AgentService agentService;
	
	public void createAgent(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		agentService.saveAgent(
				request.getParameter("name"), 
				request.getParameter("gender"), 
				request.getParameter("telephone"), 
				request.getParameter("cityId")
		);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("success");
		out.flush();
		out.close();
	}

}
