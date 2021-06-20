<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Discount</th>
			<th>Quantity</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${details}">
			<tr>
				<td>${e.product.id}</td>
				<td>${e.product.name}</td>
				<td>${e.unitPrice}</td>
				<td>${e.discount}</td>
				<td>${e.quantity}</td>
				<td>${(e.quantity*e.unitPrice)-((e.quantity*e.unitPrice) * e.discount)/100}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>