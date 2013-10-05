package com.webloan.user.service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.webloan.util.IDCodeVerify;
import com.webloan.util.Identities;
import com.webloan.util.MailEngine;
import com.webloan.util.MobileVerify;
import com.webloan.util.SecurityUtils;
import com.webloan.util.SecurityUtils.DigestAlgorithm;
import com.webloan.util.WebUtils;

public class UserServiceImpl implements UserService {

	private UserRepository userRepository;
	private int hashIterations = 1024;// MD5加密迭代次数
	private SequenceService sequenceService;
	private int max = 100;// 同一个IP地址每天最多注册100个

	/**
	 * 保存注册信息
	 */
	@Override
	public String createUser(String custName, String logonPasswd,
			String mobileNO, String idType, String idNO, String email,
			String postCode, String address, String setupIP,
			HttpServletRequest request) {

		String custNO = "";

		// IP地址验证
		if (ipOverRunCheck(setupIP)) {
			log.error(UserConstant.SetupIPOverrun);
			throw new BizException(UserConstant.SetupIPOverrun);
		}
		// 姓名不能为空
		if (null == custName || "".equals(custName.trim())) {
			log.error(UserConstant.CustNameIsNull);
			throw new BizException(UserConstant.CustNameIsNull);
		}
		// 登录密码不能为空
		if (null == logonPasswd || "".equals(logonPasswd.trim())) {
			log.error(UserConstant.LogOnPasswdIsNull);
			throw new BizException(UserConstant.LogOnPasswdIsNull);
		}
		// 手机不能为空
		if (null == mobileNO || "".equals(mobileNO.trim())) {
			log.error(UserConstant.MobileIsNull);
			throw new BizException(UserConstant.MobileIsNull);
		}
		// 手机号段验证
		if (!MobileVerify.isMobileNO(mobileNO)) {
			log.error(UserConstant.MobileInvalied);
			throw new BizException(UserConstant.MobileInvalied);
		}
		// 手机号必须是数字
		if (!MobileVerify.isNum(mobileNO)) {
			log.error(UserConstant.MobileNoInvalied);
			throw new BizException(UserConstant.MobileNoInvalied);
		}
		// 检查该手机号是否已经被注册
		if (this.duplicatedMobileCheck(mobileNO)) {
			log.error(UserConstant.MobileDuplicated);
			throw new BizException(UserConstant.MobileDuplicated);
		}
		// 证件类型不能为空，目前只是身份证
		if (null == idType || "".equals(idType.trim())) {
			log.error(UserConstant.IdTypeIsNull);
			throw new BizException(UserConstant.IdTypeIsNull);
		}
		// 证件号码不能为空
		if (null == idNO || "".equals(idNO.trim())) {
			log.error(UserConstant.IdNoIsNull);
			throw new BizException(UserConstant.IdNoIsNull);
		}
		// 身份证验证
		IDCodeVerify idV = new IDCodeVerify(idNO);
		if (!idV.validate()) {
			log.error(UserConstant.EXCEPTION_ID_CODE);
			throw new BizException(UserConstant.EXCEPTION_ID_CODE);
		}

		// 检查该身份证是否已被注册
		if (this.duplicatedIdNoCheck(idNO)) {
			log.error(UserConstant.IdNODuplicated);
			throw new BizException(UserConstant.IdNODuplicated);
		}
		// 邮件不能为空
		if (null == email || "".equals(email.trim())) {
			log.error(UserConstant.EmailIsNull);
			throw new BizException(UserConstant.EmailIsNull);
		}
		// 邮件格式检查
		if (!EmailVerify.checkEmail(email)) {
			log.error(UserConstant.EmailInvalied);
			throw new BizException(UserConstant.EmailInvalied);
		}
		// 检查该邮件是否已被注册
		if (this.duplicatedEmailCheck(email)) {
			log.error(UserConstant.EmailDuplicated);
			throw new BizException(UserConstant.EmailDuplicated);
		}
		// 对登录密码MD5加密
		logonPasswd = EncodeUtils.encodeHex(SecurityUtils.DigestFunc.digest(
				logonPasswd.getBytes(), DigestAlgorithm.MD5, null,
				hashIterations));
		// 产生客户账号
		custNO = sequenceService.createSequence(ESeqType.CI_NO_SEQ);
		// 注册时间
		Timestamp setupTime = DateUtils.getTimeStamp();
		// 保存注册信息
		this.userRepository.createCust(custName, logonPasswd, mobileNO, idType,
				idNO, email, postCode, address, custNO, setupIP, setupTime);

		Date td = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String setupDate = df.format(td);
		this.userRepository.createIpRec(setupDate, setupIP);

		// 构建验证链接
		StringBuilder objMailAuthLink = new StringBuilder();
		String strAuthCode = generateAuthCode(new Date(), email);
		objMailAuthLink.append(WebUtils.getDomainWithContext(request))
				.append("mailAuthentication?code=").append(strAuthCode);

		log.info("mail authentication url: {}",
				new Object[] { objMailAuthLink.toString() });

		// 套用模板并发送邮件
		Map<String, Object> mpModel = new HashMap<String, Object>();
		mpModel.put("authURL", objMailAuthLink.toString());
		mpModel.put("time", mailLinkExpired);
		mpModel.put("name", custName);
		mpModel.put("custNO", custNO);
		mpModel.put("email", email);
		mpModel.put("mobileNO", mobileNO);
		mpModel.put("IDNO", idNO);

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
			log.error(UserConstant.EXCEPTION_SENT_MAIL_ERROR);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(UserConstant.EXCEPTION_SENT_MAIL_ERROR);
		}
		// 返回客户账号
		return custNO;
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

	/**
	 * 身份证重复检查
	 */
	@Override
	public boolean duplicatedIdNoCheck(String idNO) {
		return this.userRepository.duplicatedIdNoCheck(idNO);
	}

	/**
	 * 邮件重复检查
	 */
	@Override
	public boolean duplicatedEmailCheck(String email) {
		return this.userRepository.duplicatedEmailCheck(email);
	}

	/**
	 * 邮件重复检查
	 */
	@Override
	public boolean duplicatedMyEmailCheck(Long custId,String email) {
		return this.userRepository.duplicatedMyEmailCheck(custId,email);
	}

	/**
	 * 手机重复检查
	 */
	@Override
	public boolean duplicatedMobileCheck(String mobileNO) {
		return this.userRepository.duplicatedMobileCheck(mobileNO);
	}

	/**
	 * 手机重复检查
	 */
	@Override
	public boolean duplicatedMyMobileCheck(Long custId,String mobileNO) {
		return this.userRepository.duplicatedMyMobileCheck(custId,mobileNO);
	}
	
	
	
	/**
	 * IP地址检查
	 * 
	 * @param ip
	 * @return
	 */
	private boolean ipOverRunCheck(String ip) {

		if (this.userRepository.corpIpCheck(ip)) {
			return false;
		} else {
			return this.userRepository.setupIpOverRun(ip, max);

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
	 * 
	 * @param date
	 *            当前日期
	 * @param logonName
	 *            登录名称
	 * @return
	 */
	private String generateAuthCode(Date date, String logonName) {
		StringBuilder objCodeBuilder = new StringBuilder();
		objCodeBuilder.append(date.getTime()).append(SEP).append(logonName);
		// 生成验证代码
		return EncodeUtils.encodeHex(SecurityUtils.CryptoFunc.aesEncrypt(
				objCodeBuilder.toString().getBytes(),
				EncodeUtils.decodeHex(aesKey)));
	}

	private static final String SEP = "|";
	private String aesKey = "86061eb3622752442e2d48e68939aed0";
	private int mailLinkExpired = 30;// 邮件验证30分钟有效
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

	/**
	 * 
	 * 邮件激活
	 */
	@Override
	public String mailAuthentication(String code) {

		// 邮箱校验(失效时间，单位：分钟)
		String strLogonName = verifyAuthCode(code, TimeUnit.MINUTES,
				mailLinkExpired);
		List<Cust> objCust = userRepository.findCustByEmail(strLogonName);
		if (objCust == null || objCust.size() == 0) {
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND,
					new Object[] { strLogonName });
			throw new BizException(String.format(
					UserConstant.EXCEPTION_CUST_NOT_FOUND, strLogonName));
		}

		if (!UserConstant.CUST_STATUS_NOT_ACTIVATED.equals(objCust.get(0)
				.getStatus())) {
			log.error(UserConstant.EXCEPTION_MAIL_AUTHENTICATED);
			throw new BizException(UserConstant.EXCEPTION_MAIL_AUTHENTICATED);
		}

		// 更改用户状态为正常
		objCust.get(0).setStatus(UserConstant.CUST_STATUS_NORMAL);
		// 更新用户信息
		userRepository.update(objCust.get(0));

		return objCust.get(0).getCustName();
	}

	/**
	 * 校验验证代码
	 * 
	 * @param authCode
	 *            校验代码密文
	 * @param timeunit
	 *            过期时间单位
	 * @param time
	 *            过期时间数值
	 * @return String 登录名称
	 * @throws RegisterException
	 */
	private String verifyAuthCode(String authCode, TimeUnit timeunit, long time) {
		Validate.notEmpty(authCode, UserConstant.REQUIRED_MAIL_CODE);
		try {
			// code解码
			String strOriAuthCode = new String(
					SecurityUtils.CryptoFunc.aesDecrypt(
							EncodeUtils.decodeHex(authCode),
							EncodeUtils.decodeHex(aesKey)));
			log.trace("mail auth. code: {}", new Object[] { strOriAuthCode });
			// 转换毫秒指定时间单位(验证时间)
			long lTime = timeunit.convert(Long.parseLong(StringUtils
					.substringBefore(strOriAuthCode, SEP)),
					TimeUnit.MILLISECONDS);
			// 转换毫秒指定时间单位(当前时间)
			long lCurrentTime = timeunit.convert(new Date().getTime(),
					TimeUnit.MILLISECONDS);
			// 超过指定时间则抛出异常
			if (lCurrentTime - lTime > time) {
				log.error(UserConstant.EXCEPTION_MAIL_CODE_EXPIRED,
						new Object[] { (time - (lCurrentTime - lTime))
								+ timeunit.name() });
				throw new BizException(UserConstant.EXCEPTION_MAIL_CODE_EXPIRED);
			}
			// 登录名称不匹配则抛出异常
			String strLogonName = StringUtils.substringAfter(strOriAuthCode,
					SEP);
			log.debug("verify mail authenticating code successfully.");

			return strLogonName;
		} catch (Throwable t) {
			log.error(t.getMessage(), t);
			throw new BizException(t.getMessage());
		}
	}

	/**
	 * 修改密码
	 */
	@Override
	public void modifyPassword(String strCustId, String originalPassword,
			String newPassword) {
		// 客户ID不能为空
		Validate.notEmpty(strCustId, UserConstant.EXCEPTION_LOGIN_ACCT);
		// 原始密码不能为空
		Validate.notEmpty(originalPassword, UserConstant.LogOnPasswdIsNull);
		// 新密码不能为空
		Validate.notEmpty(newPassword, UserConstant.LogOnPasswdIsNull);
		// 查找用户
		Long custId = Long.valueOf(strCustId);
		List<Cust> custs = userRepository.findCustByCusID(custId);
		if (null == custs || custs.size() != 1) {
			log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
			throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		}
		// 原始密码验证
		originalPassword = EncodeUtils.encodeHex(SecurityUtils.DigestFunc
				.digest(originalPassword.getBytes(), DigestAlgorithm.MD5, null,
						hashIterations));
		if (!custs.get(0).getLogonPasswd().equals(originalPassword)) {
			log.error(UserConstant.EXCEPTION_PASSWD_ERROR);
			throw new BizException(UserConstant.EXCEPTION_PASSWD_ERROR);
		}
		// 加密新密码
		newPassword = EncodeUtils.encodeHex(SecurityUtils.DigestFunc.digest(
				newPassword.getBytes(), DigestAlgorithm.MD5, null,
				hashIterations));
		// 保存新密码
		userRepository.modifyPasswd(custId, newPassword);

	}

	/**
	 * 忘记密码
	 */
	@Override
	public void forgetPasswd(String logonName, String newPasswd) {

		List<Cust> custs = userRepository.findCustByEmail(logonName);
		if (null == custs || custs.size() != 1) {
			log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
		}

		// 摘要密码
		String strDigestPwd = EncodeUtils.encodeHex(SecurityUtils.DigestFunc
				.digest(newPasswd.getBytes(), DigestAlgorithm.MD5, null,
						hashIterations));

		// 更新客户信息
		custs.get(0).setLogonPasswd(strDigestPwd);
		userRepository.update(custs.get(0));
	}

	/**
	 * 修改客户资料
	 */

	@Override
	public void modifyUser(String strId, String mobileNO, String email,
			String postCode, String address) {
		Long id = strId == null ? null : Long.valueOf(strId);
		if(null==mobileNO||"".equals(mobileNO)){
			log.error(UserConstant.MobileIsNull);
			throw new BizException(UserConstant.MobileIsNull);
		}
		if(null==email||"".equals(email)){
			log.error(UserConstant.EmailIsNull);
			throw new BizException(UserConstant.EmailIsNull);
		}
        
		// 手机号段验证
		if (!MobileVerify.isMobileNO(mobileNO)) {
			log.error(UserConstant.MobileInvalied);
			throw new BizException(UserConstant.MobileInvalied);
		}
		// 手机号必须是数字
		if (!MobileVerify.isNum(mobileNO)) {
			log.error(UserConstant.MobileNoInvalied);
			throw new BizException(UserConstant.MobileNoInvalied);
		}
		// 检查该手机号是否已经被注册
		if (this.duplicatedMyMobileCheck(id,mobileNO)) {
			log.error(UserConstant.MobileDuplicated);
			throw new BizException(UserConstant.MobileDuplicated);
		}
		
		// 邮件不能为空
		if (null == email || "".equals(email.trim())) {
			log.error(UserConstant.EmailIsNull);
			throw new BizException(UserConstant.EmailIsNull);
		}
		// 邮件格式检查
		if (!EmailVerify.checkEmail(email)) {
			log.error(UserConstant.EmailInvalied);
			throw new BizException(UserConstant.EmailInvalied);
		}
		// 检查该邮件是否已被注册
		if (this.duplicatedMyEmailCheck(id,email)) {
			log.error(UserConstant.EmailDuplicated);
			throw new BizException(UserConstant.EmailDuplicated);
		}

		
		
		this.userRepository.modifyUser(id, mobileNO, email, postCode, address);
	}

	/**
	 * 用户登录
	 */
	@Override
	public Cust login(String logonName, String passwd) {

		if (null == logonName || "".equals(logonName)) {
			log.error(UserConstant.EXCEPTION_LOGIN_ACCT);
			throw new BizException(UserConstant.EXCEPTION_LOGIN_ACCT);
		}
		if (null == passwd || "".equals(passwd)) {
			log.error(UserConstant.EXCEPTION_LOGIN_ACCT);
			throw new BizException(UserConstant.EXCEPTION_LOGIN_ACCT);
		}

		List<Cust> custs = null;
		if (MobileVerify.isMobileNO(logonName) && MobileVerify.isNum(logonName)) {
			// 手机登录验证
			custs = userRepository.findCustByMobile(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else if (EmailVerify.checkEmail(logonName)) {
			// 邮件登录验证
			custs = userRepository.findCustByEmail(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else if (CustNoVerify(logonName)) {
			// 客户账号登录验证
			custs = userRepository.findCustByCustNO(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else {
			// 身份证验证
			IDCodeVerify idV = new IDCodeVerify(logonName);
			if (idV.validate()) {
				custs = userRepository.findCustByIdNO(logonName);
				if (null == custs || custs.size() != 1) {
					log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
					throw new BizException(
							UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				}

			}
		}

		if (null == custs || custs.size() != 1) {
			log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
		}

		// 密码验证
		passwd = EncodeUtils.encodeHex(SecurityUtils.DigestFunc.digest(
				passwd.getBytes(), DigestAlgorithm.MD5, null, hashIterations));
		if (!custs.get(0).getLogonPasswd().equals(passwd)) {
			log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
		}

		// 账号状态验证
		if (!custs.get(0).getStatus().equals(UserConstant.CUST_STATUS_NORMAL)) {
			log.error(UserConstant.EXCEPTION_ACCT_STATUS);
			throw new BizException(UserConstant.EXCEPTION_ACCT_STATUS);
		}
		// 返回客户手机
		return custs.get(0);

	}

	/**
	 * 客户账号验证
	 * 
	 * @param custNO
	 * @return
	 */
	boolean CustNoVerify(String custNO) {
		boolean flag = false;
		try {
			Pattern p = Pattern.compile("^[0-9]{8}$");
			Matcher m = p.matcher(custNO);
			flag = m.matches();
		} catch (Exception e) {
			flag = false;
		}

		return flag;
	}

	@Override
	public boolean corpIpCheck(String ip) {

		return userRepository.corpIpCheck(ip);
	}

	/**
	 * 验证账号
	 */
	@Override
	public boolean verifyAccount(String logonName) {

		if (null == logonName || "".equals(logonName)) {
			log.error(UserConstant.EXCEPTION_LOGIN_ACCT);
			return false;
			// throw new BizException(UserConstant.EXCEPTION_LOGIN_ACCT);
		}

		List<Cust> custs = null;
		if (MobileVerify.isMobileNO(logonName) && MobileVerify.isNum(logonName)) {
			// 手机登录验证
			custs = userRepository.findCustByMobile(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				return false;
				// throw new
				// BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else if (EmailVerify.checkEmail(logonName)) {
			// 邮件登录验证
			custs = userRepository.findCustByEmail(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				return false;
				// throw new
				// BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else if (CustNoVerify(logonName)) {
			// 客户账号登录验证
			custs = userRepository.findCustByCustNO(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				return false;
				// throw new BizException(
				// UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}
		} else {
			// 身份证验证
			IDCodeVerify idV = new IDCodeVerify(logonName);
			if (idV.validate()) {
				custs = userRepository.findCustByIdNO(logonName);
				if (null == custs || custs.size() != 1) {
					log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
					return false;
					// throw new BizException(
					// UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				}

			}
		}

		if (null == custs || custs.size() != 1) {
			log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			return false;
			// throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
		}

		return true;
	}

	/**
	 * 忘记密码--产生随机验证码，发往用户邮箱
	 */
	@Override
	public HashMap verifyPasswd(String logonName) {

		if (null == logonName || "".equals(logonName)) {
			log.error(UserConstant.EXCEPTION_LOGIN_ACCT);
			throw new BizException(UserConstant.EXCEPTION_LOGIN_ACCT);
		}

		List<Cust> custs = null;
		if (MobileVerify.isMobileNO(logonName) && MobileVerify.isNum(logonName)) {
			// 手机登录验证
			custs = userRepository.findCustByMobile(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else if (EmailVerify.checkEmail(logonName)) {
			// 邮件登录验证
			custs = userRepository.findCustByEmail(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}

		} else if (CustNoVerify(logonName)) {
			// 客户账号登录验证
			custs = userRepository.findCustByCustNO(logonName);
			if (null == custs || custs.size() != 1) {
				log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			}
		} else {
			// 身份证验证
			IDCodeVerify idV = new IDCodeVerify(logonName);
			if (idV.validate()) {
				custs = userRepository.findCustByIdNO(logonName);
				if (null == custs || custs.size() != 1) {
					log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
					throw new BizException(
							UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
				}

			}
		}

		if (null == custs || custs.size() != 1) {
			log.error(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
			throw new BizException(UserConstant.EXCEPTION_ACCT_NOT_EXISIT);
		}

		// 生成随机8位密码
		String strRandomPwd = Identities.randomString(8);
		// 套用模板并发送邮件
		Map<String, Object> mpModel = new HashMap<String, Object>();
		mpModel.put("tempPwd", strRandomPwd);
		mpModel.put("custName", custs.get(0).getCustName());
		String strTplContent = mailEngine.initTemplate(
				"/beans/biz/forgetPassword.vm", mpModel);
		log.trace("template content:\n {}", new Object[] { strTplContent });

		// 设置邮件发送参数
		SimpleMailMessage objMsg = new SimpleMailMessage();
		objMsg.setSubject(UserConstant.MAIL_SUBJECT_FORGET_PWD);
		objMsg.setText(strTplContent);
		objMsg.setTo(custs.get(0).getEmail());

		// 发送邮件
		boolean bSent;
		try {
			bSent = mailEngine.sendHtmlMail(objMsg);
			log.debug("mail sent: {}", new Object[] { bSent });

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(UserConstant.EXCEPTION_SENT_MAIL_ERROR);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(UserConstant.EXCEPTION_SENT_MAIL_ERROR);
		}
		HashMap hm = new HashMap();
		hm.put("email", custs.get(0).getEmail());
		hm.put("verifyCode", strRandomPwd);
		return hm;
	}

	/**
	 * 查询客户资料
	 */
	@Override
	public Cust findCustById(Long custId) {

	  List<Cust> custs=userRepository.findCustByCusID(custId);
	  if(null==custs||custs.size()!=1){
		  log.error(UserConstant.EXCEPTION_CUST_NOT_FOUND);
		  throw new BizException(UserConstant.EXCEPTION_CUST_NOT_FOUND);
	  }
	  return custs.get(0);
	}

}
