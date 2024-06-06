package kr.co.inhatcspring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.inhatcspring.beans.OnlineBoard;
import kr.co.inhatcspring.mapper.MapperInterface;

@Controller
public class PostController {

    @Autowired
    private MapperInterface mapper;
    
    /**
     *  controller for managing posts.
     */

    // Navigate to the post creation page
    @GetMapping("Post")
    public String formPost(@RequestParam("category") String category, Model model) {
        model.addAttribute("category", category); // Add 'category' attribute to the model
        return "Post"; // Return the view for post creation form
    }

    // Handle post creation form submission
    @PostMapping("/submitPost")
    public String insertBoardData(@RequestParam("category") String category,
                                  @RequestParam("title") String title,
                                  @RequestParam("userID") String userID,
                                  @RequestParam("content") String content) {
        OnlineBoard boardDataBean = new OnlineBoard();
        boardDataBean.setCategory(category);
        boardDataBean.setTitle(title);
        boardDataBean.setContent(content);
        boardDataBean.setUserId(userID);

        // Save the data
        mapper.insertBoardData(boardDataBean);

        return "redirect:/" + category; // Redirect to the category page after insertion
    }
    
    // Navigate to the post viewing page
    @GetMapping("/viewPost")
    public String viewPost(@RequestParam("boardId") Long boardId, Model model) {
        OnlineBoard boardDataBean = mapper.getBoardData(boardId);
        model.addAttribute("boardDataBean", boardDataBean); // Add 'boardDataBean' attribute to the model
        return "viewPost"; // Return the view for viewing a post
    }
    /**
     * Method to handle editing a post.
     *
     * @param boardId  the ID of the board to edit
     * @param category the category of the board
     * @param model    the model to pass attributes
     * @return the name of the view to render
     */
    @GetMapping("/editPost")
    public String editPost(@RequestParam("boardId") Long boardId,
                           @RequestParam("category") String category,
                           Model model) {
        OnlineBoard boardDataBean = mapper.getBoardData(boardId);
        model.addAttribute("boardDataBean", boardDataBean);
        model.addAttribute("category", category); // Add the category to the model
        return "editPost"; // Return the view for editing a post
    }
    // Handle post update submission
    @PostMapping("/{category}/updatePost")
    public String updateBoardData(@RequestParam("boardId") Long boardId,
                                  @RequestParam("category") String category,
                                  @RequestParam("title") String title,
                                  @RequestParam("content") String content) {
        OnlineBoard boardDataBean = new OnlineBoard();
        boardDataBean.setBoardId(boardId);
        boardDataBean.setCategory(category);
        boardDataBean.setTitle(title);
        boardDataBean.setContent(content);

        // Update the data
        mapper.updateBoardData(boardDataBean);

        return "redirect:/" + category; // Redirect to the category page after updating
    }

    // Handle post deletion
    @GetMapping("/deletePost")
    public String deletePost(@RequestParam("boardId") Long boardId, @RequestParam("category") String category) {
        mapper.deleteBoardData(boardId);
        return "redirect:/" + category; // Redirect to the category page after deletion
    }
}
