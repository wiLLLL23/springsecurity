<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Detalhes do usuário</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
</head>
<body>
<fieldset>
    <legend>Detalhes do usuário</legend>
    <nav role="navigation">
        <ul>
            <li><a href="<c:url value="/home"/> ">Home</a></li>
        </ul>
    </nav>

    <table>
        <thead>
        <tr bgcolor="#ccccff">
            <th>Nome Completo</th>
            <th>E-mail</th>
            <th>Perfil</th>
            <th>Último Acesso</th>
        </tr>
        </thead>
        <tbody>
            <tr bgcolor="#ccffff">
                <td>${user.fullName}</td>
                <td>${user.email}</td>
                <td>${user.profile}</td>
                <td>
                    <fmt:formatDate var="dtSaida" value="${user.lastLogin}"
                        type="BOTH" dateStyle="DEFAULT" timeStyle="DEFAULT"/>
                    <c:out value="${dtSaida}" />
                </td>
            <tr>
        </tbody>
    </table>
</fieldset>
</body>
</html>