package kr.co.inhatcspring.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.inhatcspring.beans.Member;
import kr.co.inhatcspring.beans.OnlineBoard;
import kr.co.inhatcspring.mapper.MemberMapperInterface;

@Controller
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

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
            session.setAttribute("isManager", String.valueOf(member.getIsManager())); // char -> String 변환

            logger.info("Member details: {}", member);
            logger.info("Session isManager: {}", session.getAttribute("isManager"));

            return "redirect:/"; // 로그인 성공 시 홈 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login"; // 로그인 실패 시 로그인 페이지로 다시 이동
        }
    }

    // 프로필 페이지
    @GetMapping("profile")
    public String profile(HttpSession session, Model model) {
        String userID = (String) session.getAttribute("userID");
        List<OnlineBoard> userPosts = memberMapper.getPostsByUser(userID);
        model.addAttribute("userPosts", userPosts);
        logger.info("User posts: {}", userPosts);
        return "member/profile";
    }

    // 프로필 수정 페이지
    @GetMapping("editProfile")
    public String editProfile(HttpSession session, Model model) {
        String userID = (String) session.getAttribute("userID");
        Member member = memberMapper.getMember(userID);
        model.addAttribute("member", member);
        return "member/editProfile";
    }

    // 프로필 수정 처리
    @PostMapping("editProfile")
    public String editProfileProcess(@RequestParam("userID") String userID, 
                                     @RequestParam("password") String password, 
                                     @RequestParam("nickname") String nickname, 
                                     HttpSession session, 
                                     Model model) {
        String isManagerStr = (String) session.getAttribute("isManager");
        char isManager = (isManagerStr != null && isManagerStr.length() > 0) ? isManagerStr.charAt(0) : 'N';

        Member member = new Member(userID, password, nickname, isManager);
        memberMapper.updateMember(member);
        session.setAttribute("nickname", nickname);
        logger.info("Updated member info: {}", member);
        return "redirect:/profile";
    }

    // 로그아웃 처리
    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        logger.info("Session invalidated");
        return "redirect:/"; // 로그아웃 후 홈 페이지로 리다이렉트
    }

    // 회원가입 페이지
    @GetMapping("join")
    public String join(Model model) {
        model.addAttribute("member", new Member());
        return "join";
    }

    // 회원가입 처리
    @PostMapping("join")
    public String joinProcess(@Valid @ModelAttribute("member") Member member, 
                              BindingResult result, 
                              Model model, 
                              HttpSession session) {
        Member existingMember = memberMapper.getMember(member.getUserID());
        if (existingMember != null) {
            result.rejectValue("userID", "error.member", "User ID already exists");
        }
        if (result.hasErrors()) {
            return "join";
        }
        member.setIsManager('N');
        memberMapper.insertMember(member);

        // 세션 설정하여 자동 로그인
        session.setAttribute("userID", member.getUserID());
        session.setAttribute("nickname", member.getNickname());
        session.setAttribute("isManager", String.valueOf(member.getIsManager()));

        logger.info("New member registered: {}", member);
        return "redirect:/"; // 회원가입 성공 후 홈 페이지로 리다이렉트
    }
}