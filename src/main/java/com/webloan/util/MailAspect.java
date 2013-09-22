package com.webloan.util;

import java.lang.reflect.Field;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;

/**
 * Mail切面
 * 
 * 
 */
@Aspect
public class MailAspect {

	/**
	 * 拦截send方法处理
	 * 
	 * @param call
	 * @return
	 * @throws Throwable
	 */
	@Around("execution(* arch.chameleon.module.mail.MailEngine.send*(..))")
	public Object sendHandler(ProceedingJoinPoint call) throws Throwable {
		try {
			Object[] args = call.getArgs();
			if (args == null || args.length < 1) {
				log.warn("Method send* must have a parameter at least, ignore invork method [copyTo]");
			} else {
				if (args[0] instanceof SimpleMailMessage) {
					/** 将send*的第一个参数通过copyTo方法覆盖mailMessage,此时可以将配置参数和传入参数进行整合 **/
					Field field = call.getTarget().getClass()
							.getDeclaredField("mailMessage");
					if (!field.isAccessible())
						field.setAccessible(true);
					SimpleMailMessage msg = (SimpleMailMessage) args[0];
					msg.copyTo((SimpleMailMessage) field.get(call.getTarget()));
				} else {
					log.warn("argument is not a instance of SimpleMailMessage, ignore invork method [copyTo]");
				}
			}

			Object rt = call.proceed();
			return rt;
		} catch (Throwable e) {
			log.error("MailEngine Exception: {}",
					new Object[] { e.getMessage() });
			throw e;
		}
	}

	private transient Logger log = LoggerFactory.getLogger(this.getClass());

}
