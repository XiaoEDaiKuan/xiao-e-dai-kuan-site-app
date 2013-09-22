package com.webloan.user.service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;

import com.webloan.model.Cust;
import com.webloan.support.sequence.ESeqType;
import com.webloan.support.sequence.service.SequenceService;
import com.webloan.user.UserConstant;
import com.webloan.exception.BizException;
import com.webloan.user.dao.UserRepository;
import com.webloan.user.service.UserService;
import com.webloan.util.DateUtils;
import com.webloan.util.EmailVerify; 
import com.webloan.util.EncodeUtils;
import com.webloan.util.MailEngine;
import com.webloan.util.MobileVerify;
import com.webloan.util.SecurityUtils;
import com.webloan.util.SecurityUtils.DigestAlgorithm;
import com.webloan.util.WebUtils;

public class UserServiceImpl implements UserService {

	private UserRepository userRepository;
	private int hashIterations=1024;
	private SequenceService sequenceService;
	private int max=100;
	
	@Override
	public String createUser(String custName, String logonPasswd,
			String mobileNO, String idType, String idNO, String email,
			String postCode,String address,String setupIP,HttpServletRequest request) {

		String custNO="";
		
		
		if(ipOverRunCheck(setupIP)){
			throw new BizException(UserConstant.SetupIPOverrun);
		}
		
		if(null==custName || "".equals(custName.trim())){
			 throw new BizException(UserConstant.CustNameIsNull); 
		}

		if(null==logonPasswd || "".equals(logonPasswd.trim())){
			 throw new BizException(UserConstant.LogOnPasswdIsNull); 
		}

		if(null==mobileNO || "".equals(mobileNO.trim())){
			 throw new BizException(UserConstant.MobileIsNull); 
		}
        if(!MobileVerify.isMobileNO(mobileNO)){
        	throw new BizException(UserConstant.MobileInvalied);
        }
		
        if(!MobileVerify.isNum(mobileNO)){
        	throw new BizException(UserConstant.MobileNoInvalied);
        }

		if(this.duplicatedMobileCheck(mobileNO)){
			  throw  new BizException(UserConstant.MobileDuplicated);
		}

		if(null==idType || "".equals(idType.trim())){
			 throw new BizException(UserConstant.IdTypeIsNull); 
		}
		if(null==idNO || "".equals(idNO.trim())){
			 throw new BizException(UserConstant.IdNoIsNull); 
		}

		if(this.duplicatedIdNoCheck(idNO)){
			  throw  new BizException(UserConstant.IdNODuplicated);
		}

		if(null==email || "".equals(email.trim())){
			 throw new BizException(UserConstant.EmailIsNull); 
		}
		if(!EmailVerify.checkEmail(email)){
			throw new BizException(UserConstant.EmailInvalied);
		}

		if(this.duplicatedEmailCheck(email)){
			  throw  new BizException(UserConstant.EmailDuplicated);
		}
		
		logonPasswd=EncodeUtils.encodeHex(
				SecurityUtils.DigestFunc.digest(logonPasswd.getBytes(), DigestAlgorithm.MD5, null, hashIterations));
			
		custNO=sequenceService.createSequence(ESeqType.CI_NO_SEQ);
		
		Timestamp setupTime = DateUtils.getTimeStamp();
		
	     this.userRepository.createCust(custName, logonPasswd, mobileNO, idType, idNO, email, postCode, address, custNO, setupIP,setupTime);	
	    
	       Date td=new Date();
	       SimpleDateFormat df=new SimpleDateFormat("yyyyMMdd");
           String setupDate=df.format(td);
	     this.userRepository.createIpRec(setupDate, setupIP);
	     
			// 构建验证链接
			StringBuilder objMailAuthLink = new StringBuilder();
			String strAuthCode = generateAuthCode(new Date(),email);
			objMailAuthLink
					.append(WebUtils.getDomainWithContext(request))
					.append("mailAuthentication.do&code=")
					.append(strAuthCode);

			log.info("mail authentication url: {}",
					new Object[] { objMailAuthLink.toString() });

			// 套用模板并发送邮件
			Map<String, Object> mpModel = new HashMap<String, Object>();
			mpModel.put("authURL", objMailAuthLink.toString());
			mpModel.put("time", mailLinkExpired);
			String strTplContent = mailEngine.initTemplate(
					"/beans/biz/mailAuthentication.vm", mpModel);
			log.info("template content:\n {}", new Object[] { strTplContent });

			// 设置邮件发送参数
			SimpleMailMessage objMsg = new SimpleMailMessage();
			objMsg.setSubject(UserConstant.MAIL_SUBJECT_ACTIVATE);
			objMsg.setText(strTplContent);
			objMsg.setTo(email);
			objMsg.setSentDate(new Date());
			
			// 发送邮件
			boolean bSent;
			try {
				bSent = mailEngine.sendHtmlMail(objMsg);
				log.debug("mail sent: {}", new Object[] { bSent });

			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	     return email;
	}
	public UserRepository getUserRepository() {
		return userRepository;
	}
	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	public int getHashIterations() {
		return hashIterations;
	}
	public void setHashIterations(int hashIterations) {
		this.hashIterations = hashIterations;
	}
	public SequenceService getSequenceService() {
		return sequenceService;
	}
	public void setSequenceService(SequenceService sequenceService) {
		this.sequenceService = sequenceService;
	}
	@Override
	public boolean duplicatedIdNoCheck(String idNO) {
		return this.userRepository.duplicatedIdNoCheck(idNO);
	}
	@Override
	public boolean duplicatedEmailCheck(String email) {
     return this.userRepository.duplicatedEmailCheck(email);		 
	}
	@Override
	public boolean duplicatedMobileCheck(String mobileNO) {
		return this.userRepository.duplicatedMobileCheck(mobileNO);
	}
	
	private boolean ipOverRunCheck(String ip){
		
		if(this.userRepository.corpIpCheck(ip)){
			return false;
		}else {
			return this.userRepository.setupIpOverRun(ip,max);

		}
		
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	
	/**
	 * 生成验证代码(AES对称加密)
	 * @param date 当前日期
	 * @param logonName 登录名称
	 * @return
	 */
	private String generateAuthCode(Date date, String logonName){
		StringBuilder objCodeBuilder = new StringBuilder();
		objCodeBuilder.append(date.getTime()).append(SEP).append(logonName);
		//生成验证代码
		return EncodeUtils.encodeHex(
				SecurityUtils.CryptoFunc.aesEncrypt(
						objCodeBuilder.toString().getBytes(), EncodeUtils.decodeHex(aesKey)
				)
		);
	}
	private static final String SEP = "|";
	private String aesKey="86061eb3622752442e2d48e68939aed0";
	private int mailLinkExpired=30;//邮件验证30分钟有效
	private MailEngine mailEngine;
	
	public MailEngine getMailEngine() {
		return mailEngine;
	}
	public void setMailEngine(MailEngine mailEngine) {
		this.mailEngine = mailEngine;
	}
	public int getMailLinkExpired() {
		return mailLinkExpired;
	}
	public void setMailLinkExpired(int mailLinkExpired) {
		this.mailLinkExpired = mailLinkExpired;
	}
	public String getAesKey() {
		return aesKey;
	}
	public void setAesKey(String aesKey) {
		this.aesKey = aesKey;
	}
	
	protected transient Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	public void mailAuthentication(String code) {

		//邮箱校验(失效时间，单位：分钟)
		String strLogonName = verifyAuthCode(code, TimeUnit.MINUTES, mailLinkExpired);
		List<Cust> objCust = userRepository.findCustByEmail(strLogonName);
		if(objCust == null || objCust.size()==0){
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND, new Object[]{strLogonName});
			throw new BizException(String.format(UserConstant.EXCEPTION_CUST_NOT_FOUND, strLogonName));
		}
		
		if(!UserConstant.CUST_STATUS_NOT_ACTIVATED.equals(objCust.get(0).getStatus())){
			log.error(UserConstant.EXCEPTION_MAIL_AUTHENTICATED);
			throw new BizException(UserConstant.EXCEPTION_MAIL_AUTHENTICATED);
		}
		
		//更改用户状态为正常
		objCust.get(0).setStatus(UserConstant.CUST_STATUS_NORMAL);
		//更新用户信息
		userRepository.update(objCust.get(0));

	}
	/**
	 * 校验验证代码
	 * @param authCode 校验代码密文
	 * @param timeunit 过期时间单位
	 * @param time 过期时间数值
	 * @return String 登录名称
	 * @throws RegisterException 
	 */
	private String verifyAuthCode(String authCode, TimeUnit timeunit, long time) {
		Validate.notEmpty(authCode, UserConstant.REQUIRED_MAIL_CODE);
		try{
			//code解码
			String strOriAuthCode = new String(
					SecurityUtils.CryptoFunc.aesDecrypt(
							EncodeUtils.decodeHex(authCode), EncodeUtils.decodeHex(aesKey)
					)
			);
			log.trace("mail auth. code: {}", new Object[]{strOriAuthCode});
			//转换毫秒指定时间单位(验证时间)
			long lTime = timeunit.convert(Long.parseLong(StringUtils.substringBefore(strOriAuthCode, SEP)), TimeUnit.MILLISECONDS);
			//转换毫秒指定时间单位(当前时间)
			long lCurrentTime = timeunit.convert(new Date().getTime(), TimeUnit.MILLISECONDS);
			//超过指定时间则抛出异常
			if(lCurrentTime - lTime > time){
				log.error(UserConstant.EXCEPTION_MAIL_CODE_EXPIRED, new Object[]{(time - (lCurrentTime - lTime)) + timeunit.name()});
				throw new BizException(UserConstant.EXCEPTION_MAIL_CODE_EXPIRED);
			}
			//登录名称不匹配则抛出异常
			String strLogonName = StringUtils.substringAfter(strOriAuthCode, SEP);
			log.debug("verify mail authenticating code successfully.");
			
			return strLogonName;
		}catch(Throwable t){
			log.error(t.getMessage(), t);
			throw new BizException(t.getMessage());
		}
	}
	@Override
	public void modifyPassword(String logonName, String originalPassword,
			String newPassword) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Cust forgetPassword(String logonName) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void modifyUser(String id,String custName, String logonPasswd,
			String mobileNO, String idType, String idNO, String email,
			String postCode, String address, String setupIP,
			HttpServletRequest request) {
		
		
	}
	

}
