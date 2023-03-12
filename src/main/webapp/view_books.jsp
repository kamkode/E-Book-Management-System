<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.entity.Feedback"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">

		<c:if test="${not empty addCart }">
			<p class="alert alert-success text-center" role="alert">${addCart }</p>
			<c:remove var="addCart" scope="session" />
		</c:if>

		<c:if test="${not empty failed }">
			<p class="text-center text-danger">${failed }</p>
			<c:remove var="failed" scope="session" />
		</c:if>

		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white paint-card">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 250px; width: 200px"><br>

			</div>

			<div class="col-md-6  p-5 border bg-white paint-card">
				<h4 class="fs-3"><%=b.getBookName()%></h4>
				<h5 class="mt-2">Book Details :</h5>
				<p>
					ISBN NO :
					<%=b.getIsbn()%>
					<br> Author :
					<%=b.getAuthor()%>
					<br> Category :
					<%=b.getBookCategory()%>

				</p>
				<p class="fs-5 fw-bold">
					Price :&nbsp; &nbsp; &nbsp; &nbsp;<i class="fas fa-rupee-sign"></i>
					<%=b.getPrice()%>
				</p>

				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>


				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fas fa-cart-plus"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%
				} else {
				%>
				<div class=" text-center p-3">
					<%
					if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-primary btn-sm ml-2 col-md-12"><i
						class="fas fa-cart-plus"></i> Add Cart</a>
					<%
					} else {
					%>
					<a
						href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&&ca=<%=b.getBookCategory()%>"
						class="btn btn-primary btn-sm ml-2 col-md-12"><i
						class="fas fa-cart-plus"></i> Add Cart</a>
					<%
					}
					%>

				</div>
				<%
				}
				%>
			</div>


		</div>
	</div>

	<div class="container p-0">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<h5 class="text-center">Review</h5>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<form action="saveFeedback" method="post">
						<div class="form-group">
							<label>Comment</label>
							<textarea rows="3" cols="" name="comment" class="form-control"></textarea>
						</div>

						<input type="hidden" name="bid" value="<%=bid%>">
						<%
						if (u != null) {
						%>
						<input type="hidden" name="uid" value="<%=u.getId()%>">
						<%
						}
						%>

						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-primary">Publish</a>
						<%
						} else {
						%>
						<button class="btn btn-primary">Publish</button>
						<%
						}
						%>

					</form>
					<hr>

					<%
					BookDAO dao2 = new BookDAOImpl(DBConnect.getConn());
					UserDAO dao3 = new UserDAOImpl(DBConnect.getConn());
					List<Feedback> list = dao2.getAllFeedbackByBook(bid);
					for (Feedback fed : list) {
						User usx = dao3.getUserById(fed.getUserId());
					%>
					<div class="row">
						<div class="col-md-12">
							<i class="fas fa-user-circle fa-2x"></i> <span class="ml-3 "
								style="font-size: 20px;"><%=usx.getName()%></span>

						</div>
						<div class="col-md-12 mt-1"><%=fed.getComment()%></div>
					</div>
					<hr>
					<%
					}
					%>



				</div>
			</div>
		</div>

	</div>


</body>
</html>