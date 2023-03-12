<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.error {
	color: red;
}

.paint-card {
	box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.3);
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

						<%
						String email = request.getParameter("email");
						String phno = request.getParameter("phno");
						%>
						<h4 class="text-center">Change Password</h4>

						<form action="forgot" method="post" id="register">
							<div class="form-group">
								<label>Enter new Password</label> <input type="text" id="pass"
									class="form-control" name="password">
							</div>

							<div class="form-group">
								<label>Confirm password</label> <input type="password"
									class="form-control" name="cpassword">
							</div>

							<input type="hidden" name="email" value="<%=email%>"> <input
								type="hidden" name="phno" value="<%=phno%>">

							<div class="text-center">
								<button class="btn btn-primary col-md-6">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>