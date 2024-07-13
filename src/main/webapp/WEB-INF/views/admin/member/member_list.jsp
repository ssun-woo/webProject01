<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberAll.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<div align="center">
	<hr color="green" width="300">
	<h2>ȸ �� �� ��</h2>
	<hr color="green" width="300">
	<table border="0" width="100%" class="outline">
		<tr>
			<th class="m3">��ȣ</th>
			<th class="m3">�̸�</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">����</th>
		</tr>
	<c:if test="${empty listMember}">
		<tr>
			<td colspan="7">��ϵ�(ã���ô�) ȸ���� �����ϴ�.</td>		
		</tr>
	</c:if>
	<c:forEach var="dto" items="${listMember}">
		<tr>
			<td>${dto.no}</td>
			<td>${dto.name}</td>
			<td>${dto.id}</td>
			<td>${dto.email}</td>
			<td>${dto.allHp}</td>
			<td>${dto.joindate}</td>
			<td>
				<a href="member_delete.do?no=${dto.no}">����</a>
			</td>
		</tr>
	</c:forEach>	
</table>
	<form name="f" method="post" action="member_find.do">
		<select name="search">
			<option value="id">���̵�</option>
			<option value="name">�̸�</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
	</form>
</div>
<%@ include file="../bottom.jsp"%>