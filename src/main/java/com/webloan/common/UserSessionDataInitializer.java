package com.webloan.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.webloan.model.CityLoan;
import com.webloan.model.Region;
import com.webloan.model.RegionIP;
import com.webloan.question.service.QuestionService;
import com.webloan.region.service.RegionService;

public class UserSessionDataInitializer implements Filter {
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		
		WebApplicationContext appContext = WebApplicationContextUtils
				.getWebApplicationContext(application);
		
		if (application.getAttribute("allowLoanRegions") == null) {
			RegionService regionService = appContext.getBean("regionService", 
					RegionService.class);
			List<Region> regions = regionService.queryRegionByCityLoan();
			application.setAttribute("allowLoanRegions", regions);
		}
		
		if (session.getAttribute("currentRegion") == null) {
			String ip = request.getHeader("Remote_Addr");
			if (ip == null) {
				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if (ip == null) {
				ip = request.getRemoteAddr();
			}

			log.info("================================================="+ip+"-------------------------------------------------");
			QuestionService questionService = appContext.getBean(
					"questionService", QuestionService.class);
			RegionIP rip = questionService.qryCityByIP(ip);
			
			if (rip != null && rip.getRegion() != null) {
				session.setAttribute("currentRegion", rip.getRegion());
				
				RegionService regionService = appContext.getBean(
						"regionService", RegionService.class);
				CityLoan cl = regionService.getCityLoanByRegionId(
						rip.getRegion().getId());
				
				if (cl != null) {
					session.setAttribute("regionAvailable", "1");
				}
			}
		}

		if (session.getAttribute("regionAvailable") == null) {
			session.setAttribute("regionAvailable", "0");
		}
		
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig config) throws ServletException {
	}
	
	public void destroy() {
	}
	
}

