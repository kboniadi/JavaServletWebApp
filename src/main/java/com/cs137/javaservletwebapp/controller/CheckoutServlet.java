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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="CheckoutServlet", value="/checkout")
public class CheckoutServlet extends HttpServlet{

    private ProductService productService;

    List<Product> checkoutProducts;


    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
        checkoutProducts = new ArrayList<>();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var cart = (Cart) request.getSession().getAttribute("cart");
        for (Product product : cart.getProducts()){
            productService.writePurchase(product.getId());
        }
    }
}
