package com.mini.membership.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Card {
	private int cardId;
	private int userId;
	private String cardType;
	private String cardName;
	private String cardNumber;
	private Date applicationDate;
	private String status;
}
