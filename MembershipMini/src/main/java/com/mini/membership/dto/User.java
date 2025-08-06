package com.mini.membership.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int userId;
	private String name;
	private String photo;
	private String email;
	private String password;
}
