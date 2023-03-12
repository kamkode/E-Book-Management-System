package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.mysql.cj.Session;

@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			if (dao.forgotPassword(email, phno, password)) {
				session.setAttribute("succMsg", "Password change sucessfully");
				resp.sendRedirect("forgot.jsp");
			} else {
				session.setAttribute("failedMsg", "something wrong on server ! try again");
				resp.sendRedirect("forgot.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
