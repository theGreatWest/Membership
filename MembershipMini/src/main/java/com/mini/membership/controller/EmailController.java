package com.mini.membership.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	public ResponseEntity<Void> sendEmail(
			@RequestBody Map<String, String> request
	) {
        String email = request.get("email");
        if (email == null || email.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }
        service.sendEmail(email);
        return ResponseEntity.ok().build();
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
	
}
