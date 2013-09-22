package com.webloan.util;

import java.util.regex.Matcher;

import java.util.regex.Pattern;

public class EmailVerify {

	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {

			String check = "^\\w+([-+.]\\w+)*@+\\w+\\.+(com|cn|net|org|name|info|biz|cc|tv|me|co|so|tel|mobi|asia|gov.cn)";

			Pattern regex = Pattern.compile(check);

			Matcher matcher = regex.matcher(email);

			flag = matcher.matches();

		} catch (Exception e) {

			flag = false;
		}
		return flag;
	}
}
