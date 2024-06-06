package kr.co.inhatcspring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.inhatcspring.beans.OnlineBoard;
import kr.co.inhatcspring.mapper.MapperInterface;

@Controller
public class TestController {

    @Autowired
    private MapperInterface mapper;

    /**
     * Directs to the homepage.
     */
    @GetMapping("/")
    public String home() {
        return "index"; // View for the homepage
    }

    // ===============================
    // Department Information Controller
    // ===============================

    /**
     * Directs to the department introduction page.
     *
     * @param category the category of the board (default: "Department Introduction")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/departmentIntrodunction")
    public String aboutDepartment(@RequestParam(value = "category", required = false, defaultValue = "Department Introduction") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for department introduction
    }

    /**
     * Directs to the department history page.
     *
     * @param category the category of the board (default: "Department History")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/departmentHistory")
    public String departmentHistory(@RequestParam(value = "category", required = false, defaultValue = "Department History") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for department history
    }

    // ===============================
    // Curriculum Controller
    // ===============================

    /**
     * Directs to the first-year curriculum page.
     *
     * @param category the category of the board (default: "firstYear")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/firstYear")
    public String firstGrade(@RequestParam(value = "category", required = false, defaultValue = "firstYear") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for first-year curriculum
    }

    /**
     * Directs to the second-year curriculum page.
     *
     * @param category the category of the board (default: "secondYear")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/secondYear")
    public String secondGrade(@RequestParam(value = "category", required = false, defaultValue = "secondYear") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for second-year curriculum
    }

    /**
     * Directs to the third-year curriculum page.
     *
     * @param category the category of the board (default: "thirdYear")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/thirdYear")
    public String thirdGrade(@RequestParam(value = "category", required = false, defaultValue = "thirdYear") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for third-year curriculum
    }

    /**
     * Directs to the advanced major curriculum page.
     *
     * @param category the category of the board (default: "advancedMajor")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/advancedMajor")
    public String advancedMajor(@RequestParam(value = "category", required = false, defaultValue = "advancedMajor") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for advanced major curriculum
    }

    // ===============================
    // Community Controller
    // ===============================

    /**
     * Directs to the notification page.
     *
     * @param category the category of the board (default: "notification")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/notification")
    public String notification(@RequestParam(value = "category", required = false, defaultValue = "notification") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for notification
    }

    /**
     * Directs to the frequently asked questions (FAQ) page.
     *
     * @param category the category of the board (default: "frequently-asked-questions")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/FrequentlyAskedQuestions")
    public String frequentlyAskedQuestions(@RequestParam(value = "category", required = false, defaultValue = "FAQ") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for frequently asked questions
    }

    /**
     * Directs to the free board page.
     *
     * @param category the category of the board (default: "free-board")
     * @param model the model to add attributes to for rendering the view
     * @return the view name
     */
    @GetMapping("/FreeBoard")
    public String freeBoard(@RequestParam(value = "category", required = false, defaultValue = "FreeBoard") String category, Model model) {
        List<OnlineBoard> boardList = mapper.getBoardList(category);
        model.addAttribute("boardList", boardList);
        model.addAttribute("category", category);
        return "viewList"; // View for free board
    }

    // ===============================
    // Directions Controller
    // ===============================

    /**
     * Directs to the directions page.
     *
     * @return the view name
     */
    @GetMapping("WayToCome")
    public String directions() {
        return "WayToCome"; // View for directions
       
    }
}
