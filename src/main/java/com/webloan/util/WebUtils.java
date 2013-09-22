package com.webloan.util;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.Validate;

/**
 * Web工具
 *
 */
public class WebUtils {
	
	/**
	 * 获取带环境上下文的域名(如：http://xxx.xx.x/context/)
	 * @param request
	 * @return
	 */
	public static String getDomainWithContext(HttpServletRequest request){
		Validate.notNull(request, "http servlet request is required.");
		return getDomain(request).replaceAll("/$", "").concat(request.getContextPath()).concat("/");
	}
	
	/**
	 * 获取域名
	 * @param request
	 * @return
	 */
	public static String getDomain(HttpServletRequest request){
		Validate.notNull(request, "http servlet request is required.");
		StringBuffer objURL = request.getRequestURL();
		return objURL.delete(
				objURL.length() - request.getRequestURI().length(), objURL.length()
		).append("/").toString();
	}
	
	
}
