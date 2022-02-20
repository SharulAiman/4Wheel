package car.controller;
 
import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import car.dao.CarDAO;
 
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public AdminLoginServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String AdminId = request.getParameter("AdminId");
        String AdminPassword = request.getParameter("AdminPassword");
         
        CarDAO adminDao = new CarDAO();
         
        try {
            AccountBean admin = adminDao.loginAdmin(AdminId, AdminPassword);
            String destPage = "login2.jsp";
             
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("AdminId", admin);
                destPage = "adminMenu.jsp";
            } 
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
             
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }
}