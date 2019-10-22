<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adicionar novo Usuário</title>
</head>
<body>
	<fieldset>
		<legend>Criar novo usuário</legend>
		<nav role="navigation">
			<ul>
				<li><a href="<c:url value="/home" />">Home</a>
			</ul>
		</nav>

		<c:url var="save" value="/user/save" />

		<form:form modelAttribute="user" action="${save}" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<table>
				<tr>
					<td>Nome Completo:</td>
					<td><form:input path="fullName" type="name" reqquired="true" autofocus="true" /></td>
				</tr>

				<tr>
					<td>Email:</td>
					<td><form:input path="email" type="email" reqquired="true" /></td>
				</tr>

				<tr>
					<td>Senha:</td>
					<td><form:input path="password" type="password" required="true" /></td>
				</tr>

				<tr>
					<td>Confirmar Senha:</td>
					<td><form:input path="passwordRepeated" type="password" required="true" /></td>
				</tr>

				<tr>
					<td>Perfil</td>
					<td><form:select path="profile" required="true">
							<form:option value="ROLE_ADMIN" label="ADMIN" />
							<form:option value="ROLE_USER" label="USER" />
						</form:select></td>
				</tr>
				<tr>
					<td><button type="submit">Salvar</button></td>
				</tr>
			</table>
		</form:form>
		<c:if test="${not empty error}">
			<p>
				<font color="red">${error}</font>
			</p>
		</c:if>
	</fieldset>
</body>
</html>