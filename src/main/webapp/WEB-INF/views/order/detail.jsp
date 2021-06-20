<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<h2>Thông tin đơn hàng</h2>
<form:form action="/order/checkout" modelAttribute="order">
	<div class="form-group">
		<label>Order Id</label>
		<form:input path="id" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Customer</label>
		<form:input path="customer.id" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Order Date</label>
		<form:input path="orderDate" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Address</label>
		<form:input path="address" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Total Amount</label>
		<form:input path="amount" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Notes</label>
		<form:textarea path="description" row="3" class="form-control" readonly="true"/>
	</div>
</form:form>

<h2>Chi tiết đơn hàng</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>UnitPrice</th>
			<th>Discount(%)</th>
			<th>Quantity</th>
			<th>Amount</th>
			<th></th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="d" items="${details}">
			<tr>
				<td>${d.product.id}</td>
				<td>${d.product.name}</td>
				<td>${d.unitPrice}</td>
				<td>${d.discount}</td>
				<td>${d.quantity}</td>
				<td>${(d.quantity*d.unitPrice)-((d.quantity*d.unitPrice) * d.discount)/100}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
