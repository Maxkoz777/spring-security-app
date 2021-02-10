<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>

<h2>Home page</h2>
<hr/>
Welcome to Home Page!

<hr>

<!-- Displaying username & role -->

<p>
    User: <security:authentication property="principal.username"/>
    <br><br>
    Role(s): <security:authentication property="principal.authorities"/>
</p>

<hr>

<security:authorize access="hasRole('MANAGER')">

<!-- link to /leaders -->

<p>
    <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
    (Only for Manager peeps)
</p>

<hr>

</security:authorize>

<security:authorize access="hasRole('ADMIN')">

<!-- link to /systems -->

<p>
    <a href="${pageContext.request.contextPath}/systems">IT System Meeting</a>
    (Only for Admin peeps)
</p>

<hr>

</security:authorize>

<!-- Adding logout button -->

<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout"/>
</form:form>

</body>
</html>
