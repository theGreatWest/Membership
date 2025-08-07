package com.mini.membership.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mini.membership.dto.EmailAuth;
import com.mini.membership.service.EmailService;

@RestController
@RequestMapping("api/email")
public class EmailController {
	@Autowired
	private EmailService service;
	
	@PostMapping("/send")
	public ResponseEntity<Map<String, Object>> sendEmail(
			@RequestBody Map<String, String> request
	) {
        String email = request.get("email");
        
        Map<String, Object> response = new HashMap<>();

        if (email == null || email.isEmpty()) {
            response.put("success", false);
            response.put("message", "이메일이 비어 있습니다.");
            
            return ResponseEntity.badRequest().body(response);
        }

        try {
            service.sendEmail(email);
            
            response.put("success", true);
            response.put("message", "메일 전송 성공: " + email);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "메일 전송 실패: " + e.getMessage());
            
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    } 
	
	@PostMapping("/verify")
	public ResponseEntity<Map<String, Boolean>> verifyCode(
			@RequestBody Map<String, String> request
	) {
        String email = request.get("email");
        String code = request.get("code");
        
        boolean verified = false;
        if (email != null && code != null) {
            EmailAuth emailAuth = new EmailAuth(email, code);
            verified = service.verify(emailAuth);
        }
        
        Map<String, Boolean> response = new HashMap<>();
        response.put("verified", verified);
        return ResponseEntity.ok(response);
    }
	
	@PostMapping("/send_new_password")
	public ResponseEntity<Map<String, Object>> sendNewPasswordEmail(
			@RequestBody Map<String, String> request
	) {
        String email = request.get("email");
        String newPwd = request.get("newPassword");
        
        Map<String, Object> response = new HashMap<>();

        if (email == null || email.isEmpty()) {
            response.put("success", false);
            response.put("message", "이메일이 비어 있습니다.");
            
            return ResponseEntity.badRequest().body(response);
        }

        try {
            service.sendCustomEmail(email, "새비밀번호 발급" ,"[ 새비밀번호 ] "+newPwd);
            
            response.put("success", true);
            response.put("message", "메일 전송 성공: " + email);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "메일 전송 실패: " + e.getMessage());
            
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    } 
	
}
