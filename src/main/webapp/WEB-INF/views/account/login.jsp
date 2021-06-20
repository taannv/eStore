<%@ page pageEncoding="utf-8"%>

<h2>Đăng nhập</h2>
<h4>${message}</h4>
<form action="/account/login" method="post">
	<div class="form-group">
		<label>UserName</label>
		<input name="id" class="form-control" value="${uid}"/>
	</div>
	<div class="form-group">
		<label>Password</label>
		<input name="pw" class="form-control" value="${pwd}"/>
	</div>
	<div class="form-group">
		<div class="form-control">
			<input name="rm" type="checkbox"/>
			<label>Remember me?</label>
		</div>
	</div>
	<div class="form-group">
		<button class="btn btn-default">Login</button>
	</div>
</form>