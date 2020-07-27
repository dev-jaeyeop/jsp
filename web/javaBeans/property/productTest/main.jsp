<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오전 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>productTestMain</title>
    <style>
        td {
            border: 1px solid black;
            align-content: center;
        }

        tr:last-child {
            text-align: center;
        }
    </style>
</head>
<body>
<form action="sub.jsp" method="post">
    <div class="wrap">
        product registration
        <table>
            <tr>
                <td>
                    productID
                </td>
                <td>
                    <input type="text" name="productID">
                </td>
            </tr>
            <tr>
                <td>
                    productName
                </td>
                <td>
                    <input type="text" name="productName">
                </td>
            </tr>
            <tr>
                <td>
                    productType
                </td>
                <td>
                    <input type="text" name="productType">
                </td>
            </tr>
            <tr>
                <td>
                    productPrice
                </td>
                <td>
                    <input type="text" name="productPrice">
                </td>
            </tr>
            <tr>
                <td>
                    productPath
                </td>
                <td>
                    <input type="text" name="productPath">
                </td>
            </tr>
            <tr>
                <td>
                    productWarehouse
                </td>
                <td>
                    <input type="text" name="productWarehouse">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="registration">
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
