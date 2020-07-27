<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="productTest" class="beanTest.ProductTest"/>
<jsp:setProperty name="productTest" property="*"/>
<html>
<head>
    <title>productTestMainSub</title>
    <style>
        td {
            border: 1px solid black;
        }

        img {
            width: 500px;
            height: 500px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<div class="wrap">
    <table>
        <tr>
            <td>
                productID
            </td>
            <td>
                <%=productTest.getProductID()%>
            </td>
        </tr>
        <tr>
            <td>
                productName
            </td>
            <td>
                <%=productTest.getProductName()%>
            </td>
        </tr>
        <tr>
            <td>
                productType
            </td>
            <td>
                <%=productTest.getProductType()%>
            </td>
        </tr>
        <tr>
            <td>
                productPrice
            </td>
            <td>
                <%=productTest.getProductPrice()%>
            </td>
        </tr>
        <tr>
            <td>
                productWarehouse
            </td>
            <td>
                <%=productTest.getProductWarehouse()%>
            </td>
        </tr>
    </table>
    <img src=<%=productTest.getProductPath()%> alt="">
</div>
</body>
</html>
