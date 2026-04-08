package org.example.java_it210_ss02.controller;

import jakarta.servlet.http.HttpSession;
import org.example.java_it210_ss02.model.Employee;
import org.example.java_it210_ss02.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class EmployeeController {
    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/employees")
    public String list(Model model, HttpSession session) {
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        model.addAttribute("employees", employeeService.getAll());
        model.addAttribute("techTotalSalary", employeeService.getTechTotalSalary());
        return "employees";
    }

    @GetMapping("/employees/{code}")
    public String detail(@PathVariable String code, Model model, HttpSession session) {
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        Employee employee = employeeService.findByCode(code);
        model.addAttribute("emp", employee);
        return "employee-detail";
    }
}
