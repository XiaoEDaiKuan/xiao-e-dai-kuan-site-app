package com.webloan.message.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.message.dao.MessageRepository;
import com.webloan.model.Message;

public class MessageRepositoryImpl extends BaseJpaRepositoryImpl implements
		MessageRepository {

	@Override
	public List<Message> messageListByUser(Long custId) {
		return this.queryList(Message.class, new String[] { "cust.id" },
				new Object[] { custId });
	}

	@Override
	public List<Object> messageCountByStatus() {
		StringBuilder jpql = new StringBuilder(
				"select count(m.id) from Message m  group by m.status order by m.status asc)");
		TypedQuery<Object> query = entityManager.createQuery(jpql.toString(), Object.class);
		
		return query.getResultList();
	}


	@Override
	public Message messageDetail(Long messageId) {
		return this.load(Message.class, messageId);
	}


	@Override
	public void deleteMessage(Long messageId) {
		Message message=this.load(Message.class, messageId);
		this.delete(message);
	}

}
