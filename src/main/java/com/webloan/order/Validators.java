package com.webloan.order;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static com.webloan.order.ValidatorType.*;

public class Validators {

	public static List<ValidatorError> validateAll(List<ValidatorInfo> vinfo) {
		if (vinfo == null) {
			return null;
		}
		
		List<ValidatorError> verr = new ArrayList<ValidatorError>();
		for (ValidatorInfo info : vinfo) {
			Validator v = createValidator(info.getType());
			ValidatorError err = v.doValidate(info);
			
			if (err != null) {
				verr.add(err);
			}
		}
		
		return verr;
	}
	
	private static Validator createValidator(String type) {
		if (IN.equals(type)) {
			return new InValidator();
		}
		if (BETWEEN.equals(type)) {
			return new BetweenValidator();
		}
		if (GE.equals(type) || GT.equals(type) || LE.equals(type) || LT.equals(type)) {
			GlteValidator v = new GlteValidator();
			v.type = type;
			return v;
		}
		return new EqualValidator();
	}
	
	static interface Validator {
		ValidatorError doValidate(ValidatorInfo info);
	}
	
	static class EqualValidator implements Validator {
		public ValidatorError doValidate(ValidatorInfo info) {
			Object smpVal = info.getValue();
			Object expVal = getPropValue(info.getSource(), info.getProperty());
			
			if (expVal == null || expVal.equals(smpVal)) {
				return null;
			}
			
			ValidatorError err = new ValidatorError();
			err.setInfo(info);
			err.setMessage(info.getMessageTemplate());
			
			return err;
		}
	}
	static class InValidator implements Validator {
		public ValidatorError doValidate(ValidatorInfo info) {
			Object smpVal = info.getValue();
			Object expVal = getPropValue(info.getSource(), info.getProperty());
			
			if (expVal == null || smpVal == expVal) {
				return null;
			}
			if (smpVal != null && expVal.toString().indexOf(smpVal.toString()) >= 0) {
				return null;
			}
			
			ValidatorError err = new ValidatorError();
			err.setInfo(info);
			err.setMessage(info.getMessageTemplate());
			
			return err;
		}
	}
	static class GlteValidator implements Validator {
		String type = GE;
		public ValidatorError doValidate(ValidatorInfo info) {
			Object smpVal = info.getValue();
			Object expVal = getPropValue(info.getSource(), info.getProperty());
			
			if (expVal == null) {
				return null;
			}
			
			BigDecimal smpNum = null;
			BigDecimal expNum = null;
			
			try {
				smpNum = new BigDecimal(smpVal.toString());
				expNum = new BigDecimal(expVal.toString());
			} catch (Exception e) {}
			
			if (smpNum != null && expNum != null) {
				int eqFlag = smpNum.compareTo(expNum);
				
				if ((GE.equals(type) && eqFlag >= 0) 
						|| (GT.equals(type) && eqFlag > 0)
						|| (LE.equals(type) && eqFlag <= 0)
						|| (LT.equals(type) && eqFlag < 0)) {
					return null;
				}
			}
			
			ValidatorError err = new ValidatorError();
			err.setInfo(info);
			err.setMessage(info.getMessageTemplate());
			
			return err;
		}
	}
	static class BetweenValidator implements Validator {
		String minPrefix = "min";
		String maxPrefix = "max";
		
		String getPropertyName(String propName, String prefix) {
			return propName == null || propName.trim().length() == 0 
					? prefix 
					: prefix + propName.substring(0, 1).toUpperCase() + propName.substring(1);
		}
		
		public ValidatorError doValidate(ValidatorInfo info) {
			Object smpVal = info.getValue();
			
			Object minExpVal = getPropValue(info.getSource(), 
					getPropertyName(info.getProperty(), minPrefix));
			Object maxExpVal = getPropValue(info.getSource(), 
					getPropertyName(info.getProperty(), maxPrefix));
			
			if (minExpVal == null && maxExpVal == null) {
				return null;
			}
			if (smpVal == null && (minExpVal == null || maxExpVal == null)) {
				return null;
			}
			
			BigDecimal smpNum = null;
			BigDecimal minExpNum = null;
			BigDecimal maxExpNum = null;
			
			try {
				smpNum = new BigDecimal(smpVal.toString());
				minExpNum = new BigDecimal(minExpVal.toString());
				maxExpNum = new BigDecimal(maxExpVal.toString());
			} catch (Exception e) {}
			
			if (smpVal != null && minExpVal != null && maxExpVal != null) {
				int bigFlag = smpNum.compareTo(minExpNum);
				int smallFlag = smpNum.compareTo(maxExpNum);
				
				if (bigFlag >= 0 && smallFlag <= 0) {
					return null;
				}
			}
			
			ValidatorError err = new ValidatorError();
			err.setInfo(info);
			err.setMessage(info.getMessageTemplate());
			
			return err;
		}
	}
	
	private static Object getPropValue(Object bean, String propChain) {
		if (propChain == null || "".equals(propChain.trim())) {
			return null;
		}
		if (bean instanceof Map<?, ?>) {
			Map<?, ?> map = (Map<?, ?>) bean;
			return map.get(propChain);
		}
		
		String[] propPath = propChain.split("\\.");
		List<String> path = Arrays.asList(propPath);
		
		try {
			return getProperty(bean, path);
		} catch (Exception e) {
			return null;
		}
	}
	
	private static Object getProperty(Object bean, List<String> path) throws Exception {
		String propName = path.get(0);
		List<String> subPath = null;
		Object ret = null;
		
		if (path.size() > 1) {
			subPath = path.subList(1, path.size());
		}
		
		try {
			PropertyDescriptor propDesc = new PropertyDescriptor(propName, bean.getClass());
			ret = propDesc.getReadMethod().invoke(bean);
		} catch (Exception e) {
			BeanInfo beanInfo = Introspector.getBeanInfo(bean.getClass());
			PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
			
			for (PropertyDescriptor pd : pds) {
				if (pd.getName().equalsIgnoreCase(propName)) {
					ret = pd.getReadMethod().invoke(bean);
					break;
				}
			}
		}
		
		if (subPath != null) {
			return getProperty(ret, subPath);
		}
		
		return ret;
	}
	
	public static void main(String[] args) throws Exception {
		ParentBean p = new ParentBean();
		SubBean c = new SubBean();
		c.setName("child");
		c.setAge(23);
		p.setName("parent");
		p.setTypes("|0|2|3|");
		p.setAge(49);
		p.setMaxIssue(20L);
		p.setMinIssue(10L);
		p.setChild(c);
		
		ValidatorInfo v1 = new ValidatorInfo();
		v1.setMessageTemplate("err equal");
		v1.setName("v1");
		v1.setType("equal");
		v1.setSource(p);
		v1.setValue(49);
		v1.setProperty("child.age");
		EqualValidator ev = new EqualValidator();
		ValidatorError e1 = ev.doValidate(v1);
		System.out.println(e1 == null ? null : e1.getMessage());
		
		ValidatorInfo v2 = new ValidatorInfo();
		v2.setMessageTemplate("err in");
		v2.setName("v2");
		v2.setType("in");
		v2.setSource(p);
		v2.setValue("1");
		v2.setProperty("types");
		InValidator iv = new InValidator();
		ValidatorError e2 = iv.doValidate(v2);
		System.out.println(e2 == null ? null : e2.getMessage());
		
		ValidatorInfo v3 = new ValidatorInfo();
		v3.setMessageTemplate("err btwn");
		v3.setName("v3");
		v3.setType("btwn");
		v3.setSource(p);
		v3.setValue(9L);
		v3.setProperty("issue");
		BetweenValidator bv = new BetweenValidator();
		ValidatorError e3 = bv.doValidate(v3);
		System.out.println(e3 == null ? null : e3.getMessage());
		
		ValidatorInfo v4 = new ValidatorInfo();
		v4.setMessageTemplate("err glte");
		v4.setName("v4");
		v4.setType("gt");
		v4.setSource(p);
		v4.setValue(10L);
		v4.setProperty("minIssue");
		GlteValidator gv = new GlteValidator();
		gv.type = v4.getType();
		ValidatorError e4 = gv.doValidate(v4);
		System.out.println(e4 == null ? null : e4.getMessage());
	}
	
	static class ParentBean {
		private String name;
		private String types;
		private Integer age;
		private Long minIssue;
		private Long maxIssue;
		private SubBean child;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getAge() {
			return age;
		}
		public String getTypes() {
			return types;
		}
		public void setTypes(String types) {
			this.types = types;
		}
		public void setAge(Integer age) {
			this.age = age;
		}
		public Long getMinIssue() {
			return minIssue;
		}
		public void setMinIssue(Long minIssue) {
			this.minIssue = minIssue;
		}
		public Long getMaxIssue() {
			return maxIssue;
		}
		public void setMaxIssue(Long maxIssue) {
			this.maxIssue = maxIssue;
		}
		public SubBean getChild() {
			return child;
		}
		public void setChild(SubBean child) {
			this.child = child;
		}
	}
	static class SubBean {
		private String name;
		private Integer age;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getAge() {
			return age;
		}
		public void setAge(Integer age) {
			this.age = age;
		}
	}
}
