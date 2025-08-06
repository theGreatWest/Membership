package com.mini.membership.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.membership.user.dto.Car;
import com.mini.membership.user.dto.Card;
import com.mini.membership.user.dto.Point;
import com.mini.membership.user.dto.SignIn;
import com.mini.membership.user.dto.User;

@Mapper
public interface UserMapper {
	// 특정 회원 정보 가져오기 
	User selectTargetUser(SignIn user);
	
	// 회원가입 
	int signUp(User user);
	
	// 회원 정보 업데이트 
	int updateUser(User user);
	
	// 특정 회원의 자동차 정보 가져오기
	List<Car> getCars(int userId);
	
	// 특정 회원의 카드 정보 가져오기 
	List<Card> getCards(int userId);
	
	// 특정 회원의 포인트 정보 가져오기
	List<Point> getPoints(int userId);
}
