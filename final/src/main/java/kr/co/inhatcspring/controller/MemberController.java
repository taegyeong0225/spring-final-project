package kr.co.inhatcspring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.inhatcspring.mapper.MapperInterface;

@Controller
public class MemberController {
	
	@Autowired
    private MapperInterface mapper;
	
	// 로그인
    @GetMapping("login")
    public String login() {
        return "login";
    }
    
	// 회원가입 
    @GetMapping("join")
    public String join() {
        return "join";
    }
}
