<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="mall_top.jsp"%>
<script type="text/javascript">
	function goCart(){
		document.go.action="mall_cartAdd.do"
		document.go.submit()
	}
	function goOrder(){
		document.go.action="mall_order.do"
		document.go.submit()
	}
</script>
<table width="99%" class="outline">
	<tr class="m1">
		<td colspan="2" align="center">
			<b>[${pdto.pname}] 상품 정보</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="resources/img/${pdto.pimage}" width="200" height="200" border="0">
		</td>
		<td class="m3">
			<form name="go" method="post">
				상품번호 : ${pdto.pnum}<br>				
				상품이름 : ${pdto.pname}<br>
				상품가격 : <font color="red">${pdto.price}</font>원<br>
				상품포인트 : <font color="red">[${pdto.point}]</font>point<br>
				상품갯수 : <input type="text" name="pqty" size="3" value="1">개<br><br>
				<input type="hidden" name="pnum" value="${pdto.pnum}">
				<input type="hidden" name="select" value="${param.select}">
				<a href="javascript:goCart()">장바구니</a>
				<a href="javascript:goOrder()">즉시구매</a>
			</form>	
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="left">
			<b>상품 상세 설명</b><br>
			${pdto.pcontents}
		</td>
	</tr>		
</table>
<%@ include file="mall_bottom.jsp"%>