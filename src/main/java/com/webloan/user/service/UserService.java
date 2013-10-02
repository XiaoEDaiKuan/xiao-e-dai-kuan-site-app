package com.webloan.user.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.webloan.model.Cust;

public interface UserService {
	// 保存注册用户信息
	String createUser(String custName, String logonPasswd, String mobileNO,
			String idType, String idNO, String email, String postCode,
			String address, String setupIP, HttpServletRequest request);

	// 验证证件号码是否重复
	boolean duplicatedIdNoCheck(String idNO);

	// 验证邮件是否重复
	boolean duplicatedEmailCheck(String email);

	// 验证电话是否重复
	boolean duplicatedMobileCheck(String mobileNO);

	// 邮件激活
	String mailAuthentication(String code);

	// 修改密码
	public void modifyPassword(String strCustId, String originalPassword,
			String newPassword);

	// 忘记密码
	public void forgetPasswd(String logonName,String newPasswd);

	// 修改注册信息
	public void modifyUser(String id, String mobileNO, String email,
			String postCode, String address);
    //用户登录
	public Cust login(String logonName,String passwd);
	
	//验证是否是公司的IP
	public boolean corpIpCheck(String ip);
	
	//验证账号
	public  boolean  verifyAccount(String logonName);
	
	//验证密码
	public  HashMap  verifyPasswd(String logonName);
	
}
