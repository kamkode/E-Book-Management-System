<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%
	String st = request.getParameter("st");
	if (st != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
		boolean f = dao2.updateStatus(st, id);
		if (f) {
			session.setAttribute("succMsg", "order status updated");
			response.sendRedirect("orders.jsp");
		}
	}
	%>