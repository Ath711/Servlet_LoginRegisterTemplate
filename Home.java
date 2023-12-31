package com.example.loginregistrationtemplate;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Home", value = "/home")
public class Home extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       String username = (String) request.getSession().getAttribute("username");
       PrintWriter printWriter = response.getWriter();
       printWriter.println("Hello "+ username);
    }


}