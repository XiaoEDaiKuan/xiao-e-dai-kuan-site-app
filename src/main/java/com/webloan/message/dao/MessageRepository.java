package com.webloan.message.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Message;
import com.webloan.model.Order;

public interface MessageRepository extends BaseJpaRepository {

	List<Message> messageListByUser(Long custId);
	List<Object>  messageCountByStatus();
	Message messageDetail(Long messageId);
	void deleteMessage(Long messageId);
}
