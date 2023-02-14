<%--
  Created by IntelliJ IDEA.
  User: hanna
  Date: 2/14/2023
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order</title>
</head>
<body>
<form>
  <h2>Product Information</h2>
  <label for="pid">Product ID: </label><input type="text" name="pid" id="pid">
  <br>
  <label for="quantity">Quantity: </label><input type="number" min="1" value="1" id="quantity" name="quantity">
  <br>
  <h2>Billing Information</h2>
  <table>
    <tr>
      <td>
        <label for="fName">First Name: </label> <br>
        <input type="text" id="fName" name="fName">
      </td>
      <td>
        <label for="lName">Last Name: </label><br>
        <input type="text" id="lName" name="lName">
      </td>
    </tr>
  </table>
  <br>
  <label for="ccNum">Credit Card Number: </label><br>
  <input type="text" id="ccNum" name="ccNum">
  <br>
  <label for="billingAddr">Billing Address: </label><br>
  <input type="text" id="billingAddr" name="billingAddr">
  <br>
  <!--<label for="sameAddr">Shipping Address same as Billing: </label><input type="checkbox" id="sameAddr">-->
  <br>
  <label for="phone">Phone: </label><br>
  <input type="text" id="phone" name="phone">
  <br>
  <fieldset>
    <legend>Shipping Method</legend>
    <div>
      <input type="radio" id="Standard" name="Standard">
      <label for="Standard">Standard (7 days)</label>

      <input type="radio" id="2-day" name="2-day">
      <label for="2-day">2-Day</label>

      <input type="radio" id="overnight" name="overnight">
      <label for="overnight">Overnight</label>
    </div>
  </fieldset>

  <button type="submit">Submit</button>
</form>
<link rel="stylesheet" href="FormStyle.css"/>
</body>
</html>
