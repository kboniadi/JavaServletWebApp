package com.cs137.javaservletwebapp.service;

import com.cs137.javaservletwebapp.model.Employee;
import com.cs137.javaservletwebapp.utils.DBSource;
import com.cs137.javaservletwebapp.utils.PreparedStatementWrapper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {
    public List<Employee> getEmployees() {
        String sql = "SELECT * FROM Employee;";
        List<Employee> employees = new ArrayList<>();
        try (
                Connection connection = DBSource.getDataSource().getConnection();
                PreparedStatementWrapper stat = new PreparedStatementWrapper(connection, sql) {
                    @Override
                    protected void prepareStatement(Object... params) throws SQLException {
                        // nothing
                    }
                };
                ResultSet response = stat.executeQuery();
        ) {
            // this will only run if the response has something
            while (response.next()) {
                employees.add(new Employee(
                        response.getString("profileURL"),
                        response.getString("name"),
                        response.getString("title"),
                        response.getString("email")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
}
