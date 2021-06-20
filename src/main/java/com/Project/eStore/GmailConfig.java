package com.Project.eStore;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Configuration
public class GmailConfig {

	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setDefaultEncoding("utf-8");
		sender.setHost("smtp.gmail.com");
		sender.setPort(465);
		sender.setUsername("tannv9820@gmail.com");
		sender.setPassword("1Hightbar@");
		Properties props = sender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.starttls.required", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.ssl.enable", "true");
		return sender;
	}
}
