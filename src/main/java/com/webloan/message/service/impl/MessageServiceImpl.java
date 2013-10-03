package com.webloan.message.service.impl;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.message.dao.MessageRepository;
import com.webloan.message.service.MessageService;
import com.webloan.model.Message;

public class MessageServiceImpl implements MessageService{

	private MessageRepository messageRepository;
	
	@Override
	public Page messageListByUser(String strCustId,int pageIndex,int pageSize) {
		Long custId = strCustId == null ? null : Long.valueOf(strCustId);
		return messageRepository.messageListByUser(custId,pageIndex,pageSize);
	}

	public MessageRepository getMessageRepository() {
		return messageRepository;
	}

	public void setMessageRepository(MessageRepository messageRepository) {
		this.messageRepository = messageRepository;
	}

	@Override
	public List<Object> messageCountByStatus(String strCustId) {
		Long custId = strCustId == null ? null : Long.valueOf(strCustId);
		return messageRepository.messageCountByStatus(custId);
	}

	@Override
	public Message messageDetail(String strMessageId) {
		Long messageId=strMessageId==null?null:Long.valueOf(strMessageId);
		return messageRepository.messageDetail(messageId);
	}

	@Override
	public void deleteMessage(String strMessageId) {
	 Long messageId=strMessageId==null?null:Long.valueOf(strMessageId);
     messageRepository.deleteMessage(messageId);		
	}


}
