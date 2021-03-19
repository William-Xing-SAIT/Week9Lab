<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Database</title>
    </head>
    <body>
        <form action="user?action=delete" method="POST">
            <h1>Manage Users</h1>
            <p>To delete, pick on any of the users, and then press the Delete button.</p>
            <p>To edit, pick on the check icon representing a user, and the information will show up on 'Edit Form' below.</p>
            <table border="1" style="width:50%; text-align: left;">
                <tr>
                    <th>Delete</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Active User?</th>
                    <th>Edit</th>

                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><input type="radio" name="radiobutton" value="${user.email}"/></td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td><a href="mailto:${user.email}">${user.email}</a></td>
                        <td>${user.role.roleName}</td>
                        <td>${user.active}</td>
                        <td><a href="user?action=edit&amp;email=${user.email}">✅</a></td>
                    </tr>
                </c:forEach>
            </table>
            <p></p>
            <input type="submit"  value="Delete">
        </form>

        <c:if test="${selectedUser eq null}">
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
    </c:if>

    <c:if test="${selectedUser ne null}">
        <form action="user?action=edit" method="POST">
            <h1>Edit User</h1>
            <table>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="firstNameToEdit" value="${selectedUser.firstName}"></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="lastNameToEdit" value="${selectedUser.lastName}"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="emailToEdit" value="${selectedUser.email}"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="passwordToEdit" value="${selectedUser.password}"></td>
                </tr>
                <tr>
                    <td>Role:</td>
                    <td>         
                        <select name="rolesToEdit" value="${selectedUser.role.roleName}">
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
</c:if>

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