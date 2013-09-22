package com.webloan.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static String FOROMAT_LENGTH_8 = "yyyyMMdd";

	public static String FORMAT_LENGTH_10 = "yyyy-MM-dd";

	public static Date getUtilDate() {
		return new Date();
	}

	public static Long getLongTime() {
		return getUtilDate().getTime();
	}

	public static Timestamp getTimeStamp() {
		return new Timestamp(getLongTime());
	}

	public static String dateToString(Date date, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}

	public static String dateToString(Date date) {
		SimpleDateFormat format = new SimpleDateFormat(FORMAT_LENGTH_10);
		return format.format(date);
	}

	public static void main(String[] args) {
		System.out.println("format:"
				+ dateToString(new Date(), FOROMAT_LENGTH_8));
		System.out.println("format:" + dateToString(new Date()));
	}
}
