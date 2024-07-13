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
			<h4>���� ������ ����</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="50%">��ǰ��</th>
		<th width="20%">�ܰ�</th>
		<th width="10%">����</th>
		<th width="20%">�ݾ�</th>
	</tr>	

	<c:forEach var="cart" items="${order}">
	<tr>
		<td align="center" class="m3">
			<b>${cart.pname}</b>
		</td>
		<td align="right" class="m3">
			${cart.price}��
		</td>	
		<td align="right" class="m3">
			${cart.pqty}��
		</td>
		<td align="right" class="m3">
			${cart.price*cart.pqty}��
		</td>
	</tr>	
	</c:forEach>		
	<tr class="m1">
		<td colspan="3"><b>�����Ͻ� �Ѿ�</b> : 
			<font color="red">${totalPrice}��</font>
			<font color="green">(�� ���� ����Ʈ : [${totalPoint}] point)</font>
		</td>
		<td align="right">	
			<input type="button" value="�����ϱ�" onclick="window.location='mall_order_ok.do'">	
		</td>
	</tr>			
</table>	
</div>
<%@ include file="mall_bottom.jsp"%>