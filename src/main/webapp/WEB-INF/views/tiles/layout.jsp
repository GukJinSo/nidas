<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<title></title>
<!-- bootstrap.min css -->
<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
<!-- Themefisher Icon font -->
<link rel="stylesheet" href="/plugins/themefisher-font/style.css">
<!-- Animate css -->
<link rel="stylesheet" href="/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="/plugins/slick/slick.css">
<link rel="stylesheet" href="/plugins/slick/slick-theme.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/test.css">
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>