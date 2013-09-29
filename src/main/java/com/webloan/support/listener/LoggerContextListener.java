package com.webloan.support.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.MDC;

public class LoggerContextListener implements ServletContextListener  {

	/**
	 * 日志追踪号
	 */
	private static final String TRACE_NO = "traceNo";

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		MDC.put(TRACE_NO, "SERVER");
		
	}

}
