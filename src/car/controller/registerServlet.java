package car.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.dao.CarDAO;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String CustIc = request.getParameter("CustIc");
		String CustName = request.getParameter("CustName");
		String CustPhoneNum = request.getParameter("CustPhoneNum");
		String CustEmail = request.getParameter("CustEmail");
		String CustAddress = request.getParameter("CustAddress");
		String CustPostcode = request.getParameter("CustPostcode");
		String CustCity = request.getParameter("CustCity");
		String CustPassword = request.getParameter("CustPassword");
		
		CarDAO.Register(CustIc, CustName, CustPhoneNum,CustEmail, CustAddress, CustPostcode, CustCity, CustPassword );
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		System.out.println("test");
		rd.forward(request, response);
	}

}
