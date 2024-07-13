<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>프로젝트</title>
	<link rel="stylesheet" type="text/css" href="resources/style.css">
</head>
<body>
	<div align="center">
	<table width="800" height="500">
		<tr>
			<td align="right">
			<c:if test="${empty mdto}">
			<a href="index.do">메인페이지</a>
				<a href="login.do">로그인</a>
			</c:if>
			<c:if test="${not empty mdto}">
				${mdto.name}님 로그인 중...
				<c:if test="${mdto.name=='admin'}">
					<a href="admin_index.do">관리자페이지</a>
				</c:if>	
				<a href="index.do">메인페이지</a>
				<a href="logout.do">로그아웃</a>
				<a href="myreport.do?no=${mdto.no}">내정보</a>
			</c:if>	 
				<a href="mall.do">쇼핑몰</a>
				<a href="board2_list.do">게시판</a>
				<a href="company.do">회사소개</a>
			</td>
		</tr>
		<tr>
			<td>