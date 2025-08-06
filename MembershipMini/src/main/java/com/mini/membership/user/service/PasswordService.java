package com.mini.membership.user.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PasswordService {
	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	public String encode(String rawPassword) {
        return passwordEncoder.encode(rawPassword);
    }

	// 해싱X 비밀번호(사용자입력), DB에 입력된 해싱O 비밀번호 
    public boolean verify(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }

}
