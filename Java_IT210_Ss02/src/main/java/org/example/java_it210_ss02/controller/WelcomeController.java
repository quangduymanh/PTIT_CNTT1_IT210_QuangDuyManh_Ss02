package org.example.java_it210_ss02.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {

    @RequestMapping("/welcome")
    public String welcome(Model model) {
        model.addAttribute("employeeName", "Quang Duy Manh");
        return "welcome";
    }
}