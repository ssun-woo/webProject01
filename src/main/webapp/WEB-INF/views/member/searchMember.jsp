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
			<h2>�� �� �� ã ��</h2>
		</c:if>
		<c:if test="${param.mode == 'pw'}">
			<h2>�� �� �� ȣ ã ��</h2>
		</c:if>
		<hr color="green" width="300">
		<form name="f" action="searchMember_ok.do" method="post">
			<table border="0" width="500" class="outline">
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td><input type="text" name="ssn1" maxlength="6" class="box"> -
					<input type="password" name="ssn2" maxlength="7" class="box"></td>
				</tr>	
			<c:if test="${param.mode == 'pw'}">
				<tr>
					<th>���̵�</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>
			</c:if>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="��ȸ">
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>