<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
.error {
	color: red;
}
</style>

<link rel="stylesheet" href="all_component/card.css">
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="wrapper">
		<h4 class="text-uppercase text-center">Payment Details</h4>
		<form class="form mt-4" id="cardform" novalidate
			action="order_confirm.jsp">

			<div class="form-group">
				<label for="card" class="text-uppercase">card number</label>
				<div class="card-number">
					<input type="text" class="card-no" name="cno"
						placeholder="1234 4567 5869 1234"> <span class="">
						<img
						src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-marcus-samuelsson-group-2.png"
						alt="" width="30" height="30">
					</span>
				</div>
			</div>
			<div class="d-flex w-100">
				<div class="d-flex w-50 pr-sm-4">
					<div class="form-group">
						<label for="expiry" class="text-uppercase">exp.date</label> <input
							name="dt" type="text" class="form-control" placeholder="03/2020">
					</div>
				</div>
				<div class="d-flex w-50 pl-sm-5 pl-3">
					<div class="form-group">
						<label for="cvv">CVV</label> <a href="#"
							title="CVV is a credit or debit card number, the last three digit number printed on the signature panel">what's
							this</a> <input name="cvv" type="password" class="form-control pr-5">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="text-uppercase">name on the card</label> <input
					name="cname" type="text" class="form-control">
			</div>
			<%
			String amount = request.getParameter("ta");
			%>
			<div class="form-group">
				<label for="name" class="text-uppercase">Total Amount</label> <input
					name="" type="text" class="form-control" value="<%=amount%>"
					readonly>
			</div>

			<div class="my-3">
				<input type="submit" value="Pay Now"
					class="text-uppercase btn btn-primary btn-block p-3">
			</div>
			<div id="form-footer">
				<p>By placing your order, you agree to our</p>
				<p>
					<a href="#">privacy notice</a> & <a href="#">terms of use</a>.
				</p>
			</div>

			<%
			String username = request.getParameter("un");
			String email = request.getParameter("em");
			String phno = request.getParameter("ph");
			String address = request.getParameter("ad");
			%>

			<input type="hidden" value="<%=username%>" name="username"> <input
				type="hidden" value="<%=email%>" name="email"> <input
				type="hidden" value="<%=phno%>" name="phno"> <input
				type="hidden" value="<%=address%>" name="address">

		</form>
	</div>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/card.js"></script>
</body>
</html>