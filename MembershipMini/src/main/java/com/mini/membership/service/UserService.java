package com.mini.membership.service;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mini.membership.dto.Car;
import com.mini.membership.dto.Card;
import com.mini.membership.dto.Point;
import com.mini.membership.dto.SignIn;
import com.mini.membership.dto.Signup;
import com.mini.membership.dto.User;
import com.mini.membership.mapper.UserMapper;

@Transactional(rollbackFor = Exception.class)
@Service
public class UserService {
	private final PasswordService passwordService;
	private static final String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final String SPECIAL = "!@#$%^&*()-_=+[]{};:,.<>?";
    private static final String ALL = LETTERS + SPECIAL;
    private static final SecureRandom random = new SecureRandom();
	
	@Autowired
	private UserMapper userMapper;
	
    @Autowired
    public UserService(PasswordService passwordService) {
        this.passwordService = passwordService;
    }
	
//  회원가입 
//	@Transactional : 쿼리 처리중에 예외 발생시 자동으로 roll-back 시켜주는 어노테이션(AOP)
	public int signUp(Signup userInput) {
		return userMapper.signUp(userInput);
	}
	
//	로그인 
	public User signIn(String email) {
		return userMapper.selectTargetUser(email);
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
	
//	특정 회원이 소유한 모든 포인터 정보 가져오기
	public List<Point> getPoints(int userId){
		return userMapper.getPoints(userId);
	}
	
//	비밀번호 암호화
	public String encodePassword(String userInputPassword) {
		return passwordService.encode(userInputPassword);
	}
	
//	비밀번호 검증
	public boolean verifyPassword(String userInputPassword, String encodedPassword) {
		return passwordService.verify(userInputPassword, encodedPassword);
	}
	
// 새 비밀번호 생성
    public String generateNewPassword() {
        StringBuilder password = new StringBuilder();

        // 조건 충족: 영어 1개, 특수문자 1개 포함
        password.append(LETTERS.charAt(random.nextInt(LETTERS.length())));
        password.append(SPECIAL.charAt(random.nextInt(SPECIAL.length())));

        // 나머지 6자리 랜덤 추가
        for (int i = 0; i < 6; i++) {
            password.append(ALL.charAt(random.nextInt(ALL.length())));
        }

        // 순서 섞기
        return shuffle(password.toString());
    }

    private String shuffle(String input) {
        char[] array = input.toCharArray();
        for (int i = array.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            char temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
        return new String(array);
    }

	public void removeAccount(int userId) {
		userMapper.removeAccount(userId);
	}
}
