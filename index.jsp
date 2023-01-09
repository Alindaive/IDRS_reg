<%-- 
    Document   : check
    Created on : Jun 30, 2022, 11:46:46 PM
    Author     : Acer
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/";
String database = "ids_reg";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IDS_Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Indexstyle.css" rel="stylesheet" type="text/css">
    </head>
    
<body>
  <div class="container">
    <div class="imglogo">
                <img class="mahidollogo" src="pic/idrsmu.png" alt="idrsmu" style=" width: 300px; height: auto; margin: 0px 170px;">
    </div>
    <div class="title">Registration</div>
    <div class="content">
      <form action="Check.jsp" method="post">
        <div class="user-details">
            
          <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" placeholder="Enter your first name" name="fname" required>
          </div>
            
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" placeholder="Enter your  last name" name="lname" required>
          </div>
            
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter your email" name="email" required>
          </div>
            
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your number" name="phone" required>
          </div>
            
          <div class="input-box">
            <span class="details">Nationality</span>
            <input type="text" placeholder="Enter your nationality" name="nation" required>
          </div>
            
          <div class="input-box">
            <span class="details">Plan</span>
            <select name="planid" class="planid" required >
            <option value="" selected disabled hidden class="textplan">Choose your plan</option>
            <%
                        try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select * from promos";
                            resultSet = statement.executeQuery(sql);
                            while(resultSet.next()){
                        %>
                        <option value="<%=resultSet.getString("promo_id") %>"><%=resultSet.getString("promo_name") %></option>
            <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
          </select>
          </div>
            
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" id="dot-1">
          <input type="radio" name="gender" id="dot-2">
          <input type="radio" name="gender" id="dot-3">
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
                <span class="dot one"></span>
                <span class="gender">Male</span>
            </label>
            <label for="dot-2">
                <span class="dot two"></span>
                <span class="gender">Female</span>
            </label>
            <label for="dot-3">
                <span class="dot three"></span>
                <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="submit" name="action" value="register" >
        </div>
      </form>
    </div>
  </div>

</body>
</html>
