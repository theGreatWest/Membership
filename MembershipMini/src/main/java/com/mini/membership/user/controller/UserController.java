package com.mini.membership.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mini.membership.HomeController;
import com.mini.membership.user.dto.Car;
import com.mini.membership.user.dto.Card;
import com.mini.membership.user.dto.Point;
import com.mini.membership.user.dto.SignIn;
import com.mini.membership.user.dto.User;
import com.mini.membership.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	private Logger logger = LoggerFactory.getLogger(HomeController.class);
	
//	로그인
	@PostMapping("/sign_in")
	public String signIn(
			Model model, 
			HttpSession session, 
			@RequestParam String email,
	        @RequestParam String password
	) {
	    // 아이디(이메일) 검증
		User result = service.signIn(new SignIn(email,password));
		if(result==null) {
			logger.info(">> [로그인 실패] 존재하지 않는 이메일");
			return "redirect:/";
		}
		
		// 비밀번호 검증
		boolean verifyResult = service.verifyPassword(password, result.getPassword());
		if(!verifyResult) {
			logger.info(">> [로그인 실패] 비밀번호 오류");
			return "redirect:/";
		}
		
		logger.info(">> [로그인 성공]");
		session.setAttribute("signInUser", result); // 로그인 정보 session에 저장 
		
		model.addAttribute("id", result.getUserId());
		model.addAttribute("name", result.getName());
		model.addAttribute("password", result.getPassword());
		model.addAttribute("email", result.getEmail());
		model.addAttribute("photo", result.getPhoto());
		
		List<Car> cars = service.getCars(result.getUserId());
		model.addAttribute("carNum", cars.size());
		
		List<Card> cards = service.getCards(result.getUserId());
		model.addAttribute("cards", cards);
		
		List<Point> points = service.getPoints(result.getUserId());
		int totPoint = 0;
		for(Point obj : points) {
			totPoint += obj.getAmount();
		}
		model.addAttribute("totPoint", totPoint);
		
		return "jsps/my_page";
	}
	
//	로그아웃 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 무효화 (모든 세션 속성 제거)
	    session.invalidate();
	    
	    return "redirect:/";
	}
	
//	이메일 인증 
	
	
	
//  회원가입 
	@PostMapping("/sign_up")
	public String signup(
			@ModelAttribute User userInput
	) {
		// 비밀번호를 암호화해서 바꾸기 
		String encodedPassword = service.encodePassword(userInput.getPassword());
		userInput.setPassword(encodedPassword);
		
		service.signUp(userInput);
		return "home";
	}
	
}
