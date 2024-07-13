<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="overflow:auto; width:800px; height:400px;">
	<form name="f" action="prod_input.do" method="post" 
											enctype="multipart/form-data">
		<table class="outline" width="600">
			<caption>��ǰ���ī�װ�</caption>
			<tr>
				<th class="m2">ī�װ�</th>
				<td align="left">
					<select name="pcategory_fk">
					<c:forEach var="dto" items="${listCate}">
						<option value="${dto.code}">${dto.cname}[${dto.code}]</option>
					</c:forEach>					
					</select>
				</td>
			</tr>
			<tr>
				<th class="m2">��ǰ��</th>
				<td align="left"><input type="text" name="pname"></td>
			</tr>
			<tr>
				<th class="m2">��ǰ�ڵ�</th>
				<td align="left"><input type="text" name="pcode"></td>
			</tr>
			<tr>
				<th class="m2">����ȸ��</th>
				<td align="left"><input type="text" name="pcompany"></td>
			</tr>
			<tr>
				<th class="m2">��ǰ�̹���</th>
				<td align="left"><input type="file" name="pimage"></td>
			</tr>
			<tr>
				<th class="m2">��ǰ����</th>
				<td align="left"><input type="text" name="pqty"></td>
			</tr>
			<tr>
				<th class="m2">��ǰ����</th>
				<td align="left"><input type="text" name="price"></td>
			</tr>
			<tr>
				<th class="m2">��ǰ����</th>
				<td align="left">
					<select name="pspec">
						<option value="none" selected>::NORMAL::</option>
						<option value="HIT">HIT</option>
						<option value="NEW">NEW</option>
						<option value="BEST">BEST</option>
					</select>
				</td>	
			</tr>
			<tr>
				<th class="m2">��ǰ�Ұ�</th>
				<td align="left">
					<textarea name="pcontents" rows="5" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th class="m2">��ǰ����Ʈ</th>
				<td align="left"><input type="text" name="point"></td>
			</tr>
			<tr>
				<td colspan="2" class="m1">
					<input type="submit" value="��ǰ���">
					<input type="reset" value="���">
				</td>
			</tr>			
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>









