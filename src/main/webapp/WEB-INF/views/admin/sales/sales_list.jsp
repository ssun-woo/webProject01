<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sales_list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<div align="center">
	<hr color="green" width="300">
	<h2>매 출 정 보 보 기</h2>
	<hr color="green" width="300">
	<table border="0" width="100%" class="outline">
		<tr>
			<th class="m3">판매일시</th>
			<th class="m3">이름</th>
			<th class="m3">상품명</th>
			<th class="m3">수량</th>
			<th class="m3">단가</th>
			<th class="m3">금액</th>
		</tr>
	<c:if test="${empty salesList}">
		<tr>
			<td colspan="7">매출 정보가 없습니다</td>		
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
		<option value="indate">판매일시</option>
		<option value="name">이름</option>
		<option value="pname">상품명</option>	
	</select>
	<input type="text" name="searchString">
	<input type="submit" value="조회">
</form>
</div>
<%@ include file="../bottom.jsp"%>