package org.example.java_it210_ss02.exception;

public class EmployeeNotFoundException extends RuntimeException {

    public EmployeeNotFoundException(String code) {
        super("Nhan vien [" + code + "] khong ton tai trong he thong");
    }
}
