package com.mini.membership.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {
	private int carId;
	private int userId;
	private String model;
	private String carNumber;
	private String carName;
	private Date releaseDate;
}
