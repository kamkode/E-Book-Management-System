<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-1">

		<h3 class="text-center text-primary">Your Order</h3>
		<div class="card">
			<div class="card-body">
				<table class="table table-striped mt-3">
					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">ISBN No</th>
							<th scope="col">Price</th>
							<th scope="col">Payment Type</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						User u = (User) session.getAttribute("userobj");
						BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
						List<Book_Order> blist = dao.getBook(u.getEmail());
						for (Book_Order b : blist) {
						%>
						<tr>
							<th scope="row"><%=b.getOrderId()%></th>
							<td><%=b.getUserName()%></td>
							<td><%=b.getBookName()%></td>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getIsbn()%></td>
							<td><%=b.getPrice()%></td>
							<td><%=b.getPaymentType()%></td>
							<td>
								<%
								if ("Order delivered".equals(b.getOrderStatus())) {
								%>
								<button class="btn btn-sm btn-success ml-2">
									<i class="fa fa-check-circle" aria-hidden="true"></i>
									<%=b.getOrderStatus()%></button> <%
 } else {
 %> <%=b.getOrderStatus()%>
							</td>
						</tr>
						<%
						}
						}
						%>




					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>