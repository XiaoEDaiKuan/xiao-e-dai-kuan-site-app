package com.webloan.util.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.webloan.util.MailEngine;

/**
 * EMAIL引擎默认实现
 *
 */
public class DefaultMailEngine implements MailEngine {

	public String initTemplate(String templateName, Map<String, Object> model){
		
		return VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, templateName, model);
		
	}

	
	public boolean sendTextMail(SimpleMailMessage msg) throws MessagingException, UnsupportedEncodingException{
		sendTextMail(mailMessage, null);
		return true;
	}

	public boolean sendTextMail(SimpleMailMessage msg, File[] attachments) throws MessagingException, UnsupportedEncodingException {
		MimeMessage mineMsg = ((JavaMailSenderImpl) mailSender).createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mineMsg, true);		
		this.copyTo(mailMessage, helper, false);
		if(attachments != null){
			for(File attachment : attachments){
				if(this.verifyAttachments(attachment))
					helper.addAttachment(attachment.getName(), attachment);
			}
		}
		((JavaMailSenderImpl) mailSender).send(mineMsg);
		return true;
	}
	
	public boolean sendHtmlMail(SimpleMailMessage msg) throws MessagingException, UnsupportedEncodingException{
		return sendHtmlMail(msg, null);
	}

	public boolean sendHtmlMail(SimpleMailMessage msg, File[] attachments)  throws MessagingException, UnsupportedEncodingException{
		MimeMessage mineMsg = ((JavaMailSenderImpl) mailSender).createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mineMsg, true);		
		this.copyTo(msg, helper, true);
		if(attachments != null){
			for(File attachment : attachments){
				if(this.verifyAttachments(attachment))
					helper.addAttachment(attachment.getName(), attachment);
			}
		}	
		((JavaMailSenderImpl) mailSender).send(mineMsg);
		return true;
	}

	
	/**
	 * 附件验证
	 * @param file
	 * @return
	 * @throws MessagingException
	 */
	private boolean verifyAttachments(File attachment) throws MessagingException{
		if(attachment == null)
			throw new MessagingException("attachment is null");
		if(!attachment.exists())
			throw new MessagingException("attachment is not exist");
		if(!attachment.isFile())
			throw new MessagingException("attachment is not a file");
		if(!attachment.canRead())
			throw new MessagingException("attachment cannot be read");
		return true;
	}
	
	/**
	 * 将SimpleMailMessage信息拷贝到MimeMessageHelper中
	 * @param msg SimpleMailMessage
	 * @param target MimeMessageHelper
	 * @param isHTML 是否HTML格式
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException 
	 */
	public void copyTo(SimpleMailMessage msg, MimeMessageHelper target,
			boolean isHTML) throws MessagingException, UnsupportedEncodingException {
		if(msg == null)log.error("The 'msg' message argument cannot be null");
		if(target == null)log.error("The 'target' message argument cannot be null");
		if (msg.getFrom() != null && displayName != null)
			target.setFrom(new InternetAddress(msg.getFrom(), displayName));
		else if(msg.getFrom() != null)
			target.setFrom(msg.getFrom());		
		if (msg.getReplyTo() != null)
			target.setReplyTo(msg.getReplyTo());
		if (msg.getTo() != null)
			target.setTo(msg.getTo());
		if (msg.getCc() != null)
			target.setCc(msg.getCc());
		if (msg.getBcc() != null)
			target.setBcc(msg.getBcc());
		if (msg.getSentDate() != null)
			target.setSentDate(msg.getSentDate());
		if (msg.getSubject() != null)
			target.setSubject(msg.getSubject());
		if (msg.getText() != null)
			target.setText(msg.getText(), isHTML);
	}

	private transient Logger log = LoggerFactory.getLogger(this.getClass());
	private MailSender mailSender;
	private VelocityEngine velocityEngine;
	private SimpleMailMessage mailMessage;
	private String displayName;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
}
