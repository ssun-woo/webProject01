<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../top.jsp" %>
<%@ include file="mall_top.jsp"%>
<div align="center" style="overflow:auto; width:600px; height:400px;">
<h3>Welcome to My Mall</h3> 
	<c:if test="${empty code}">
		<b>${param.cname} 카테고리에 상품이 없습니다</b><br>
	</c:if>
	<c:if test="${not empty code}">
	<hr color="green" width="80%">
	<font color="red" size="3">${param.cname}</font>
	<hr color="green" width="80%">
	<table width="99%" border="0" align="center">
		<tr>
		<c:set var="count" value="0"/>
		<c:forEach var="dto" items="${code}">
			<td align="center">
				<a href="mall_prodView.do?pnum=${dto.pnum}&select=${param.code}">
				<img src="resources/img/${dto.pimage}" width="80" height="60" border="0"><br>
				</a>
				${dto.pname}<br>
				<font color="red">${dto.price}</font>원<br>
				<font color="blue">${dto.point}</font>point
			</td>
		<c:set var="count" value="${count+1}"/>
		<c:if test="${count%3==0}">
			</tr><tr>
		</c:if>
		</c:forEach>	
		</tr>
	</table>	
	</c:if>
</div>
<%@ include file="mall_bottom.jsp"%>