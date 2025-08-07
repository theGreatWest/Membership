package com.mini.membership.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mini.membership.HomeController;
import com.mini.membership.dto.Car;
import com.mini.membership.dto.Card;
import com.mini.membership.dto.Point;
import com.mini.membership.dto.SignIn;
import com.mini.membership.dto.Signup;
import com.mini.membership.dto.User;
import com.mini.membership.service.EmailService;
import com.mini.membership.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@Autowired
    private EmailService emailService;
	
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
		User result = service.signIn(email);
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
	
	
//  회원가입 
	@PostMapping("/sign_up")
	public String signup(
			@RequestParam String name,
	        @RequestParam String email,
	        @RequestParam String password
	) {
		// 비밀번호를 암호화해서 바꾸기 
		String encodedPassword = service.encodePassword(password);
		
		Signup input = new Signup(name, email, encodedPassword);
		
		service.signUp(input);
		
		return "home";
	}
	
//	새 비밀번호 발급받기 
	@PostMapping("/generate_new_password")
	public ResponseEntity<Map<String, Object>> getNewPassword(
			@RequestBody Map<String, String> request
	) {
		String email = request.get("email");
		Map<String, Object> response = new HashMap<>();
		
		// 존재하는지 확인
		User user = service.signIn(email);
		if(user==null) return null;
		
		// 새 비밀번호 발급
		String newPWD = service.generateNewPassword();
		
		// 새 비밀번호 암호화 
		user.setPassword(service.encodePassword(newPWD));
			
		// 새 비밀번호 db에 저장 
		service.updateNewPWD(user);
			
		// 새 비밀번호 프론트로 
		response.put("success", true);
		response.put("message", "새 비밀번호가 생성되었습니다. 이메일로 발송을 진행하세요.");
		response.put("newPassword", newPWD);
		    
		return ResponseEntity.ok(response);
	}
	
}
