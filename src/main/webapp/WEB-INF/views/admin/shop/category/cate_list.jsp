<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<table border="1" width="500">
		<caption>ī �� �� �� �� ��</caption><br>
		<tr bgcolor="yellow">
			<th width="10%">��ȣ</th>
			<th width="30%">ī�װ��ڵ�</th>
			<th width="50%">ī�װ��̸�</th>
			<th width="10%">����</th>
		</tr>
	<c:if test="${empty listCate}">
		<tr>
			<td colspan="4">
				��ϵ� ī�װ��� �����ϴ�.
			</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${listCate}">
		<tr>
			<td align="right">${dto.cnum}</td>	
			<td align="center">${dto.code}</td>
			<td align="center">${dto.cname}</td>
			<td align="center">
				<a href="cate_delete.do?cnum=${dto.cnum}">����</a>
			</td>	
		</tr>
	</c:forEach>				
	</table>
</div>	
<%@ include file = "../bottom.jsp" %>









