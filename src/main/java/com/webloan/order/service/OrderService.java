package com.webloan.order.service;

import java.util.List;

import com.webloan.common.Page;
import com.webloan.model.Question;
import com.webloan.model.RequireInfo;
import com.webloan.order.OrderQuery;

public interface OrderService {
	//查询订单
   Page orderListByUser(Long custId,int pageIndex,int pageSize);
   //查询记录条数
   int getOrderCount(Long productId);
   //取消订单
   void modifyOrderStatus(String orderId);
   //删除订单
   void deleteOrder(String orderId);
   //生成订单
   void createOrder(String productId,String custId,String applyName,String  applyTelephone,String applyAmt,String  regionId);
   //发邮件
   void orderEmail(String email,String productId);
   //根据产品id查询关联的问答
   List<Question> listQuestionByPrdId(String productId);
   //根据产品ID查询贷款申请条件
   List<RequireInfo> listRequireInfoByProductId(Long productId);
   
   Page queryOrderByStatus(int pageIndex, int pageSize, String orderStatus);
   
   void createOrder(OrderQuery orderQuery);
}
