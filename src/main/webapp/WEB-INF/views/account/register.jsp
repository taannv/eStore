<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div>
<h2><s:message code="lyt.register.header"/></h2>
<h4>${message}</h4>
<form:form action="/account/register" modelAttribute="form" enctype="multipart/form-data">
	<div class="form-group">
		<label>UserName</label>
		<form:input path="id" class="form-control"/>
		<form:errors path="id"/>
	</div>
	<div class="form-group">
		<label>Password</label>
		<form:input path="password" class="form-control"/>
		<form:errors path="password"/>
	</div>
	<div class="form-group">
		<label>FullName</label>
		<form:input path="fullName" class="form-control"/>
		<form:errors path="fullName"/>
	</div>
	<div class="form-group">
		<label>Email</label>
		<form:input path="email" class="form-control"/>
		<form:errors path="email"/>
	</div>
	<div class="form-group">
		<label>Photo</label>
		<input type="file" name="photo_file">
		<form:hidden path="photo" class="form-control"/>
	</div>
	<div class="form-group">
		<button class="btn btn-default">Register</button>
	</div>
</form:form>
</div>