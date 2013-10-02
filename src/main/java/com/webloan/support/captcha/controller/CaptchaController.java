package com.webloan.support.captcha.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.webloan.exception.BizException;
import com.webloan.user.UserConstant;

public class CaptchaController extends MultiActionController {

	/**
	 * 验证码处理
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void handleCaptcha(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		byte[] captchaChallengeAsJpeg = null;
		
		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
		
		String captchaId = session.getId();
		//log.debug("captcha id: {}", new Object[]{captchaId});

		BufferedImage challenge = captchaService.getImageChallengeForID(captchaId, request.getLocale());
		
		JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(jpegOutputStream);
		jpegEncoder.encode(challenge);
		
		captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
		
		ServletOutputStream out = response.getOutputStream();
		out.write(captchaChallengeAsJpeg);
		out.flush();
		out.close();
		
	}

	protected transient Logger log = LoggerFactory.getLogger(this.getClass());
	
	private ImageCaptchaService captchaService;

	public void setCaptchaService(ImageCaptchaService captchaService) {
		this.captchaService = captchaService;
	}

	/**
	 * 验证前端输入的验证码
	 * @param request
	 * @param response
	 * @param session
	 * @throws Exception
	 */
	public void verifyCaptcha(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		//ModelAndView mav = new ModelAndView();
		PrintWriter out=response.getWriter();  
		//验证验证码
		String sessionId = request.getSession().getId();
		String captcha = request.getParameter("captcha");
        String result="success";		
		boolean flag=false;
		try{
		flag=captchaService.validateResponseForID(sessionId, captcha);
		}
		catch(Exception e){
			e.printStackTrace();
			log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
			result="fail";
			//throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		}
		if(!flag){
			log.error(UserConstant.EXCEPTION_CAPTCHA_CODE);
			result="fail";
			//throw new BizException(UserConstant.EXCEPTION_CAPTCHA_CODE);
		}

		
		out.print(result);
		out.close();

	}

}
