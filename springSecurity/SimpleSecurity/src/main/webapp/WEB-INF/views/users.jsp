<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>List of Users</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
</head>
<body>
<fieldset>
    <legend>List of Users</legend>
	<nav role="navigation">
	    <ul>
	        <li><a href="<c:url value="/home"/> ">Home</a></li>
	        <li><a href="<c:url value="/user/add"/> ">Add a new user</a></li>
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
		    <c:forEach var="user" items="${users}" varStatus="i">
		    <tr bgcolor="${i.count % 2!=0 ? '#ffffcc' : '#ccffff' }">
		    	<td>${user.fullName}</td>
		        <td><a href="<c:url value="/user/${user.id}"/> ">${user.email}</a></td>
		        <td>${user.profile}</td>
		        <td>
		        	<fmt:formatDate var="dtSaida" value="${user.lastLogin}" 
						type="BOTH" dateStyle="DEFAULT" timeStyle="DEFAULT"/>
					<c:out value="${dtSaida}" />
				</td>
		    </tr>
		    </c:forEach>
	    </tbody>
	</table>
</fieldset>
</body>
</html>