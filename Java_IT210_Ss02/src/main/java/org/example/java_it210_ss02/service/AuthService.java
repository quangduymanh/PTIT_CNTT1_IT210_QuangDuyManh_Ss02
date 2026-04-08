package org.example.java_it210_ss02.service;

import org.springframework.stereotype.Service;

@Service
public class AuthService {

    public String authenticate(String username, String password) {
        if ("hr_manager".equals(username) && "hr123".equals(password)) {
            return "hr_manager";
        }
        if ("hr_staff".equals(username) && "staff456".equals(password)) {
            return "hr_staff";
        }
        return null;
    }
}
