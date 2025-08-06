package com.mini.membership.service;

import org.springframework.stereotype.Service;

import com.mini.membership.dto.EmailAuth;
import com.mini.membership.mapper.EmailMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

@Service
public class EmailService {
	@Autowired
	private EmailMapper emailMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 인증코드 검증 
	public boolean verify(EmailAuth emailAuth) {
		int result = emailMapper.verify(emailAuth);
		emailMapper.deleteExpiredAuthCodes();
		
		return result >= 1;
	}
	
	// 인증코드 객체 저장 및 이메일 발송 
	public void sendEmail(String email) {
		String code = generateVerifyCode();
		
		emailMapper.setEmailVerifyCode(new EmailAuth(email, code));
		
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(email);
		msg.setSubject("Membership Service 인증 코드");
		msg.setText("인증코드: "+code);
		msg.setFrom("kyjinterview@gmail.com");
		
		mailSender.send(msg);
	}
	
	// 인증코드 생성
	private String generateVerifyCode() {
		return String.valueOf((int)(Math.random() * 900000) + 100000);
	}
	
}
