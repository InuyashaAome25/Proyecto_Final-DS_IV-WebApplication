<%--
  Created by IntelliJ IDEA.
  User: mary arosemena
  Date: 12/06/2023
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BASE_DE_DATOS.*" %>

<html>
<head>
    <title>Desconectar </title>
</head>
<body>
<% session.removeAttribute("usuarioguardado");
    session.invalidate();
    response.sendRedirect("Login.jsp"); %>
</body>
</html>
