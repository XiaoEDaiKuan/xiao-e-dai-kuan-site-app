package com.webloan.order.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import com.webloan.common.BaseJpaRepositoryImpl;
import com.webloan.common.Page;
import com.webloan.common.Queriable;
import com.webloan.order.OrderStatus;
import com.webloan.model.Cust;
import com.webloan.model.Order;
import com.webloan.model.Product;
import com.webloan.model.Question;
import com.webloan.model.Region;
import com.webloan.model.RequireInfo;
import com.webloan.order.dao.OrderRepository;
import com.webloan.util.DateUtils;

public class OrderRepositoryImpl extends BaseJpaRepositoryImpl implements
		OrderRepository {

	@Override
	public Page orderListByUser(Long custId,int pageIndex,int pageSize) {
		
		return this.queryPage(pageIndex, pageSize, Order.class,new String[] { "cust.id" },new Object[] { custId });
    
	}
	
	@Override
	public void modifyOrderStatus(Long orderId) {
		Order orderObj = this.load(Order.class, orderId);
		orderObj.setStatus(String.valueOf(OrderStatus.orderCancel.getIndex()));
		this.update(orderObj);

	}

	@Override
	public int getOrderCount(Long productId) {
		StringBuilder jpql = new StringBuilder("select count(*) from Order o where 1=1 ");
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (productId != null) {
			jpql.append(" and o.product.id=:productId ");
			params.put("productId", productId);
		}
		
		Object count = querySingleResult(jpql.toString(), params);
		return ((Number) count).intValue();
	}

	@Override
	public void deleteOrder(Long orderId) {
		Order orderObj = this.load(Order.class, orderId);
		this.delete(orderObj);
	}

	

	@Override
	public void createOrder(Long productId, Long custId, String applyName,
			String applyTelephone, BigDecimal applyAmt, Long regionId) {
		Product product = this.load(Product.class, productId);
		Cust cust = this.load(Cust.class, custId);
		Order order = new Order();
		order.setCust(cust);
		order.setProduct(product);
		order.setApplyName(applyName);
		order.setApplyAmt(applyAmt);
		order.setApplyTelephone(applyTelephone);
		Region region=this.load(Region.class, regionId);
		order.setRegion(region);
		order.setOrderTime(DateUtils.getTimeStamp());
		this.save(order);
	}

	@Override
	public Product getProduct(Long productId) {
		return this.load(Product.class, productId);

	}

	// 根据产品id查询关联的问答
	@Override
	public List<Question> listQuestionByPrdId(Long productId) {

		return this.queryList(Question.class, new String[] { "product.id" },
				new Object[] { productId });
	}

	// 根据产品ID查询贷款申请条件
	@Override
	public List<RequireInfo> listRequireInfoByProductId(Long productId) {

		return this.queryList(RequireInfo.class, 
				new String[] { "product.id", "status" }, 
				new Object[] { productId, "1" }, 
				new String[] { Queriable.EQ, Queriable.EQ });
	}

}
