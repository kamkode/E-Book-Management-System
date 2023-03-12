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
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<c:if test="${not empty failedMsg }">
			<h5 class="text-center text-danger">${failedMsg}</h5>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<c:if test="${not empty succMsg }">
			<h5 class="text-center text-success">${succMsg}</h5>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							-----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a data-toggle="modal" data-target="#categoryModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
							<h4>Category</h4>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-danger"></i></i><br>
							<h4>All Books</h4>
							-----------
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4 mt-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="feedback.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-danger"></i></i><br>
							<h4>Review</h4>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							-----------
						</div>
					</div>
				</a>
			</div>



		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You want logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div>
						<form action="home.jsp">
							<div class="form-group">
								<label>Category Name</label> <input type="text" name="cn"
									class="form-control">
							</div>
							<button class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- end logout modal -->

	<div style="margin-top: 130px;">
		<%@include file="footer.jsp"%></div>

	<%
	String cn = request.getParameter("cn");
	if (cn != null) {
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.addCategory(cn);
		if (f) {
			session.setAttribute("succMsg", "Category Add Successfully");
			response.sendRedirect("home.jsp");
		}
	}
	%>
</body>
</html>