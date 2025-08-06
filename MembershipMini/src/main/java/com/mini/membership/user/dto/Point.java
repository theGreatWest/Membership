package com.mini.membership.user.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private int pointId;
	private int userId;
	private String type;
	private int amount;
	private Timestamp processedAt; 
}
