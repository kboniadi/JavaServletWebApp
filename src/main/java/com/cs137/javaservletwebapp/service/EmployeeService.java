package com.cs137.javaservletwebapp.service;

import com.cs137.javaservletwebapp.model.Employee;

import java.util.Arrays;
import java.util.List;

public class EmployeeService {
    public List<Employee> getEmployees() {
        return Arrays.asList(
                new Employee("img/profile-pic.jpg", "kord", "software engineer", "kord@uci.edu"),
                new Employee("img/profile-pic.jpg", "hannah", "software engineer", "hannah@uci.edu"),
                new Employee("img/profile-pic.jpg", "alice", "software engineer", "alice@uci.edu"));
    }
}
