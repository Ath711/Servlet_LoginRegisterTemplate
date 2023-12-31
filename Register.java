package com.example.loginregistrationtemplate;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {

    static {
        try{
            Class.forName("org.postgresql.Driver");
        }
        catch (ClassNotFoundException e){
            System.out.println(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        final String name = request.getParameter("registerName");
        final String Username = request.getParameter("registerUsername");
        final String password = request.getParameter("registerPassword");

        final String url = "jdbc:postgresql://localhost:5432/LoginRegisterTemplate";
        final String usernameJdbc = "postgres";
        final String passwordJdbc = "password";

        try(Connection connection = DriverManager.getConnection(url, usernameJdbc, passwordJdbc); Statement statement = connection.createStatement()){

            ResultSet resultSet = statement.executeQuery("select username from userdetails;");
            boolean usernameExist = false;
            while(resultSet.next()){
               String existingUsername = resultSet.getString(1);
               if(Username.equals(existingUsername)) {
                   usernameExist = true;
                   break;
               }

            }

            if(usernameExist) {
                request.getSession().setAttribute("usernameExist", true);
                response.sendRedirect("registration.jsp");
                // to avoid showing the prompt on subsequent visits
                response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
                response.setHeader("Pragma","no-cache");
                response.setDateHeader("Expires",0);
            }
            else {
                String sql = "insert into userdetails values (?,?,?);";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, Username);
                preparedStatement.setString(3, password);
                preparedStatement.execute();
                request.getSession().setAttribute("registrationSuccess",true);
                response.sendRedirect("index.jsp");
                // to avoid showing the prompt on subsequent visits
                response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
                response.setHeader("Pragma","no-cache");
                response.setDateHeader("Expires",0);
            }
        }
        catch (SQLException e){
            System.out.println(e);
        }


    }

}