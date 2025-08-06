package com.mini.membership.email.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.mini.membership.email.dto.EmailAuth;

@Mapper
public interface EmailMapper {
	// 특정 이메일의 인증 코드 저장 
	void setEmailVerifyCode(EmailAuth emailAuth);
		
	// 특정 이메일의 유효한 인증 코드 가져오기 
	int verify(EmailAuth emailAuth);
	
	// 만료된 인증 코드 삭제 
	void deleteExpiredAuthCodes();
}
