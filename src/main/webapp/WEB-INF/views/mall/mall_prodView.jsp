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
			<b>[${pdto.pname}] ��ǰ ����</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="resources/img/${pdto.pimage}" width="200" height="200" border="0">
		</td>
		<td class="m3">
			<form name="go" method="post">
				��ǰ��ȣ : ${pdto.pnum}<br>				
				��ǰ�̸� : ${pdto.pname}<br>
				��ǰ���� : <font color="red">${pdto.price}</font>��<br>
				��ǰ����Ʈ : <font color="red">[${pdto.point}]</font>point<br>
				��ǰ���� : <input type="text" name="pqty" size="3" value="1">��<br><br>
				<input type="hidden" name="pnum" value="${pdto.pnum}">
				<input type="hidden" name="select" value="${param.select}">
				<a href="javascript:goCart()">��ٱ���</a>
				<a href="javascript:goOrder()">��ñ���</a>
			</form>	
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="left">
			<b>��ǰ �� ����</b><br>
			${pdto.pcontents}
		</td>
	</tr>		
</table>
<%@ include file="mall_bottom.jsp"%>