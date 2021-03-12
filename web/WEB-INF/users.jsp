<%-- 
    Document   : users
    Created on : Mar 9, 2021, 1:19:53 PM
    Author     : 799768
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <form action="user?action=add" method="POST">
            <h1>Add User</h1>
            Email: <input type="text" name="email"> <br>
            First Name: <input type="text" name="firstName"> <br>
            Last Name: <input type="text" name="lastName"> <br>
            Password: <input type="text" name="password"> <br>
            Role:             
            <select name="roles">
                <option value="1">System Admin</option>
                <option value="2">Regular User</option>
                <option value="3">Company Admin</option>
            </select> <br>
            <input type="submit" value="Add">
        </form>

        <form action="user?action=delete" method="POST">
            <h1>Delete Users</h1>
            <table border="1">
                <tr>
                    <th>Email</th>
                    <th>Active</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.getEmail()}</td>
                        <td>${user.isActive()}</td>
                        <td>${user.getFirstName()}</td>
                        <td>${user.getLastName()}</td>
                        <td>${user.getRoleName()}</td>
                        <td>  <input type="radio" name="deleteradiobutton" value="${user.getEmail()}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value = "Delete">
        </form>

        <form action="user?action=edit" method="POST">
            <h1>Edit User</h1>
            Email: <input type="text" name="emailToEdit"> <br>
            First Name: <input type="text" name="firstNameToEdit"> <br>
            Last Name: <input type="text" name="lastNameToEdit"> <br>
            Password: <input type="text" name="passwordToEdit"> <br>
            Role:             
            <select name="rolesToEdit">
                <option value="1">System Admin</option>
                <option value="2">Regular User</option>
                <option value="3">Company Admin</option>
            </select> <br>
            <input type="submit" value="Save Changes">          
        </form>
    </body>
</html>
