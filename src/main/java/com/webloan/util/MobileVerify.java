package com.webloan.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MobileVerify {
	public static boolean isMobileNO(String mobiles) {
		boolean flag = false;
		try {
			Pattern p = Pattern
					.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
			Matcher m = p.matcher(mobiles);
			flag = m.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public static boolean isNum(String number) {
		boolean flag = false;
		try {
			Pattern p = Pattern.compile("^[0-9]{11}$");
			Matcher m = p.matcher(number);
			flag = m.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
}
