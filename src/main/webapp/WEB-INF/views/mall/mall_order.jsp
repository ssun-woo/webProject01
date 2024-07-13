<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_order.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../top.jsp" %>
<%@ include file="mall_top.jsp"%>  
<div style="overflow:auto; width:600px; height:400px;">
<table width="99%" class="outline" align="center">
	<tr class="m2"> 
		<td colspan="4" align="center">
			<h4>결재 내역서 보기</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="50%">상품명</th>
		<th width="20%">단가</th>
		<th width="10%">수량</th>
		<th width="20%">금액</th>
	</tr>	

	<c:forEach var="cart" items="${order}">
	<tr>
		<td align="center" class="m3">
			<b>${cart.pname}</b>
		</td>
		<td align="right" class="m3">
			${cart.price}원
		</td>	
		<td align="right" class="m3">
			${cart.pqty}개
		</td>
		<td align="right" class="m3">
			${cart.price*cart.pqty}원
		</td>
	</tr>	
	</c:forEach>		
	<tr class="m1">
		<td colspan="3"><b>결재하실 총액</b> : 
			<font color="red">${totalPrice}원</font>
			<font color="green">(총 적립 포인트 : [${totalPoint}] point)</font>
		</td>
		<td align="right">	
			<input type="button" value="결재하기" onclick="window.location='mall_order_ok.do'">	
		</td>
	</tr>			
</table>	
</div>
<%@ include file="mall_bottom.jsp"%>