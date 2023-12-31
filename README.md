# Login and Registration Template

This is a simple login and registration template built with Java Servlets, PostgreSQL, and Bootstrap. The template provides basic functionality for user registration, login, and a home page after successful authentication.

![Screenshot 2023-12-31 134808](https://github.com/Ath711/Servlet_LoginRegisterTemplate/assets/142080233/c73d5d56-dd36-4bf1-a2f9-e464ed649c7a)

![Screenshot 2023-12-31 134836](https://github.com/Ath711/Servlet_LoginRegisterTemplate/assets/142080233/f6889431-ae1f-4701-8b3e-89de6bf2abfb)

![Screenshot 2023-12-31 134828](https://github.com/Ath711/Servlet_LoginRegisterTemplate/assets/142080233/88d39edf-315f-4a1b-b89b-9cbcc88a2009)

![Screenshot 2023-12-31 134852](https://github.com/Ath711/Servlet_LoginRegisterTemplate/assets/142080233/c3dd1908-9176-4f07-8605-4e8d3da97256)

![Screenshot 2023-12-31 134919](https://github.com/Ath711/Servlet_LoginRegisterTemplate/assets/142080233/e07782a8-dc12-4813-b83e-fc6aec91ecb0)


## Table of Contents

- Files and Components
  - Java Servlets
  - JSP Pages
  - Database Schema
  - Web.xml File
- Instructions
- Notes

## Files and Components

### Java Servlets

#### 1. `Login` Servlet (`com.example.loginregistrationtemplate.Login`)

- Handles user login.
- Checks the entered credentials against the PostgreSQL database.
- Redirects to the home page on successful login or back to the login page with an error message on failure.
- Utilizes the `org.postgresql.Driver` for PostgreSQL database connectivity.

#### 2. `Register` Servlet (`com.example.loginregistrationtemplate.Register`)

- Manages user registration.
- Validates whether the entered username already exists in the PostgreSQL database.
- Inserts new user details into the database on successful registration.
- Redirects to the registration page with an error message if the username already exists.

#### 3. `Home` Servlet (`com.example.loginregistrationtemplate.Home`)

- Handles the home page after a successful login.
- Retrieves the username from the session and displays a welcome message.

### JSP Pages

#### 1. `index.jsp`

- Provides the login form.
- Displays registration success or invalid login prompt using JavaScript.

#### 2. `registration.jsp`

- Contains the registration form.
- Displays a prompt if the entered username already exists.

### Database Schema

- **Database Name:** `LoginRegisterTemplate`
- **Table Name:** `userdetails`
- **Columns:**
  - `name` (text)
  - `username` (text, primary key)
  - `password` (text)

### Web.xml File

- Configures servlet mappings.
```xml
      <servlet>
        <servlet-name>Login</servlet-name>
        <servlet-class>com.example.loginregistrationtemplate.Login</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>Login</servlet-name>
        <url-pattern>/login</url-pattern>
    </servlet-mapping>
    <servlet>
        <servlet-name>Register</servlet-name>
        <servlet-class>com.example.loginregistrationtemplate.Register</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>Register</servlet-name>
        <url-pattern>/register</url-pattern>
    </servlet-mapping>
    <servlet>
        <servlet-name>Home</servlet-name>
        <servlet-class>com.example.loginregistrationtemplate.Home</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>Home</servlet-name>
        <url-pattern>/home</url-pattern>
    </servlet-mapping>
```
## Instructions

1. **Setup Database:**
   - Create a PostgreSQL database named `LoginRegisterTemplate`.
   - Execute the provided SQL script to create the `userdetails` table:

```sql
CREATE TABLE userdetails (
  name TEXT,
  username TEXT PRIMARY KEY,
  password TEXT
);
```


2. **Configure Database Connection:**
   - Update the database connection details (`url`, `usernameJdbc`, `passwordJdbc`) in the `Login` and `Register` servlets.

3. **Run the Application:**
   - Deploy the application to a servlet container (e.g., Apache Tomcat).
   - Access the application at the appropriate URL (e.g., `http://localhost:8080/loginregistrationtemplate`).

4. **Usage:**
   - Visit the login page (`index.jsp`) to log in.
   - Access the registration page (`registration.jsp`) to create a new account.

## Notes

- The template uses Java Servlets and PostgreSQL for server-side processing.
- Bootstrap is used for styling the HTML forms.
- Client-side JavaScript is employed to display prompts on registration success and invalid login.
- Cache control headers are added to prevent the browser from caching error prompts.

Feel free to customize and expand this template based on your specific requirements.
