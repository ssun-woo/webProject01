<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>������Ʈ</title>
	<link rel="stylesheet" type="text/css" href="resources/style.css">
</head>
<body>
	<div align="center">
	<table width="800" height="500">
		<tr>
			<td align="right">
			<c:if test="${empty mdto}">
			<a href="index.do">����������</a>
				<a href="login.do">�α���</a>
			</c:if>
			<c:if test="${not empty mdto}">
				${mdto.name}�� �α��� ��...
				<c:if test="${mdto.name=='admin'}">
					<a href="admin_index.do">������������</a>
				</c:if>	
				<a href="index.do">����������</a>
				<a href="logout.do">�α׾ƿ�</a>
				<a href="myreport.do?no=${mdto.no}">������</a>
			</c:if>	 
				<a href="mall.do">���θ�</a>
				<a href="board2_list.do">�Խ���</a>
				<a href="company.do">ȸ��Ұ�</a>
			</td>
		</tr>
		<tr>
			<td>