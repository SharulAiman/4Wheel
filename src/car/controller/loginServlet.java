package car.controller;
 
import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import car.dao.CarDAO;
 
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public loginServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String CustIc = request.getParameter("CustIc");
        String CustPassword = request.getParameter("CustPassword");
         
        CarDAO userDao = new CarDAO();
         
        try {
            AccountBean user = userDao.login(CustIc, CustPassword);
            String destPage = "index.jsp";
             
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("CustIc", user);
                destPage = "menu.jsp";
            } 
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
             
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }
}