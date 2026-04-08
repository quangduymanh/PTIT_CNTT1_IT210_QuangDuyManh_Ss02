package org.example.java_it210_ss02.service;

import org.example.java_it210_ss02.exception.EmployeeNotFoundException;
import org.example.java_it210_ss02.model.Employee;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeService {
    private final List<Employee> employees = new ArrayList<>();

    public EmployeeService() {
        employees.add(new Employee("NV001", "Nguyen Thi Lan", "Ke toan", 15000000, toDate("2020-03-01"), "Dang lam"));
        employees.add(new Employee("NV002", "Tran Van Hung", "Ky thuat", 25000000, toDate("2019-07-15"), "Dang lam"));
        employees.add(new Employee("NV003", "Le Minh Duc", "Kinh doanh", 18500000, toDate("2021-11-20"), "Nghi phep"));
        employees.add(new Employee("NV004", "Pham Thu Huong", "Ky thuat", 22000000, toDate("2022-01-05"), "Dang lam"));
        employees.add(new Employee("NV005", "Hoang Van Nam", "Ke toan", 12000000, toDate("2023-06-10"), "Thu viec"));
    }

    public List<Employee> getAll() {
        return employees;
    }

    public Employee findByCode(String code) {
        return employees.stream()
                .filter(employee -> employee.getCode().equals(code))
                .findFirst()
                .orElseThrow(() -> new EmployeeNotFoundException(code));
    }

    public double getTechTotalSalary() {
        return employees.stream()
                .filter(employee -> "Ky thuat".equals(employee.getDepartment()))
                .mapToDouble(Employee::getSalary)
                .sum();
    }

    private Date toDate(String isoDate) {
        LocalDate localDate = LocalDate.parse(isoDate);
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }
}
