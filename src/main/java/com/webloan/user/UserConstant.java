package com.webloan.user;

public class UserConstant {
	public static final String CustNameIsNull = "客户姓名不能为空";
	public static final String LogOnPasswdIsNull = "登陆密码不能为空";
	public static final String MobileIsNull = "手机不能为空";
	public static final String EmailIsNull = "电子邮件不能为空";
	public static final String IdTypeIsNull = "证件类型不能为空";
	public static final String IdNoIsNull = "证件号码不能为空";
	public static final String EmailInvalied = "电子邮箱格式不正确";
	public static final String MobileInvalied = "手机号段不正确";
	public static final String MobileNoInvalied = "手机号码不正确";
    public static final String EmailDuplicated="邮件已存在";
    public static final String MobileDuplicated="手机号码已存在";
    public static final String IdNODuplicated="证件号码已存在";
    public static final String SetupIPOverrun="同一个IP地址注册账号超过限制";
	public final static String MAIL_SUBJECT_ACTIVATE = "用户邮箱激活";
	public final static String MAIL_SUBJECT_FORGET_PWD = "忘记密码";
	public final static String REQUIRED_MAIL_CODE = "错误的邮箱认证链接";
	public final static String EXCEPTION_MAIL_CODE_EXPIRED = "邮箱认证链接已超期";
	public final static String EXCEPTION_CUST_NOT_FOUND="没有找到客户";
	public final static String CUST_STATUS_NORMAL="0";
	public final static String CUST_STATUS_NOT_ACTIVATED="1";
	public final static String EXCEPTION_MAIL_AUTHENTICATED="邮件验证失败";
	public final static String EXCEPTION_MODIFY_EMAIL="注册资料修改错误-邮件为空";
	public final static String EXCEPTION_MODIFY_ADDRESS="注册资料修改错误-地址为空";
	public final static String EXCEPTION_MODIFY_POSTCODE="注册资料修改错误-邮编为空";
	public final static String EXCEPTION_MODIFY_MOBILE="注册资料修改错误-手机为空";
	public final static String EXCEPTION_LOGIN_ACCT="登录账号为空";
	public final static String EXCEPTION_ID_CODE="身份证号校验错误";
	public final static String EXCEPTION_CAPTCHA_CODE="验证码错误";
	public final static String EXCEPTION_ACCT_NOT_EXISIT="账号或密码不正确";
	public final static String EXCEPTION_ACCT_STATUS="账号状态不正常";
	public final static String EXCEPTION_PASSWD_ERROR="密码错误";
	public final static String EXCEPTION_SENT_MAIL_ERROR="密码错误";
	

}
