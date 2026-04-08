package org.example.java_it210_ss02.controller;

import jakarta.servlet.http.HttpSession;
import org.example.java_it210_ss02.service.AuthService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            Model model,
            HttpSession session
    ) {
        String role = authService.authenticate(username, password);
        if (role == null) {
            model.addAttribute("errorMessage", "Sai tai khoan hoac mat khau");
            return "login";
        }

        session.setAttribute("loggedUser", username);
        session.setAttribute("role", role);
        return "redirect:/employees";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
