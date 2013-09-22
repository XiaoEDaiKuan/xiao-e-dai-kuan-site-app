package com.webloan.order.dao.impl;


import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Query;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.order.OrderStatus;
import com.webloan.model.Cust;
import com.webloan.model.Order;
import com.webloan.model.Product;
import com.webloan.order.dao.OrderRepository;


public class OrderRepositoryImpl extends BaseJpaRepositoryImpl implements OrderRepository{

	@Override
	public List<Order> orderListByUser(Long custId) {
		return this.queryList(Order.class, new String[]{"cust.id"}, new Object[]{custId});
	}

	@Override
	public void modifyOrderStatus(Long orderId) {
		Order orderObj=this.load(Order.class, orderId);
		orderObj.setStatus(String.valueOf(OrderStatus.orderCancel.getIndex()));
	    this.update(orderObj);
	
	}


	@Override
	public int orderCount() {
		String countJpql="select count(*) from Order o ";
		Query countQuery = entityManager.createQuery(countJpql);
		Object count = countQuery.getSingleResult();
		return ((Number)count).intValue();
	}


	@Override
	public void deleteOrder(Long orderId) {
     Order orderObj=this.load(Order.class, orderId);
     this.delete(orderObj);
	}


	@Override
	public void createOrder(Long productId, Long custId, String applyName,
			String applyTelephone, BigDecimal applyAmt, String custRegion) {
     Product product=this.load(Product.class, productId); 
	 Cust    cust=this.load(Cust.class, custId);
	 Order order=new Order();
	 order.setCust(cust);
	 order.setProduct(product);
	 order.setApplyName(applyName);
	 order.setApplyAmt(applyAmt);
	 order.setApplyTelephone(applyTelephone);
	 order.setCustRegion(custRegion);
	 this.save(order);
	}

}
