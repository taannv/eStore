<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="/slideshow/css/style.css"/>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />
<div class="panel panel-default">
	 <div class="panel-heading">
	 	<s:message code="lyt.cart.title"/>
	 </div>
	 
	 <div class="panel-body">
		<img id="cart-img" src="/static/images/cart.jpg" class="col-sm-5">
		
		<ul class="col-sm-7">
			<li><b id="cart-cnt">${cart.count}</b><s:message code="lyt.aside.item"/></li>
			<li><b id="cart-amt">
				<f:formatNumber value="${cart.amount}" pattern="###,###,###.00"/>
			</b>$</li>
			<li>
				<a href="/cart/view"><s:message code="lyt.aside.view"/></a>
			</li>
		</ul>
	</div>
</div>

<div class="panel panel-default">
	 <div class="panel-heading"><s:message code="lyt.aside.search"/></div>
	 
	 <div class="panel-body">
		<form action="/product/list-by-keywords" method="post">
			<input value="${param.keywords}" name="keywords" class="form-control" placeholder="Keywords">
		</form>
	</div>
</div>

<div class="panel panel-default">
	 <div class="panel-heading">
	 	<s:message code="lyt.cate.title"/>
	 </div>
	 
	 <div class="list-group">
	 <c:set value="${pageContext.response.locale.language}" var="lang"/>
	 <c:forEach var="c" items="${cates}">
		<a href="/product/list-by-category/${c.id}" class="list-group-item">${(lang=='vi')?c.nameVN:c.name}</a> 
		</c:forEach>
	</div>
</div>

<div class="panel panel-default">
	 <div class="panel-heading"><s:message code="lyt.aside.special"/></div>
	 
	 <div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item"><s:message code="lyt.aside.new"/></a>
		<a href="/product/list-by-special/1" class="list-group-item"><s:message code="lyt.aside.selling"/></a>
		<a href="/product/list-by-special/2" class="list-group-item"><s:message code="lyt.aside.views"/></a>
		<a href="/product/list-by-special/3" class="list-group-item"><s:message code="lyt.aside.discount"/></a>
		<a href="/product/list-by-special/4" class="list-group-item"><s:message code="lyt.aside.specials"/></a>
	</div>
</div>

<style id="cart_css">
	
</style>