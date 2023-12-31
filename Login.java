package com.example.loginregistrationtemplate;

import java.io.*;
import java.sql.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {

    static {
        try{
            Class.forName("org.postgresql.Driver");
        }
        catch (ClassNotFoundException e){
            System.out.println(e);
        }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response){
        final String username = request.getParameter("loginUsername");
        final String password = request.getParameter("loginPassword");

        final String url = "jdbc:postgresql://localhost:5432/LoginRegisterTemplate";
        final String usernameJdbc = "postgres";
        final String passwordJdbc = "password";


        try(Connection connection = DriverManager.getConnection(url, usernameJdbc, passwordJdbc); Statement statement = connection.createStatement()){

            ResultSet resultSet = statement.executeQuery("select username,password from userdetails");
            boolean userExist = false;
            while(resultSet.next()){
                String validUsername = resultSet.getString(1);
                String validPassword = resultSet.getString(2);
                if(username.equals(validUsername) && password.equals(validPassword)) {
                    userExist = true;
                    break;
                }

            }

            if(userExist){
                request.getSession().setAttribute("username",username);
                response.sendRedirect("home");
            }
            else{
                request.getSession().setAttribute("invalidUsername",true);
                response.sendRedirect("index.jsp");
                // to avoid showing the prompt on subsequent visits
                response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
                response.setHeader("Pragma","no-cache");
                response.setDateHeader("Expires",0);
            }
        }
        catch (SQLException | IOException e){
            System.out.println(e);
        }

    }
}