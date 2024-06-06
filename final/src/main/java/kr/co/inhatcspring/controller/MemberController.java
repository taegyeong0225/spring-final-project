package kr.co.inhatcspring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.inhatcspring.beans.Member;
import kr.co.inhatcspring.mapper.MemberMapperInterface;

@Controller
public class MemberController {
    
    @Autowired
    private MemberMapperInterface memberMapper;
    
    // 로그인 페이지
    @GetMapping("login")
    public String login() {
        return "login";
    }

    // 로그인 처리
    @PostMapping("login")
    public String loginProcess(@RequestParam("userID") String userID, 
                               @RequestParam("password") String password, 
                               HttpSession session, 
                               Model model) {
        Member member = memberMapper.getMember(userID);
        if (member != null && member.getPassword().equals(password)) {
            session.setAttribute("userID", member.getUserID());
            session.setAttribute("nickname", member.getNickname());
            session.setAttribute("isManager", member.getIsManager());
            return "redirect:/"; // 로그인 성공 시 홈 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login"; // 로그인 실패 시 로그인 페이지로 다시 이동
        }
    }

    // 로그아웃 처리
    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/login"; // 로그아웃 후 로그인 페이지로 리다이렉트
    }
    
    // 회원가입 페이지
    @GetMapping("join")
    public String join() {
        return "join";
    }

    // 회원가입 처리
    @PostMapping("join")
    public String joinProcess(@RequestParam("userID") String userID, 
                              @RequestParam("password") String password, 
                              @RequestParam("nickname") String nickname, 
                              Model model) {
        Member existingMember = memberMapper.getMember(userID);
        if (existingMember == null) {
            Member newMember = new Member(userID, password, nickname, 'N');
            memberMapper.insertMember(newMember);
            return "redirect:/login"; // 회원가입 성공 시 로그인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "User ID already exists");
            return "join"; // 회원가입 실패 시 회원가입 페이지로 다시 이동
        }
    }
}