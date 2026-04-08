package org.example.java_it210_ss02.controller;

import org.example.java_it210_ss02.model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ReportController {

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @RequestMapping("/report")
    public String report(Model model) {
        List<Student> students = new ArrayList<>();

        students.add(new Student("SV01", "Nguyen Van A", 8.5));
        students.add(new Student("SV02", "Tran Thi B", 7.0));
        students.add(new Student("SV03", "Le Van C", 5.5));

        model.addAttribute("students", students);

        return "report";
    }
}
