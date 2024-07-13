<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../top.jsp" %>
<%@ include file="mall_top.jsp"%>  
<div style="overflow:auto; width:600px; height:400px;">
<table width="99%" class="outline" align="center">
	<tr class="m2"> 
		<td colspan="6" align="center">
			<h4>장바구니 보기</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="10%">번호</th>
		<th width="30%">상품명</th>
		<th width="10%">수량</th>
		<th width="20%">단가</th>
		<th width="20%">금액</th>
		<th width="10%">삭제</th>
	</tr>	

	<c:if test="${empty cartL}">
	<tr>
		<td colspan="6">장바구니가 비었습니다.</td>
	</tr>
	</c:if>
	<c:forEach var="cart" items="${cartL}">
	<tr>
		<td align="center" class="m3">${cart.pnum}</td>
		<td align="center" class="m3">
			<img src="resources/img/${cart.pimage}" width="40" height="40"><br>
			<b>${cart.pname}</b>
		</td>
		<td align="center" class="m3">
			<form name="f" method="post" action="mall_cartEdit.do">
				<br>
				<input type="text" size="2" name="pqty" value="${cart.pqty}">
				<input type="hidden" name="pnum" value="${cart.pnum}">
				<input type="submit" value="수정">
			</form>			
		</td>
		<td align="right" class="m3">
			<b>${cart.price}원<br>
			[${cart.point}] point</b>
		</td>	
		<td align="right" class="m3">
			<font color="red">
			<b>${cart.price*cart.pqty}원<br>
			[${cart.pqty*cart.point}] point</b>
			</font>
		</td>
		<td align="center" class="m3">
			<a href="mall_cartDel.do?pnum=${cart.pnum}">삭제</a>	
		</td>
	</tr>	
	</c:forEach>		
	<tr class="m1">
		<td colspan="4"><b>장바구니 총액</b> : 
			<font color="red">${totalPrice}원<br></font>
			<font color="green">총 적립 포인트 : [${totalPoint}] point</font>	
		</td>
		<td colspan="2">
			<a href="mall_order.do">[주문하기]</a>
			<a href="mall.do">[계속쇼핑]</a>
		</td>
	</tr>			
</table>	
</div>
<%@ include file="mall_bottom.jsp"%>










