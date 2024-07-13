<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"> 
	function checkDel(pnum, pimage){
		var isDel = window.confirm("������ �����Ͻðڽ��ϱ�?");
		if (isDel){
			document.del.pnum.value = pnum
			document.del.pimage.value = pimage
			document.del.submit()
		}
	}
</script>
	<div style="overflow:auto; width:800px; height:400px;">
		<table  class="outline" width="99%">
			<tr bgcolor="yellow">
				<th>��ȣ</th>
				<th>��ǰ�ڵ�</th>
				<th>��ǰ��</th>
				<th>�̹���</th>
				<th>����</th>
				<th>������</th>
				<th>����</th>
				<th>����|����</th>
			</tr>
		<c:if test="${empty listProduct}">
			<tr>
				<td colspan="8">��ϵ� ��ǰ�� �����ϴ�.</td>
			</tr>	
		</c:if>	
		<c:forEach var="dto" items="${listProduct}">
			<tr>
				<td>${dto.pnum}</td>
				<td>${dto.pcategory_fk}</td>
				<td>${dto.pname}</td>
				<td>
					<a href="prod_view.do?pnum=${dto.pnum}">
						<img src="resources/img/${dto.pimage}" width="40" height="40">
					</a>
				</td>
				<td>${dto.price}</td>
				<td>${dto.pcompany}</td>
				<td>${dto.pqty}</td>
				<td>
					<a href="prod_update.do?pnum=${dto.pnum}">����</a>|
					<a href="javascript:checkDel('${dto.pnum}', '${dto.pimage}')">����</a>
				</td>
			</tr>
		</c:forEach>	 	
		</table>
	</div>
<form name="del" action="prod_delete.do" method="post">
	<input type="hidden" name="pnum">
	<input type="hidden" name="pimage">
</form>	
<%@ include file="../bottom.jsp" %>










