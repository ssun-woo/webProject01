<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="overflow:auto; width:800px; height:400px;">
<form name="f" action="prod_update.do" 
							method="post" enctype="multipart/form-data">
	<table class="outline" width="600">
		<caption>상품수정</caption>
		<tr>
			<th class="m2">카테고리</th>
			<td align="left">
				<input type="text" name="pcategory_fk" 
								value="${getProduct.pcategory_fk}" disabled>			
			</td>
		</tr>
		<tr>
			<th class="m2">상품번호</th>
			<td align="left">${getProduct.pnum}
			<input type="hidden" name="pnum" value="${getProduct.pnum}" />
			</td>
		</tr>
		<tr>
			<th class="m2">상품명</th>
			<td align="left"><input type="text" name="pname" value="${getProduct.pname}"></td>
		</tr>
		<tr>
			<th class="m2">제조회사</th>
			<td align="left"><input type="text" name="pcompany" value="${getProduct.pcompany}"></td>
		</tr>
		<tr>
			<th class="m2">상품이미지</th>
			<td align="left">
				<img src="resources/img/${getProduct.pimage}" width="80" height="80">
				<input type="file" name="pimage">
				<input type="hidden" name="pimage2" value="${getProduct.pimage}">
			</td>
		</tr>
		<tr>
			<th class="m2">상품수량</th>
			<td align="left"><input type="text" name="pqty" value="${getProduct.pqty}"></td>
		</tr>
		<tr>
			<th class="m2">상품가격</th>
			<td align="left"><input type="text" name="price" value="${getProduct.price}"></td>
		</tr>
		<tr>
		<th class="m2">상품스팩</th>
			<td align="left">
			<select name="pspec">
				<c:forTokens var="spec" items="none,HIT,NEW,BEST" delims=",">
					<c:if test="${spec == getProduct.pspec}">
						<option value=${spec}" selected>${spec}</option>
					</c:if>
					<c:if test="${spec != getProduct.pspec}">
						<option value="${spec}">${spec}</option>
					</c:if>
				</c:forTokens>
			</select>
			</td>	
		</tr>
		<tr>
			<th class="m2">상품소개</th>
			<td align="left">
				<textarea name="pcontents" rows="5" cols="50">${getProduct.pcontents}</textarea>
			</td>
		</tr>
		<tr>
			<th class="m2">상품포인트</th>
			<td align="left"><input type="text" name="point" value="${getProduct.point}"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="상품수정">
				<input type="reset" value="취소">
			</td>
		</tr>			
	</table>
</form>
</div>
<%@ include file="../bottom.jsp" %>
