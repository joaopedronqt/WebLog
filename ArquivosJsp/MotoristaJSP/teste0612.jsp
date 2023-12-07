<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Submission</title>
</head>
<body>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String jdbcUrl = "jdbc:mysql://localhost:4306/"weblogdb";
    String username = "root";
    String password = "";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Register JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Open a connection
        connection = DriverManager.getConnection(jdbcUrl, username, password);

        // Get form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        // Insert data into the database
        String sql = "INSERT INTO your_table_name (first_name, last_name) VALUES (?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, firstName);
        preparedStatement.setString(2, lastName);
        preparedStatement.executeUpdate();

        out.println("<h2>Data inserted successfully!</h2>");
    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }
    
%>

<form action="form.jsp" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" name="firstName" required><br>

    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" required><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>