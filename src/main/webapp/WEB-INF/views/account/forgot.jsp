<%@ page pageEncoding="utf-8"%>

<h2>Quên mật khẩu</h2>
<h4>${message}</h4>
<form action="/account/forgot" method="post">
	<div class="form-group">
		<label>UserName</label>
		<input name="id" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Email</label>
		<input name="email" class="form-control"/>
	</div>
	
	<div class="form-group">
		<button class="btn btn-default">Retrieve Password</button>
	</div>
</form>