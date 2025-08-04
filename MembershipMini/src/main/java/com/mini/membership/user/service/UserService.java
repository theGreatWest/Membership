package com.mini.membership.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mini.membership.user.dto.Car;
import com.mini.membership.user.dto.Card;
import com.mini.membership.user.dto.SignIn;
import com.mini.membership.user.dto.User;
import com.mini.membership.user.mapper.UserMapper;

@Transactional(rollbackFor = Exception.class)
@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
//  회원가입 
//	@Transactional : 쿼리 처리중에 예외 발생시 자동으로 roll-back 시켜주는 어노테이션(AOP)
	public int signUp(User userInput) {
		return userMapper.signUp(userInput);
	}
	
//	로그인 
	public User signIn(SignIn userInput) {
		return userMapper.selectTargetUser(userInput);
	}
	
//  회원 정보 업데이트 
	public int updateUserInfo(User userInput) {
		return userMapper.updateUser(userInput);
	}
	
//  특정 회원이 소유한 모든 차 정보 가져오기
	public List<Car> getCars(int userId){
		return userMapper.getCars(userId);
	}
	
//	특정 회원이 소유한 모든 카드 정보 가져오기 
	public List<Card> getCards(int userId){
		return userMapper.getCards(userId);
	}
}
