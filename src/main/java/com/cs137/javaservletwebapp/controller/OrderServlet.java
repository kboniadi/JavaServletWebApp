package com.cs137.javaservletwebapp.controller;

import com.cs137.javaservletwebapp.model.Product;
import com.cs137.javaservletwebapp.service.EmailService;
import com.cs137.javaservletwebapp.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    private ProductService productService;
//    private EmailService emailService;

    private List<Product> products;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
        //this.emailService = new EmailService();
        products = new ArrayList<>();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var res = this.productService.find(Integer.parseInt(request.getParameter("productId")));
        if (res.isPresent()) {
            request.setAttribute("product", res.get());
            request.getRequestDispatcher("order.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = (Product) request.getSession().getAttribute("product");
        products.add(product);
        request.getSession().setAttribute("checkoutProducts", products);
        response.sendRedirect("products");


//        //TODO: validate form data and initiate order confirmation and email verification
//        try (PrintWriter out = response.getWriter()) {
//            String email = request.getParameter("product");
//            //get the 6-digit code
//            String code = this.emailService.getRandom();
//            //check if the email send successfully
//            if(this.emailService.sendEmail(email, code)){
//                request.getSession().setAttribute("authcode", code);
//                response.sendRedirect("verify.jsp");
//            }else{
//                out.println("Failed to send verification email");
//            }
//
//        }
    }
}
