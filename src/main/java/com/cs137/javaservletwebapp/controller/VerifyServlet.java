package com.cs137.javaservletwebapp.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "VerifyServlet", value = "/verify")
public class VerifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            String authcode = (String) request.getSession().getAttribute("authcode");
            String code = request.getParameter("authcode");
            if(code.equals(authcode)){
                out.println("Verification Done");
            }else{
                out.println("Incorrect verification code");
            }
        }
    }
}
