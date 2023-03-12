<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 p-5">
				<div class="card paint-card">
					<div class="card-body">
						<h4 class="text-center">Forgot Password</h4>
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="" method="post">
							<div class="form-group">
								<label>Enter Email</label> <input type="text"
									class="form-control" name="email">
							</div>

							<div class="form-group">
								<label>Enter Phone Number</label> <input type="text"
									class="form-control" name="phno">
							</div>
							<div class="text-center">
								<button class="btn btn-primary col-md-6">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%
	String email = request.getParameter("email");
	String phno = request.getParameter("phno");

	if (email != null && phno != null) {
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
		if (dao.checkPasswordAuthen(email, phno)) {
			response.sendRedirect("changepassword.jsp?email=" + email + "&&phno=" + phno);

		} else {
			session.setAttribute("failedMsg", "invalid details");
			response.sendRedirect("forgot.jsp");
		}
	}
	%>


</body>
</html>