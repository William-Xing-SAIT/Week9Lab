<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <form action="user?action=delete" method="POST">
            <h1>Manage Users</h1>
            <p>Pick a user to <!--edit or--> delete.</p>
            <table border="1" style="width:50%; text-align: left;">
                <tr>
                    <th></th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Active User?</th>

                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td> <input type="radio" name="radiobutton" value="${user.getEmail()}"/></td>
                        <td>${user.getFirstName()}</td>
                        <td>${user.getLastName()}</td>
                        <td><a href="mailto:${user.getEmail()}">${user.getEmail()}</a></td>
                        <td>${user.getRole.getRoleName()}</td>
                        <td>${user.getActive()}</td>
                    </tr>
                </c:forEach>
            </table>
            <p></p>
            <!--input type="submit" formaction="user?action=edit" value="Edit"-->
            <input type="submit"  value="Delete">
        </form>

        <form action="user?action=edit" method="POST">
            <h1>Edit User</h1>
            <table>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="firstNameToEdit"></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="lastNameToEdit"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="emailToEdit"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="passwordToEdit"></td>
                </tr>
                <tr>
                    <td>Role:</td>
                    <td>         
                        <select name="rolesToEdit">
                            <option value="1">System Admin</option>
                            <option value="2">Regular User</option>
                            <option value="3">Company Admin</option>
                        </select>
                    </td>
                </tr>
            </table>
            <p></p>
            <input type="submit" value="Save">    
            <input type="reset" value="Reset">
        </form>
    </body>

    <form action="user?action=add" method="POST">
        <h1>Add User</h1>
        <table>
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstName"></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastName"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>Role:</td>
                <td>         
                    <select name="roles">
                        <option value="1">System Admin</option>
                        <option value="2">Regular User</option>
                        <option value="3">Company Admin</option>
                    </select>
                </td>
            </tr>
        </table>
        <p></p>
        <input type="submit" value="Add">
        <input type="reset" value="Reset">
    </form>
</html>