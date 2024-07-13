<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<table border="1" width="500">
		<caption>카 테 고 리 목 록</caption><br>
		<tr bgcolor="yellow">
			<th width="10%">번호</th>
			<th width="30%">카테고리코드</th>
			<th width="50%">카테고리이름</th>
			<th width="10%">삭제</th>
		</tr>
	<c:if test="${empty listCate}">
		<tr>
			<td colspan="4">
				등록된 카테고리가 없습니다.
			</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${listCate}">
		<tr>
			<td align="right">${dto.cnum}</td>	
			<td align="center">${dto.code}</td>
			<td align="center">${dto.cname}</td>
			<td align="center">
				<a href="cate_delete.do?cnum=${dto.cnum}">삭제</a>
			</td>	
		</tr>
	</c:forEach>				
	</table>
</div>	
<%@ include file = "../bottom.jsp" %>









