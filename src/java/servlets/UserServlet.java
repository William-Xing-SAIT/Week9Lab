package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.UserService;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService us = new UserService();
        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action.equals("add")) {
            String email = (String) request.getParameter("email");
            String firstName = (String) request.getParameter("firstName");
            String lastName = (String) request.getParameter("lastName");
            boolean active = true;
            String password = (String) request.getParameter("password");
            int roleID = (Integer) Integer.parseInt(request.getParameter("roles"));

            UserService us = new UserService();
            try {
                us.insert(email, active, firstName, lastName, password, roleID);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                List<User> users = us.getAll();
                request.setAttribute("users", users);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "error");
            }
            getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        }

        if (action.equals("delete")) {

            String emailToBeDeleted = (String) request.getParameter("radiobutton");
            UserService us = new UserService();
            try {
                us.delete(emailToBeDeleted);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                List<User> users = us.getAll();
                request.setAttribute("users", users);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "error");
            }

            getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        }
        
        if (action.equals("edit")) {
            
            String email = (String) request.getParameter("emailToEdit");
            String firstName = (String) request.getParameter("firstNameToEdit");
            String lastName = (String) request.getParameter("lastNameToEdit");
            boolean active = true;
            String password = (String) request.getParameter("passwordToEdit");
            int roleID = (Integer) Integer.parseInt(request.getParameter("rolesToEdit"));

            UserService us = new UserService();
            try {
                us.update(email, active, firstName, lastName, password, roleID);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                List<User> users = us.getAll();
                request.setAttribute("users", users);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "error");
            }
            getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        }
        
    }

}
