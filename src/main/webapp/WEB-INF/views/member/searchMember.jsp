<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- searchMember.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<c:if test="${param.mode == 'id'}">
			<h2>아 이 디 찾 기</h2>
		</c:if>
		<c:if test="${param.mode == 'pw'}">
			<h2>비 밀 번 호 찾 기</h2>
		</c:if>
		<hr color="green" width="300">
		<form name="f" action="searchMember_ok.do" method="post">
			<table border="0" width="500" class="outline">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" maxlength="6" class="box"> -
					<input type="password" name="ssn2" maxlength="7" class="box"></td>
				</tr>	
			<c:if test="${param.mode == 'pw'}">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>
			</c:if>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="조회">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>