package com.cs137.javaservletwebapp.controller;

import com.cs137.javaservletwebapp.service.CheckoutService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(name="CheckoutServlet", value="/checkout")
public class CheckoutServlet extends HttpServlet{
    private CheckoutService checkout;

    @Override
    public void init() throws ServletException {
        super.init();
        this.checkout = new CheckoutService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("checkoutProducts", this.checkout.getCheckout());
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
