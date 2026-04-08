package org.example.java_it210_ss02.controller;
import org.example.java_it210_ss02.model.Order;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String orders(HttpSession session, ServletContext application, Model model) {
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        List<Order> orders = new ArrayList<>();
        orders.add(new Order("OD01", "Laptop", 15000000, new Date()));
        orders.add(new Order("OD02", "Chuột", 350000, new Date()));
        orders.add(new Order("OD03", "Bàn phím", 850000, new Date()));

        model.addAttribute("orders", orders);

        AtomicInteger counter = (AtomicInteger) application.getAttribute("totalViewCount");
        if (counter == null) {
            counter = new AtomicInteger(0);
            application.setAttribute("totalViewCount", counter);
        }
        counter.incrementAndGet();

        return "orders";
    }
}