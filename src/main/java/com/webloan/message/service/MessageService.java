package com.webloan.message.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.Message;

public interface MessageService {
    //查询站内消息
	Page messageListByUser(String strCustId,int pageIndex,int pageSize);
	//根据消息状态分类汇总个数
	List<Object> messageCountByStatus(String custId);
	//根据消息id，返回详细信息
	Message messageDetail(String strMessageId);
	//删除消息
	void deleteMessage(String strMessageId);
}
