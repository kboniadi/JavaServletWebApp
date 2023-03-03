package com.cs137.javaservletwebapp.controller;

import com.cs137.javaservletwebapp.model.Cart;
import com.cs137.javaservletwebapp.model.Product;
import com.cs137.javaservletwebapp.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    private ProductService productService;
//    private EmailService emailService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
        //this.emailService = new EmailService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var res = this.productService.find(Integer.parseInt(request.getParameter("productId")));
        if (res.isPresent()) {
            request.getSession().setAttribute("product", res.get());
            request.getRequestDispatcher("order.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }

        cart.addProduct((Product) request.getSession().getAttribute("product"));
        request.getSession().removeAttribute("product");
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
