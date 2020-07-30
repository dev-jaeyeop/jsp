<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-29
  Time: 오후 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user_number_tag</title>
</head>
<body>
<c:set var="price" value="10000"/>
<fmt:formatNumber value="${price}" type="number" var="numberType"/>
currency: <fmt:formatNumber value="${price}" type="currency" currencySymbol="$"/>
<br>
percent: <fmt:formatNumber value="${price}" type="percent" groupingUsed="false"/>
<br>
number: ${numberType}
<br>
pattern: <fmt:formatNumber value="${price}" pattern="00000000.00"/>
</body>
</html>
