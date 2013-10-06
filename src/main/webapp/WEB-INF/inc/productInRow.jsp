<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
	<c:forEach var="prod" items="${param.products}">
	<tr>
		<td width="8%"><img src="images/${prod.icon}" width="40" height="21" /></td>
		<td width="20%">${prod.name}</td>
		<td width="65%">${prod.desc}</td>
		<td width="7%"><a href="viewProduct?productId=${prod.id}" target="_blank">查看</a></td>
	</tr>
	</c:forEach>
</table>