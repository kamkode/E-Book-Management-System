<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.entity.Feedback"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Feedback</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">All Review</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container-fluid">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">User Name</th>
					<th scope="col">Review</th>
				</tr>
			</thead>
			<tbody>
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

				List<Feedback> list = dao.getAllFeedbackByBook(id);

				UserDAO dao2 = new UserDAOImpl(DBConnect.getConn());
				BookDAO dao3 = new BookDAOImpl(DBConnect.getConn());

				int i = 0;

				for (Feedback f : list) {
					User user = dao2.getUserById(f.getUserId());
					BookDtls book = dao3.getBookById(f.getBookId());
					i++;
				%>
				<tr>
					<td><%=i%></td>
					<td><img src="../book/<%=book.getPhotoName()%>"
						style="width: 50px; height: 50Px;"></td>
					<td><%=book.getBookName()%></td>
					<td><%=user.getName()%></td>
					<td><%=f.getComment()%></td>

				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>
	<div style="margin-top: 430px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>