package com.webloan.product.view;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mvel2.MVEL;

import com.webloan.common.Page;
import com.webloan.model.Product;
import com.webloan.model.ProductAttach;
import com.webloan.order.service.OrderService;

public class ProductViewHelper {
	
	@Resource OrderService orderService;
	
	public Page transferPageToView(Page page, ProductQuery pq) {
		List<?> items = page.getItems();
		List<Object> retList = new ArrayList<Object>();
		
		for (Object item : items) {
			if (item instanceof Product) {
				retList.add(transferProductToView((Product) item, pq));
			}
			else if (item instanceof ProductAttach) {
				retList.add(transferAttachToView((ProductAttach) item, pq));
			}
			else {
				retList.add(item);
			}
		}
		
		page.setItems(retList);
		return page;
	}

	public List<ProductView> transferProductListToView(List<Product> src, ProductQuery pq) {
		if (src == null) {
			return null;
		}
		
		List<ProductView> retList = new ArrayList<ProductView>();
		
		for (Product p : src) {
			retList.add(transferProductToView(p, pq));
		}
		
		return retList;
	}

	public List<ProductView> transferAttachListToView(List<ProductAttach> src, ProductQuery pq) {
		if (src == null) {
			return null;
		}

		List<ProductView> retList = new ArrayList<ProductView>();
		
		for (ProductAttach p : src) {
			retList.add(transferAttachToView(p, pq));
		}
		
		return retList;
	}
	
	public ProductView transferProductToView(Product p, ProductQuery pq) {
		ProductView pv = new ProductView();
		
		pv.setProduct(p);
		pv.setNumOrders(orderService.getOrderCount(p.getId()));
		
		String intrFormula = p.getIntrFormula();
		String monFormula = p.getMonthlyFormula();
		
		Map<String, Object> vars = new HashMap<String, Object>();
		if (pq.getLoanAmt() != null) {
			vars.put("M", pq.getLoanAmt());
			vars.put("m", pq.getLoanAmt());
		}
		if (pq.getLoanIssue() != null) {
			vars.put("Q", pq.getLoanIssue());
			vars.put("q", pq.getLoanIssue());
		}
		if (p.getIntrRate() != null && p.getIntrRate().compareTo(BigDecimal.ZERO) > 0) {
			vars.put("I", p.getIntrRate());
			vars.put("i", p.getIntrRate());
		}
		vars.put("F", p.getInitialRate() == null ? BigDecimal.ZERO : p.getInitialRate());
		vars.put("f", p.getInitialRate() == null ? BigDecimal.ZERO : p.getInitialRate());
		
		pv.setInterest(calcInterest(intrFormula, vars));
		pv.setMonthlyPay(calcInterest(monFormula, vars));
		
		return pv;
	}
	public ProductView transferAttachToView(ProductAttach pa, ProductQuery pq) {
		ProductView pv = transferProductToView(pa.getProduct(), pq);
		pv.setAttach(pa);
		return pv;
	}
	
	private BigDecimal calcInterest(String formula, Map<String, Object> vars) {
		if (formula == null || "".equals(formula)) {
			return null;
		}
		System.out.println(formula);
		System.out.println(vars);
		formula = formula.replace("^", "**");
		BigDecimal ret = null;
		
		try {
			Object result = MVEL.eval(formula, vars);
			ret = new BigDecimal(result.toString()).setScale(6, RoundingMode.HALF_UP);
			System.out.println(ret);
		} catch (Exception e) {}
		
		return ret;
	}
}
