package com.webloan.message.dao;

import java.util.List;

import com.webloan.common.BaseJpaRepository;
import com.webloan.common.Page;
import com.webloan.model.Message;
import com.webloan.model.Order;

public interface MessageRepository extends BaseJpaRepository {

	Page messageListByUser(Long custId,int pageIndex,int pageSize);
	List<Object>  messageCountByStatus(Long custId);
	Message messageDetail(Long messageId);
	void deleteMessage(Long messageId);
}
