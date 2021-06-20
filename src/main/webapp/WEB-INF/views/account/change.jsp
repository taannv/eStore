<%@ page pageEncoding="utf-8"%>

<h2>Đổi mật khẩu</h2>
<h4>${message}</h4>
<form action="/account/change" method="post">
	<div class="form-group">
		<label>UserName</label>
		<input name="id" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Current Password</label>
		<input name="pw" class="form-control"/>
	</div>
	<div class="form-group">
		<label>New Password</label>
		<input name="pw1" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Confirm New Password</label>
		<input name="pw2" class="form-control"/>
	</div>
	<div class="form-group">
		<button class="btn btn-default">Change</button>
	</div>
</form>