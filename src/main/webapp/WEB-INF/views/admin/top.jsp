<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>ShopAdmin</title>
	<link rel="stylesheet" type="text/css" href="resources/style.css">
</head>
<body>
	<div align="center">
		<font size="5">관리자페이지</font><br>
		<font size="2">
			<a href="admin_index.do">관리자홈</a> | 
			<a href="index.do">메인페이지</a></font>
		<table border="1" width="800" height="500">
			<tr height="10%">
				<th width="20%">
					<a href="member_list.do">회원목록보기</a>
				</th>
				<th width="20%">
					<a href="shop_admin.do">상품관리</a>
				</th>
				<th width="20%">
					<a href="board2_list.do">게시글관리</a>
				</th>
				<th width="20%">
					<a href="sales_list.do">매출관리</a>
				</th>
			</tr>
			<tr height="80%">
				<td colspan="5">