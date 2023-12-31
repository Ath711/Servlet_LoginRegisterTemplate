<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
                    <h1 class="text-center mb-4"><%= "Login" %></h1>
                    <form action="login" method="post">
                        <div class="mb-3">
                            <label for="loginUsername" class="form-label">Username:</label>
                            <input type="text" class="form-control" id="loginUsername" name="loginUsername" required>
                        </div>
                        <div class="mb-3">
                            <label for="loginPassword" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="loginPassword" name="loginPassword" required>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                    <p class="text-center">Don't have an account? <a href="registration.jsp">Sign up</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add this script block to your existing index.jsp file -->
<script>
    // Check for session attribute and display prompt
    var registrationSuccess = <%= session.getAttribute("registrationSuccess") %>;
    if (registrationSuccess === true) {
        alert('Registration successful! You can now log in.');
        // Reset the session attribute to avoid showing the prompt on subsequent visits
        <% session.removeAttribute("registrationSuccess"); %>
        window.location.replace("index.jsp")
    }
</script>

<script>
    // Check for session attribute and display prompt
    var invalidUsername = <%= session.getAttribute("invalidUsername") %>;
    if (invalidUsername === true) {
        alert('Username or password invalid');
        // Reset the session attribute to avoid showing the prompt on subsequent visits
        <% session.removeAttribute("invalidUsername"); %>
        window.location.replace("index.jsp")
    }
</script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
