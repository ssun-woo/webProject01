<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ include file="../top.jsp" %>    
<%@ include file="mall_top.jsp" %>
<div style="overflow:auto; width:600px; height:400px;">
	<h3>Welcome to My Mall</h3> 
	<c:if test="${empty hit}">
		<b>HIT상품이 없습니다</b><br>
	</c:if>
	<c:if test="${not empty hit}">
	<hr color="green" width="80%">
	<font color="red" size="3">HIT</font>
	<hr color="green" width="80%">
	<br>
		<table width="100%" align="center">
			<tr>
				<c:forEach var="dto" items="${hit}">
				<td align="center">
					<a href="mall_prodView.do?pnum=${dto.pnum}&select=HIT">
						<img src="resources/img/${dto.pimage}" width="80" height="60" border="0"><br>
					</a>	
					${dto.pname}<br>
					<font color="red">${dto.price}</font>원<br>
					<font color="blue">[${dto.point}]</font>point
				</td>	
				</c:forEach>
			</tr>
		</table>
	</c:if>
	<c:if test="${empty best}">
		<b>BEST상품이 없습니다</b><br>
	</c:if>
	<c:if test="${not empty best}">
	<hr color="green" width="80%">
	<font color="red" size="3">BEST</font>
	<hr color="green" width="80%">
	<br>
		<table width="100%" align="center">
			<tr>
				<c:forEach var="dto" items="${best}">
				<td align="center">
					<a href="mall_prodView.do?pnum=${dto.pnum}&select=BEST">
						<img src="resources/img/${dto.pimage}" width="80" height="60" border="0"><br>
					</a>	
					${dto.pname}<br>
					<font color="red">${dto.price}</font>원<br>
					<font color="blue">[${dto.point}]</font>point
				</td>	
				</c:forEach>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty pnew}">
	<hr color="green" width="80%">
	<font color="red" size="3">NEW</font>
	<hr color="green" width="80%">
	<br>
		<table width="100%" align="center">
			<tr>
				<c:forEach var="dto" items="${pnew}">
				<td align="center">
					<a href="mall_prodView.do?pnum=${dto.pnum}&select=NEW">
						<img src="resources/img/${dto.pimage}" width="80" height="60" border="0"><br>
					</a>	
					${dto.pname}<br>
					<font color="red">${dto.price}</font>원<br>
					<font color="blue">[${dto.point}]</font>point
				</td>	
				</c:forEach>
			</tr>
		</table>
	</c:if>
</div>	
<%@ include file="mall_bottom.jsp"%>
		
			
			
			
			
			
			
			
			
			
			