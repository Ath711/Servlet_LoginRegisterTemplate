<%--
  Created by IntelliJ IDEA.
  User: Atharv Kulkarni
  Date: 31-12-2023
  Time: 01:38 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>LoginRegistrationTemplate</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h1 class="text-center mb-4"><%= "Register" %></h1>
          <form action="register" method="post">
            <div class="mb-3">
              <label for="registerName" class="form-label">Name:</label>
              <input type="text" class="form-control" id="registerName" name="registerName" required>
            </div>
            <div class="mb-3">
              <label for="registerUsername" class="form-label">Username:</label>
              <input type="text" class="form-control" id="registerUsername" name="registerUsername" required>
            </div>
            <div class="mb-3">
              <label for="registerPassword" class="form-label">Password:</label>
              <input type="password" class="form-control" id="registerPassword" name="registerPassword" required>
            </div>
            <div class="mb-3">
              <button type="submit" class="btn btn-primary">Register</button>
            </div>
          </form>
          <p class="text-center">Already have an account? <a href="index.jsp">Sign in</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // Check for session attribute and display prompt
  var usernameExist = <%= session.getAttribute("usernameExist") %>;
  if (usernameExist === true) {
    alert('Username already exist.');
    // Reset the session attribute to avoid showing the prompt on subsequent visits
    <% session.removeAttribute("usernameExist"); %>
    window.location.replace("registration.jsp")
  }
</script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
