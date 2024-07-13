<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../top.jsp" %>
<%@ include file="mall_top.jsp"%>  
<div style="overflow:auto; width:600px; height:400px;">
<table width="99%" class="outline" align="center">
	<tr class="m2"> 
		<td colspan="6" align="center">
			<h4>��ٱ��� ����</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="10%">��ȣ</th>
		<th width="30%">��ǰ��</th>
		<th width="10%">����</th>
		<th width="20%">�ܰ�</th>
		<th width="20%">�ݾ�</th>
		<th width="10%">����</th>
	</tr>	

	<c:if test="${empty cartL}">
	<tr>
		<td colspan="6">��ٱ��ϰ� ������ϴ�.</td>
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
				<input type="submit" value="����">
			</form>			
		</td>
		<td align="right" class="m3">
			<b>${cart.price}��<br>
			[${cart.point}] point</b>
		</td>	
		<td align="right" class="m3">
			<font color="red">
			<b>${cart.price*cart.pqty}��<br>
			[${cart.pqty*cart.point}] point</b>
			</font>
		</td>
		<td align="center" class="m3">
			<a href="mall_cartDel.do?pnum=${cart.pnum}">����</a>	
		</td>
	</tr>	
	</c:forEach>		
	<tr class="m1">
		<td colspan="4"><b>��ٱ��� �Ѿ�</b> : 
			<font color="red">${totalPrice}��<br></font>
			<font color="green">�� ���� ����Ʈ : [${totalPoint}] point</font>	
		</td>
		<td colspan="2">
			<a href="mall_order.do">[�ֹ��ϱ�]</a>
			<a href="mall.do">[��Ӽ���]</a>
		</td>
	</tr>			
</table>	
</div>
<%@ include file="mall_bottom.jsp"%>










