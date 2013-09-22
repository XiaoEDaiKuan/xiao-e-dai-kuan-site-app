package com.webloan.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.mail.SimpleMailMessage;

/**
 * EMAIL发送引擎接口
 * 
 * 
 */
public interface MailEngine {

	
	/**
	 * 初始化模板
	 * @param templateName classpath下的目标名称(带相对路径)
	 * @param model 目标定义的变量--值
	 * @return
	 */
	String initTemplate(String templateName, Map<String, Object> model);
	
	/**
	 * 发送纯文本邮件
	 * @param msg 邮件信息
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	boolean sendTextMail(SimpleMailMessage msg)  throws MessagingException, UnsupportedEncodingException;


	/**
	 * 发送带附件的纯文本邮件
	 * @param msg 邮件信息
	 * @param attachments 附件信息
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	boolean sendTextMail(SimpleMailMessage msg, File[] attachments) throws MessagingException, UnsupportedEncodingException;

	/**
	 * 发送HTML格式的邮件
	 * @param msg 邮件信息
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	boolean sendHtmlMail(SimpleMailMessage msg) throws MessagingException, UnsupportedEncodingException;

	/**
	 * 发送带附件的HTML格式的邮件
	 * @param msg 邮件信息
	 * @param attachments 附件信息
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	boolean sendHtmlMail(SimpleMailMessage msg, File[] attachments) throws MessagingException, UnsupportedEncodingException;

}

