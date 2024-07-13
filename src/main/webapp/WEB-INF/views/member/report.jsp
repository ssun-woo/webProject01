<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<title>내정보수정</title>
<script type="text/javascript">
	function check(){
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return
		}
		document.f.submit()
	}
</script>
<div align="center">
	<form name="f" method="post" action="member_update.do">
		<input type="hidden" name="no" value="${mdto.no}"/>
		<table width="600" align="center" class="outline">
			<tr>
				<td colspan="4" align=center class="m2">내정보수정</td>
			</tr>
			<tr>
				<td width="100" class="m3">이름</td>
				<td class="m3" colspan="3">
					<input type="text" name="name" class="box"
					value="${mdto.name}" readOnly>
				</td>
			</tr>
			<tr>	
				<td width="100" class="m3">아이디</td>
				<td class="m3" width="200">
					<input type="text" name="id" class="box"
					value="${mdto.id}" readOnly>
				</td>
				<td width="100" class="m3">비밀번호</td>
				<td class="m3">
					<input type="password" name="passwd" class="box"
					value="${mdto.passwd}">
				</td>
			</tr>
			<tr>
				<td width="100" class="m3">주민번호</td>
				<td class="m3" colspan="3">
					<input type="text" name="ssn1" class="box"
					value="${mdto.ssn1}" readOnly> -
				<input type="password" name="ssn2" class="box"
					value="${mdto.ssn2}" readOnly>
					</td>
			</tr>
			<tr>
				<td width="100" class="m3">이메일</td>
				<td class="m3" width="200">
					<input type="text" name="email" class="box"
					value="${mdto.email}">
				</td>
				<td width="100" class="m3">연락처</td>
				<td class="m3" width="200">
					<input type="text" name="hp1" class="box"
					maxlength="3" size="2" value="${mdto.hp1}"> -
					<input type="text" name="hp2" class="box"
					maxlength="4" size="3" value="${mdto.hp2}"> -
					<input type="text" name="hp3" class="box"
					maxlength="4" size="3" value="${mdto.hp3}">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<a href="javascript:check()">[전송]</a>
					<a href="#">[취소]</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<hr color="red" width="600">
	<div style="overflow:auto; height:400px;" align="center">
	<h2>구 매 내 역 서</h2>
	<table border="0" width="600" class="outline" >
		<tr>
			<th class="m3">판매일시</th>
			<th class="m3">상품명</th>
			<th class="m3">상품코드</th>
			<th class="m3">수량</th>
			<th class="m3">단가</th>
			<th class="m3">금액</th>
		</tr>
	<c:if test="${empty salesList}">
		<tr>
			<td colspan="7">매출 정보가 없습니다</td>		
		</tr>
	</c:if>
	<c:forEach var="dto" items="${salesList}">
		<tr>
			<td align="center">${dto.sales_date}</td>
			<td align="center">${dto.pdto.pname}</td>
			<td align="center">${dto.pdto.pcategory_fk}</td>
			<td align="right">${dto.pqty}</td>
			<td align="right">${dto.pdto.price}</td>
			<td align="right">${dto.pdto.price * dto.pqty}</td>
		</tr>
	</c:forEach>
	</table>
</div>
<%@ include file="../bottom.jsp"%>