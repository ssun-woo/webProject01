<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sales_list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<div align="center">
	<hr color="green" width="300">
	<h2>�� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<table border="0" width="100%" class="outline">
		<tr>
			<th class="m3">�Ǹ��Ͻ�</th>
			<th class="m3">�̸�</th>
			<th class="m3">��ǰ��</th>
			<th class="m3">����</th>
			<th class="m3">�ܰ�</th>
			<th class="m3">�ݾ�</th>
		</tr>
	<c:if test="${empty salesList}">
		<tr>
			<td colspan="7">���� ������ �����ϴ�</td>		
		</tr>
	</c:if>
	<c:forEach var="dto" items="${salesList}">
		<tr>
			<td align="center">${dto.sales_date}</td>
			<td align="center">${dto.mdto.name}</td>
			<td align="center">${dto.pdto.pname}</td>
			<td align="right">${dto.pqty}</td>
			<td align="right">${dto.pdto.price}</td>
			<td align="right">${dto.pdto.price * dto.pqty}</td>
		</tr>
	</c:forEach>	
</table>
<form name="f" action="searchSales.do" method="post">
	<select name="search">
		<option value="indate">�Ǹ��Ͻ�</option>
		<option value="name">�̸�</option>
		<option value="pname">��ǰ��</option>	
	</select>
	<input type="text" name="searchString">
	<input type="submit" value="��ȸ">
</form>
</div>
<%@ include file="../bottom.jsp"%>