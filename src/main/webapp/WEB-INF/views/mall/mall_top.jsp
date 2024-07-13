<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>���θ�Ȩ</title>
	<link rel="stylesheet" type="text/css" href="resources/style.css">
	<script type="text/javascript">
		function cateList(code, cname){
			document.f.code.value = code
			document.f.cname.value = cname
			document.f.submit()
		}
	</script>
</head>
<body>
	<form name="f" action="mall_cgProdList.do" method="post">
		<input type="hidden" name="code">
		<input type="hidden" name="cname">
	</form>
	<table border="1" align="center" width="800">
		<tr height="50">
			<td colspan="2" align="center">
				<c:if test="${mdto.name == 'admin'}">
					<a href="admin_index.do">������Ȩ</a> |
				</c:if>
				<a href="mall.do">���θ�Ȩ</a> |
				<a href="mall_cartList.do">��ٱ���</a> |
				<a href="company.do">ȸ��Ұ�</a>
			</td>
		</tr>
		<tr height="400">
			<td width="20%" align="center" valign="top">
				tree/view
				<table width="99%" align="center" border="1">
				<c:forEach var="dto" items="${listCate}">
					<tr>
						<td>
							<a href="javascript:cateList('${dto.code}','${dto.cname}')">
								${dto.cname}[${dto.code}]
							</a>
						</td>
					</tr>
				</c:forEach>
				</table>
			</td>
			<td align="center">