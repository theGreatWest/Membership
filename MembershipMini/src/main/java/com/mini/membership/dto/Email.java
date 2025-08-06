package com.mini.membership.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Email {
	private int authId;       
    private String email;      
    private String authCode;    
    private Timestamp expireTime; 
    private Timestamp createdAt;

}
