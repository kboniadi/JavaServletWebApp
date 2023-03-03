package com.cs137.javaservletwebapp.controller;

import com.cs137.javaservletwebapp.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PurchasedServlet", urlPatterns = "/purchased")
public class PurchasedServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var products = productService.getLastNPurchases(5);
        request.setAttribute("purchased", products);
        request.getRequestDispatcher("purchased.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
