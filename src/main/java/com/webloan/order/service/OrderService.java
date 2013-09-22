package com.webloan.order.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import com.webloan.model.Cust;
import com.webloan.model.Order;
import com.webloan.model.Product;

public interface OrderService {
	//查询订单
   List<Order> orderListByUser(String strCustId);
   //查询记录条数
   int orderCount();
   //取消订单
   void modifyOrderStatus(String orderId);
   //删除订单
   void deleteOrder(String orderId);
   //生成订单
   void createOrder(String productId,String custId,String applyName,String  applyTelephone,String applyAmt,String  custRegion);
   
}
