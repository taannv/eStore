<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="/slideshow/css/style.css"/>
<head>
	<title>Administrator</title>
	<tiles:insertAttribute name="head"/>
</head>
<body>

	<div class="container">
		<header class="row" style="margin:1px 1px">
			<h1 class="alert alert-success" style="text-align: center;">Administrator</h1>
		</header>
		<nav class="row" style="margin:1px 1px">
			<tiles:insertAttribute name="menu"/>
		</nav>
		<div class="row">
			<article class="col-sm-12">
				<tiles:insertAttribute name="body"/>
			</article>
		</div>
		<footer class="row">
			<p class="text-center"> Footer ! Administrator .</p>
		</footer>
	</div>

</body>
</html>